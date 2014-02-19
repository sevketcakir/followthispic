#line 1 "G:/Projeler/mikroc/qtrmotor/qtrmotor.c"
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


void Kalibrasyon(unsigned EEPROMYaz)
{

 unsigned short portbson;
 int ToplamSure=0;
 unsigned short i=0,j=0;
 unsigned short degerler[10][8];
 unsigned short Tasma=0xCF;
 unsigned short adres=0;


 for(i=0;i<10;i++)
 for(j=0;j<8;j++)
 {
 degerler[i][j]=0;
 }

 for(i=0;i<10;i++)
 {
 TRISB=0x00;
 PORTB=0xFF;
 Delay_us(20);
 TRISB=0xFF;
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
 Tasma=0xFC;
 degerler[i][7]=Tasma;
 break;
 }
 }
 }
 if(EEPROMYaz)
 {

 for(i=0;i<10;i++)
 for(j=0;j<8;j++)
 {
 EEPROM_Write(adres++,degerler[i][j]);
 }

 EEPROM_Write(adres++,Tasma);
 EEPROM_Write(adres++,0xBA);
 }

}

void main() {
int BeyazSensorSayisi=0;
unsigned Motor1Carpan;
unsigned Motor2Carpan;
unsigned int BeyazDongu=0;
double SonSiyahSensorOrt;

BaslangicTest();



TRISC=0x00;
PORTC=0x00;
TRISB=0x00;
PORTB=0xFF;
Delay_us(20);

PWM1_Init(3000);
PWM1_Start();
PWM2_Init(3000);
PWM2_Start();

for(;;)
{
TRISB=0x00;
PORTB=0xFF;
Delay_us(20);
TRISB=0xFF;
Delay_ms(1);


BeyazSensorSayisi=~PORTB.B0+~PORTB.B1+~PORTB.B2+~PORTB.B3+~PORTB.B4+~PORTB.B5+~PORTB.B6+~PORTB.B7;

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

Motor1Carpan=255*(tanh(sensorort-2.5)+1)/2.0;
Motor2Carpan=255*(1-tanh(sensorort-6.5))/2.0;
if(BeyazSensorSayisi>0)
{

 PWM1_Set_Duty(Motor1Carpan);
 PWM2_Set_Duty(Motor2Carpan);
 SonSiyahSensorOrt=sensorort;
 BeyazDongu=0;
}
else
{
 PWM1_Set_Duty(0);
 PWM2_Set_Duty(0);
 BeyazDongu++;
#line 174 "G:/Projeler/mikroc/qtrmotor/qtrmotor.c"
}
Delay_ms(20);
}

}
