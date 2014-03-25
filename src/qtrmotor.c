unsigned sensorler;
unsigned KalibreBeklemesi=1;
double sensorort;
int SensorDegerleri[8]={1,2,3,4,5,6,7,8};

void MotorPWMTest()
{
  int i,k;
 for(k=0;k<5;k++)
 for(i=0;i<256;i++)
 {
  PWM1_Set_Duty(i);
  PWM2_Set_Duty(i);
  Delay_ms(50);
 }
}

void BaslangicTest()
{
    int i;
    for(i=0;i<5;i++)
    {
    TRISC=0x00;
    PORTC=0xFF;
    Delay_ms(100);
    PORTC=0x00;
    Delay_ms(100);
    }
}

//Minimum ve maksimum zaman�
void Kalibrasyon(unsigned EEPROMYaz)
{
   //int BeklemeAraligi=100;//yemedi
   unsigned short portbson;
   int ToplamSure=0;
   unsigned short i=0,j=0;
   unsigned short degerler[10][8];//10 defa d�necek
   unsigned short Tasma=0xCF;//Ta�ma kontrol�
   unsigned short adres=0;//EEPROM adresi
   
   //Dizi i�eri�ini s�f�rla
   for(i=0;i<10;i++)
   for(j=0;j<8;j++)
   {
       degerler[i][j]=0;
   }
   
   for(i=0;i<10;i++)
   {
   TRISB=0x00;//B ��k��
   PORTB=0xFF;//Hepsi y�ksek
   Delay_us(20);
   TRISB=0xFF;//B giri�
   portbson=PORTB;
   j=0;
   ToplamSure=0;
   while(PORTB!=0)
   {
     if(portbson!=PORTB)
     {
       degerler[i][j++]=ToplamSure;
     }
     portbson=PORTB;
     Delay_us(400);
     ToplamSure+=1;
     if(ToplamSure>254)
     {
       Tasma=0xFC;//Ta�ma var
       degerler[i][7]=Tasma;
       break;
     }
     }
   }
   if(EEPROMYaz)
   {
     //EEPROM'a de�erleri yazma
     for(i=0;i<10;i++)
     for(j=0;j<8;j++)
     {
       EEPROM_Write(adres++,degerler[i][j]);
     }
     //EEPROM'a ta�may� yazma
     EEPROM_Write(adres++,Tasma);
     EEPROM_Write(adres++,0xBA);
   }

}

void main() {
unsigned int i;
int BeyazSensorSayisi=0;
unsigned Motor1Carpan;
unsigned Motor2Carpan;
unsigned int BeyazDongu=0;
double SonSiyahSensorOrt;
//Ba�lang�� ayarlar�
//BaslangicTest();

//Kalibrasyon(255);//255=true,0=false
//BaslangicTest();
TRISA=0x00;//A ��k��
for(i=0;i<10;i++)
{
  PORTA.B0=0;
  Delay_ms(200);
  PORTA.B0=1;
  Delay_ms(200);
}
TRISC=0x00;//C ��k��
PORTC=0x00;//Hepsi y�ksek
TRISB=0x00;//B ��k��
PORTB=0xFF;//Hepsi y�ksek
Delay_us(20);
//PWM ayarlar�n�n yap�lmas�
PWM1_Init(3000);
PWM1_Start();
PWM2_Init(3000);
PWM2_Start();

for(;;)
{
TRISB=0x00;//B ��k��
PORTB=0xFF;//Hepsi y�ksek
Delay_us(20);//Sens�r kondansat�rleri dolana kadar bekle
TRISB=0xFF;//B giri�
Delay_ms(1);//Kondansat�rlerin bo�almas� i�in gerekli miktarda bekle(Deneme yan�lma yoluyla bulunuyor. Kabirasyon ayarlar�nda EEPROM'a min ve max zamanlar yaz�l�yor.)

//sensorler=~PORTB;//Sens�rleri oku ve de�erleri bit baz�nda ters �evir.(1=BEYAZ,0=SIYAH)
BeyazSensorSayisi=~PORTB.B0+~PORTB.B1+~PORTB.B2+~PORTB.B3+~PORTB.B4+~PORTB.B5+~PORTB.B6+~PORTB.B7;//Beyaz g�ren sens�r say�s�n� belirle
//Beyaz sens�r say�s�na g�re ortalama bir de�er belirle
sensorort=0.0;
sensorort+=(~PORTB.B0)*SensorDegerleri[0];
sensorort+=(~PORTB.B1)*SensorDegerleri[1];
sensorort+=(~PORTB.B2)*SensorDegerleri[2];
sensorort+=(~PORTB.B3)*SensorDegerleri[3];
sensorort+=(~PORTB.B4)*SensorDegerleri[4];
sensorort+=(~PORTB.B5)*SensorDegerleri[5];
sensorort+=(~PORTB.B6)*SensorDegerleri[6];
sensorort+=(~PORTB.B7)*SensorDegerleri[7];
sensorort/=BeyazSensorSayisi;
//Tanjant hiperbolik fonksiyonunu kullanarak her iki motor i�in PWM de�eri belirle
Motor1Carpan=255*(tanh(sensorort-2.5)+1)/2.0;//(tanh(x-2.5)+1)/2
Motor2Carpan=255*(1-tanh(sensorort-6.5))/2.0;//(1-tanh(x-6.5))/2
if(BeyazSensorSayisi>0 && BeyazSensorSayisi<8)
{
  //PWM de�erini ayarla
  PWM1_Set_Duty(Motor1Carpan);
  PWM2_Set_Duty(Motor2Carpan);
  SonSiyahSensorOrt=sensorort;
  BeyazDongu=0;
  PORTA.B0=1;
}
else
{//Dur
  PWM1_Set_Duty(0);
  PWM2_Set_Duty(0);
  BeyazDongu++;
  if((BeyazDongu/12)%2==0)
     PORTA.B0=0;
  else
     PORTA.B0=1;
  
/*
  //D�nme i�lemi
  if(BeyazDongu>50)
  {
     if(SonSiyahSensorOrt>4.5)
     {
       PWM1_Set_Duty(255);
       PWM2_Set_Duty(0);
       Delay_ms(50);
     }
     else if(SonSiyahSensorOrt<4.5)
     {
       PWM1_Set_Duty(0);
       PWM2_Set_Duty(255);
       Delay_ms(50);
     }
     else
     {
       PWM1_Set_Duty(0);
       PWM2_Set_Duty(255);
       Delay_ms(50);
     }

  }
  */
}
Delay_ms(20);
}

}