
_MotorPWMTest:

;qtrmotor.c,6 :: 		void MotorPWMTest()
;qtrmotor.c,9 :: 		for(k=0;k<5;k++)
	CLRF       MotorPWMTest_k_L0+0
	CLRF       MotorPWMTest_k_L0+1
L_MotorPWMTest0:
	MOVLW      128
	XORWF      MotorPWMTest_k_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__MotorPWMTest43
	MOVLW      5
	SUBWF      MotorPWMTest_k_L0+0, 0
L__MotorPWMTest43:
	BTFSC      STATUS+0, 0
	GOTO       L_MotorPWMTest1
;qtrmotor.c,10 :: 		for(i=0;i<256;i++)
	CLRF       MotorPWMTest_i_L0+0
	CLRF       MotorPWMTest_i_L0+1
L_MotorPWMTest3:
	MOVLW      128
	XORWF      MotorPWMTest_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__MotorPWMTest44
	MOVLW      0
	SUBWF      MotorPWMTest_i_L0+0, 0
L__MotorPWMTest44:
	BTFSC      STATUS+0, 0
	GOTO       L_MotorPWMTest4
;qtrmotor.c,12 :: 		PWM1_Set_Duty(i);
	MOVF       MotorPWMTest_i_L0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;qtrmotor.c,13 :: 		PWM2_Set_Duty(i);
	MOVF       MotorPWMTest_i_L0+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;qtrmotor.c,14 :: 		Delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_MotorPWMTest6:
	DECFSZ     R13+0, 1
	GOTO       L_MotorPWMTest6
	DECFSZ     R12+0, 1
	GOTO       L_MotorPWMTest6
	DECFSZ     R11+0, 1
	GOTO       L_MotorPWMTest6
	NOP
	NOP
;qtrmotor.c,10 :: 		for(i=0;i<256;i++)
	INCF       MotorPWMTest_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       MotorPWMTest_i_L0+1, 1
;qtrmotor.c,15 :: 		}
	GOTO       L_MotorPWMTest3
L_MotorPWMTest4:
;qtrmotor.c,9 :: 		for(k=0;k<5;k++)
	INCF       MotorPWMTest_k_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       MotorPWMTest_k_L0+1, 1
;qtrmotor.c,15 :: 		}
	GOTO       L_MotorPWMTest0
L_MotorPWMTest1:
;qtrmotor.c,16 :: 		}
	RETURN
; end of _MotorPWMTest

_BaslangicTest:

;qtrmotor.c,18 :: 		void BaslangicTest()
;qtrmotor.c,21 :: 		for(i=0;i<5;i++)
	CLRF       R1+0
	CLRF       R1+1
L_BaslangicTest7:
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__BaslangicTest45
	MOVLW      5
	SUBWF      R1+0, 0
L__BaslangicTest45:
	BTFSC      STATUS+0, 0
	GOTO       L_BaslangicTest8
;qtrmotor.c,23 :: 		TRISC=0x00;
	CLRF       TRISC+0
;qtrmotor.c,24 :: 		PORTC=0xFF;
	MOVLW      255
	MOVWF      PORTC+0
;qtrmotor.c,25 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_BaslangicTest10:
	DECFSZ     R13+0, 1
	GOTO       L_BaslangicTest10
	DECFSZ     R12+0, 1
	GOTO       L_BaslangicTest10
	DECFSZ     R11+0, 1
	GOTO       L_BaslangicTest10
	NOP
	NOP
;qtrmotor.c,26 :: 		PORTC=0x00;
	CLRF       PORTC+0
;qtrmotor.c,27 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_BaslangicTest11:
	DECFSZ     R13+0, 1
	GOTO       L_BaslangicTest11
	DECFSZ     R12+0, 1
	GOTO       L_BaslangicTest11
	DECFSZ     R11+0, 1
	GOTO       L_BaslangicTest11
	NOP
	NOP
;qtrmotor.c,21 :: 		for(i=0;i<5;i++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;qtrmotor.c,28 :: 		}
	GOTO       L_BaslangicTest7
L_BaslangicTest8:
;qtrmotor.c,29 :: 		}
	RETURN
; end of _BaslangicTest

_Kalibrasyon:

;qtrmotor.c,32 :: 		void Kalibrasyon(unsigned EEPROMYaz)
;qtrmotor.c,36 :: 		int ToplamSure=0;
	CLRF       Kalibrasyon_ToplamSure_L0+0
	CLRF       Kalibrasyon_ToplamSure_L0+1
	CLRF       Kalibrasyon_i_L0+0
	CLRF       Kalibrasyon_j_L0+0
	MOVLW      207
	MOVWF      Kalibrasyon_Tasma_L0+0
	CLRF       Kalibrasyon_adres_L0+0
;qtrmotor.c,43 :: 		for(i=0;i<10;i++)
	CLRF       Kalibrasyon_i_L0+0
L_Kalibrasyon12:
	MOVLW      10
	SUBWF      Kalibrasyon_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Kalibrasyon13
;qtrmotor.c,44 :: 		for(j=0;j<8;j++)
	CLRF       Kalibrasyon_j_L0+0
L_Kalibrasyon15:
	MOVLW      8
	SUBWF      Kalibrasyon_j_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Kalibrasyon16
;qtrmotor.c,46 :: 		degerler[i][j]=0;
	MOVF       Kalibrasyon_i_L0+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      Kalibrasyon_degerler_L0+0
	ADDWF      R0+0, 1
	MOVF       Kalibrasyon_j_L0+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;qtrmotor.c,44 :: 		for(j=0;j<8;j++)
	INCF       Kalibrasyon_j_L0+0, 1
;qtrmotor.c,47 :: 		}
	GOTO       L_Kalibrasyon15
L_Kalibrasyon16:
;qtrmotor.c,43 :: 		for(i=0;i<10;i++)
	INCF       Kalibrasyon_i_L0+0, 1
;qtrmotor.c,47 :: 		}
	GOTO       L_Kalibrasyon12
L_Kalibrasyon13:
;qtrmotor.c,49 :: 		for(i=0;i<10;i++)
	CLRF       Kalibrasyon_i_L0+0
L_Kalibrasyon18:
	MOVLW      10
	SUBWF      Kalibrasyon_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Kalibrasyon19
;qtrmotor.c,51 :: 		TRISB=0x00;//B çýkýþ
	CLRF       TRISB+0
;qtrmotor.c,52 :: 		PORTB=0xFF;//Hepsi yüksek
	MOVLW      255
	MOVWF      PORTB+0
;qtrmotor.c,53 :: 		Delay_us(20);
	MOVLW      33
	MOVWF      R13+0
L_Kalibrasyon21:
	DECFSZ     R13+0, 1
	GOTO       L_Kalibrasyon21
;qtrmotor.c,54 :: 		TRISB=0xFF;//B giriþ
	MOVLW      255
	MOVWF      TRISB+0
;qtrmotor.c,55 :: 		portbson=PORTB;
	MOVF       PORTB+0, 0
	MOVWF      Kalibrasyon_portbson_L0+0
;qtrmotor.c,56 :: 		j=0;
	CLRF       Kalibrasyon_j_L0+0
;qtrmotor.c,57 :: 		ToplamSure=0;
	CLRF       Kalibrasyon_ToplamSure_L0+0
	CLRF       Kalibrasyon_ToplamSure_L0+1
;qtrmotor.c,58 :: 		while(PORTB!=0)
L_Kalibrasyon22:
	MOVF       PORTB+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Kalibrasyon23
;qtrmotor.c,60 :: 		if(portbson!=PORTB)
	MOVF       Kalibrasyon_portbson_L0+0, 0
	XORWF      PORTB+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Kalibrasyon24
;qtrmotor.c,62 :: 		degerler[i][j++]=ToplamSure;
	MOVF       Kalibrasyon_i_L0+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      Kalibrasyon_degerler_L0+0
	ADDWF      R0+0, 1
	MOVF       Kalibrasyon_j_L0+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       Kalibrasyon_ToplamSure_L0+0, 0
	MOVWF      INDF+0
	INCF       Kalibrasyon_j_L0+0, 1
;qtrmotor.c,63 :: 		}
L_Kalibrasyon24:
;qtrmotor.c,64 :: 		portbson=PORTB;
	MOVF       PORTB+0, 0
	MOVWF      Kalibrasyon_portbson_L0+0
;qtrmotor.c,65 :: 		Delay_us(400);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Kalibrasyon25:
	DECFSZ     R13+0, 1
	GOTO       L_Kalibrasyon25
	DECFSZ     R12+0, 1
	GOTO       L_Kalibrasyon25
	NOP
	NOP
;qtrmotor.c,66 :: 		ToplamSure+=1;
	INCF       Kalibrasyon_ToplamSure_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Kalibrasyon_ToplamSure_L0+1, 1
;qtrmotor.c,67 :: 		if(ToplamSure>254)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      Kalibrasyon_ToplamSure_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Kalibrasyon46
	MOVF       Kalibrasyon_ToplamSure_L0+0, 0
	SUBLW      254
L__Kalibrasyon46:
	BTFSC      STATUS+0, 0
	GOTO       L_Kalibrasyon26
;qtrmotor.c,69 :: 		Tasma=0xFC;//Taþma var
	MOVLW      252
	MOVWF      Kalibrasyon_Tasma_L0+0
;qtrmotor.c,70 :: 		degerler[i][7]=Tasma;
	MOVF       Kalibrasyon_i_L0+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      Kalibrasyon_degerler_L0+0
	ADDWF      R0+0, 1
	MOVLW      7
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVLW      252
	MOVWF      INDF+0
;qtrmotor.c,71 :: 		break;
	GOTO       L_Kalibrasyon23
;qtrmotor.c,72 :: 		}
L_Kalibrasyon26:
;qtrmotor.c,73 :: 		}
	GOTO       L_Kalibrasyon22
L_Kalibrasyon23:
;qtrmotor.c,49 :: 		for(i=0;i<10;i++)
	INCF       Kalibrasyon_i_L0+0, 1
;qtrmotor.c,74 :: 		}
	GOTO       L_Kalibrasyon18
L_Kalibrasyon19:
;qtrmotor.c,75 :: 		if(EEPROMYaz)
	MOVF       FARG_Kalibrasyon_EEPROMYaz+0, 0
	IORWF      FARG_Kalibrasyon_EEPROMYaz+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Kalibrasyon27
;qtrmotor.c,78 :: 		for(i=0;i<10;i++)
	CLRF       Kalibrasyon_i_L0+0
L_Kalibrasyon28:
	MOVLW      10
	SUBWF      Kalibrasyon_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Kalibrasyon29
;qtrmotor.c,79 :: 		for(j=0;j<8;j++)
	CLRF       Kalibrasyon_j_L0+0
L_Kalibrasyon31:
	MOVLW      8
	SUBWF      Kalibrasyon_j_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Kalibrasyon32
;qtrmotor.c,81 :: 		EEPROM_Write(adres++,degerler[i][j]);
	MOVF       Kalibrasyon_adres_L0+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       Kalibrasyon_i_L0+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      Kalibrasyon_degerler_L0+0
	ADDWF      R0+0, 1
	MOVF       Kalibrasyon_j_L0+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
	INCF       Kalibrasyon_adres_L0+0, 1
;qtrmotor.c,79 :: 		for(j=0;j<8;j++)
	INCF       Kalibrasyon_j_L0+0, 1
;qtrmotor.c,82 :: 		}
	GOTO       L_Kalibrasyon31
L_Kalibrasyon32:
;qtrmotor.c,78 :: 		for(i=0;i<10;i++)
	INCF       Kalibrasyon_i_L0+0, 1
;qtrmotor.c,82 :: 		}
	GOTO       L_Kalibrasyon28
L_Kalibrasyon29:
;qtrmotor.c,84 :: 		EEPROM_Write(adres++,Tasma);
	MOVF       Kalibrasyon_adres_L0+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       Kalibrasyon_Tasma_L0+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
	INCF       Kalibrasyon_adres_L0+0, 1
;qtrmotor.c,85 :: 		EEPROM_Write(adres++,0xBA);
	MOVF       Kalibrasyon_adres_L0+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      186
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
	INCF       Kalibrasyon_adres_L0+0, 1
;qtrmotor.c,86 :: 		}
L_Kalibrasyon27:
;qtrmotor.c,88 :: 		}
	RETURN
; end of _Kalibrasyon

_main:

;qtrmotor.c,90 :: 		void main() {
;qtrmotor.c,91 :: 		int BeyazSensorSayisi=0;
	CLRF       main_BeyazSensorSayisi_L0+0
	CLRF       main_BeyazSensorSayisi_L0+1
;qtrmotor.c,97 :: 		BaslangicTest();
	CALL       _BaslangicTest+0
;qtrmotor.c,101 :: 		TRISC=0x00;//C çýkýþ
	CLRF       TRISC+0
;qtrmotor.c,102 :: 		PORTC=0x00;//Hepsi yüksek
	CLRF       PORTC+0
;qtrmotor.c,103 :: 		TRISB=0x00;//B çýkýþ
	CLRF       TRISB+0
;qtrmotor.c,104 :: 		PORTB=0xFF;//Hepsi yüksek
	MOVLW      255
	MOVWF      PORTB+0
;qtrmotor.c,105 :: 		Delay_us(20);
	MOVLW      33
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
;qtrmotor.c,107 :: 		PWM1_Init(3000);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      104
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;qtrmotor.c,108 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;qtrmotor.c,109 :: 		PWM2_Init(3000);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      104
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;qtrmotor.c,110 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;qtrmotor.c,112 :: 		for(;;)
L_main35:
;qtrmotor.c,114 :: 		TRISB=0x00;//B çýkýþ
	CLRF       TRISB+0
;qtrmotor.c,115 :: 		PORTB=0xFF;//Hepsi yüksek
	MOVLW      255
	MOVWF      PORTB+0
;qtrmotor.c,116 :: 		Delay_us(20);//Sensör kondansatörleri dolana kadar bekle
	MOVLW      33
	MOVWF      R13+0
L_main38:
	DECFSZ     R13+0, 1
	GOTO       L_main38
;qtrmotor.c,117 :: 		TRISB=0xFF;//B giriþ
	MOVLW      255
	MOVWF      TRISB+0
;qtrmotor.c,118 :: 		Delay_ms(1);//Kondansatörlerin boþalmasý için gerekli miktarda bekle(Deneme yanýlma yoluyla bulunuyor. Kabirasyon ayarlarýnda EEPROM'a min ve max zamanlar yazýlýyor.)
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main39:
	DECFSZ     R13+0, 1
	GOTO       L_main39
	DECFSZ     R12+0, 1
	GOTO       L_main39
;qtrmotor.c,121 :: 		BeyazSensorSayisi=~PORTB.B0+~PORTB.B1+~PORTB.B2+~PORTB.B3+~PORTB.B4+~PORTB.B5+~PORTB.B6+~PORTB.B7;//Beyaz gören sensör sayýsýný belirle
	BTFSC      PORTB+0, 0
	GOTO       L__main47
	BSF        116, 1
	GOTO       L__main48
L__main47:
	BCF        116, 1
L__main48:
	BTFSC      PORTB+0, 1
	GOTO       L__main49
	BSF        116, 0
	GOTO       L__main50
L__main49:
	BCF        116, 0
L__main50:
	MOVLW      0
	BTFSC      116, 1
	MOVLW      1
	MOVWF      main_BeyazSensorSayisi_L0+0
	CLRF       main_BeyazSensorSayisi_L0+1
	CLRF       R0+0
	BTFSC      116, 0
	INCF       R0+0, 1
	MOVF       R0+0, 0
	ADDWF      main_BeyazSensorSayisi_L0+0, 1
	CLRF       main_BeyazSensorSayisi_L0+1
	BTFSC      STATUS+0, 0
	INCF       main_BeyazSensorSayisi_L0+1, 1
	BTFSC      PORTB+0, 2
	GOTO       L__main51
	BSF        3, 0
	GOTO       L__main52
L__main51:
	BCF        3, 0
L__main52:
	CLRF       R0+0
	BTFSC      3, 0
	INCF       R0+0, 1
	MOVF       R0+0, 0
	ADDWF      main_BeyazSensorSayisi_L0+0, 1
	BTFSC      STATUS+0, 0
	INCF       main_BeyazSensorSayisi_L0+1, 1
	BTFSC      PORTB+0, 3
	GOTO       L__main53
	BSF        3, 0
	GOTO       L__main54
L__main53:
	BCF        3, 0
L__main54:
	CLRF       R0+0
	BTFSC      3, 0
	INCF       R0+0, 1
	MOVF       R0+0, 0
	ADDWF      main_BeyazSensorSayisi_L0+0, 1
	BTFSC      STATUS+0, 0
	INCF       main_BeyazSensorSayisi_L0+1, 1
	BTFSC      PORTB+0, 4
	GOTO       L__main55
	BSF        3, 0
	GOTO       L__main56
L__main55:
	BCF        3, 0
L__main56:
	CLRF       R0+0
	BTFSC      3, 0
	INCF       R0+0, 1
	MOVF       R0+0, 0
	ADDWF      main_BeyazSensorSayisi_L0+0, 1
	BTFSC      STATUS+0, 0
	INCF       main_BeyazSensorSayisi_L0+1, 1
	BTFSC      PORTB+0, 5
	GOTO       L__main57
	BSF        3, 0
	GOTO       L__main58
L__main57:
	BCF        3, 0
L__main58:
	CLRF       R0+0
	BTFSC      3, 0
	INCF       R0+0, 1
	MOVF       R0+0, 0
	ADDWF      main_BeyazSensorSayisi_L0+0, 1
	BTFSC      STATUS+0, 0
	INCF       main_BeyazSensorSayisi_L0+1, 1
	BTFSC      PORTB+0, 6
	GOTO       L__main59
	BSF        3, 0
	GOTO       L__main60
L__main59:
	BCF        3, 0
L__main60:
	CLRF       R0+0
	BTFSC      3, 0
	INCF       R0+0, 1
	MOVF       R0+0, 0
	ADDWF      main_BeyazSensorSayisi_L0+0, 1
	BTFSC      STATUS+0, 0
	INCF       main_BeyazSensorSayisi_L0+1, 1
	BTFSC      PORTB+0, 7
	GOTO       L__main61
	BSF        3, 0
	GOTO       L__main62
L__main61:
	BCF        3, 0
L__main62:
	CLRF       R0+0
	BTFSC      3, 0
	INCF       R0+0, 1
	MOVF       R0+0, 0
	ADDWF      main_BeyazSensorSayisi_L0+0, 1
	BTFSC      STATUS+0, 0
	INCF       main_BeyazSensorSayisi_L0+1, 1
;qtrmotor.c,123 :: 		sensorort=0.0;
	CLRF       _sensorort+0
	CLRF       _sensorort+1
	CLRF       _sensorort+2
	CLRF       _sensorort+3
;qtrmotor.c,124 :: 		sensorort+=(~PORTB.B0)*SensorDegerleri[0];
	BTFSC      PORTB+0, 0
	GOTO       L__main63
	BSF        3, 0
	GOTO       L__main64
L__main63:
	BCF        3, 0
L__main64:
	CLRF       R0+0
	BTFSC      3, 0
	INCF       R0+0, 1
	MOVLW      0
	MOVWF      R0+1
	MOVF       _SensorDegerleri+0, 0
	MOVWF      R4+0
	MOVF       _SensorDegerleri+1, 0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	CALL       _Int2Double+0
	MOVF       R0+0, 0
	MOVWF      _sensorort+0
	MOVF       R0+1, 0
	MOVWF      _sensorort+1
	MOVF       R0+2, 0
	MOVWF      _sensorort+2
	MOVF       R0+3, 0
	MOVWF      _sensorort+3
;qtrmotor.c,125 :: 		sensorort+=(~PORTB.B1)*SensorDegerleri[1];
	BTFSC      PORTB+0, 1
	GOTO       L__main65
	BSF        3, 0
	GOTO       L__main66
L__main65:
	BCF        3, 0
L__main66:
	CLRF       R0+0
	BTFSC      3, 0
	INCF       R0+0, 1
	MOVLW      0
	MOVWF      R0+1
	MOVF       _SensorDegerleri+2, 0
	MOVWF      R4+0
	MOVF       _SensorDegerleri+3, 0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	CALL       _Int2Double+0
	MOVF       _sensorort+0, 0
	MOVWF      R4+0
	MOVF       _sensorort+1, 0
	MOVWF      R4+1
	MOVF       _sensorort+2, 0
	MOVWF      R4+2
	MOVF       _sensorort+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _sensorort+0
	MOVF       R0+1, 0
	MOVWF      _sensorort+1
	MOVF       R0+2, 0
	MOVWF      _sensorort+2
	MOVF       R0+3, 0
	MOVWF      _sensorort+3
;qtrmotor.c,126 :: 		sensorort+=(~PORTB.B2)*SensorDegerleri[2];
	BTFSC      PORTB+0, 2
	GOTO       L__main67
	BSF        3, 0
	GOTO       L__main68
L__main67:
	BCF        3, 0
L__main68:
	CLRF       R0+0
	BTFSC      3, 0
	INCF       R0+0, 1
	MOVLW      0
	MOVWF      R0+1
	MOVF       _SensorDegerleri+4, 0
	MOVWF      R4+0
	MOVF       _SensorDegerleri+5, 0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	CALL       _Int2Double+0
	MOVF       _sensorort+0, 0
	MOVWF      R4+0
	MOVF       _sensorort+1, 0
	MOVWF      R4+1
	MOVF       _sensorort+2, 0
	MOVWF      R4+2
	MOVF       _sensorort+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _sensorort+0
	MOVF       R0+1, 0
	MOVWF      _sensorort+1
	MOVF       R0+2, 0
	MOVWF      _sensorort+2
	MOVF       R0+3, 0
	MOVWF      _sensorort+3
;qtrmotor.c,127 :: 		sensorort+=(~PORTB.B3)*SensorDegerleri[3];
	BTFSC      PORTB+0, 3
	GOTO       L__main69
	BSF        3, 0
	GOTO       L__main70
L__main69:
	BCF        3, 0
L__main70:
	CLRF       R0+0
	BTFSC      3, 0
	INCF       R0+0, 1
	MOVLW      0
	MOVWF      R0+1
	MOVF       _SensorDegerleri+6, 0
	MOVWF      R4+0
	MOVF       _SensorDegerleri+7, 0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	CALL       _Int2Double+0
	MOVF       _sensorort+0, 0
	MOVWF      R4+0
	MOVF       _sensorort+1, 0
	MOVWF      R4+1
	MOVF       _sensorort+2, 0
	MOVWF      R4+2
	MOVF       _sensorort+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _sensorort+0
	MOVF       R0+1, 0
	MOVWF      _sensorort+1
	MOVF       R0+2, 0
	MOVWF      _sensorort+2
	MOVF       R0+3, 0
	MOVWF      _sensorort+3
;qtrmotor.c,128 :: 		sensorort+=(~PORTB.B4)*SensorDegerleri[4];
	BTFSC      PORTB+0, 4
	GOTO       L__main71
	BSF        3, 0
	GOTO       L__main72
L__main71:
	BCF        3, 0
L__main72:
	CLRF       R0+0
	BTFSC      3, 0
	INCF       R0+0, 1
	MOVLW      0
	MOVWF      R0+1
	MOVF       _SensorDegerleri+8, 0
	MOVWF      R4+0
	MOVF       _SensorDegerleri+9, 0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	CALL       _Int2Double+0
	MOVF       _sensorort+0, 0
	MOVWF      R4+0
	MOVF       _sensorort+1, 0
	MOVWF      R4+1
	MOVF       _sensorort+2, 0
	MOVWF      R4+2
	MOVF       _sensorort+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _sensorort+0
	MOVF       R0+1, 0
	MOVWF      _sensorort+1
	MOVF       R0+2, 0
	MOVWF      _sensorort+2
	MOVF       R0+3, 0
	MOVWF      _sensorort+3
;qtrmotor.c,129 :: 		sensorort+=(~PORTB.B5)*SensorDegerleri[5];
	BTFSC      PORTB+0, 5
	GOTO       L__main73
	BSF        3, 0
	GOTO       L__main74
L__main73:
	BCF        3, 0
L__main74:
	CLRF       R0+0
	BTFSC      3, 0
	INCF       R0+0, 1
	MOVLW      0
	MOVWF      R0+1
	MOVF       _SensorDegerleri+10, 0
	MOVWF      R4+0
	MOVF       _SensorDegerleri+11, 0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	CALL       _Int2Double+0
	MOVF       _sensorort+0, 0
	MOVWF      R4+0
	MOVF       _sensorort+1, 0
	MOVWF      R4+1
	MOVF       _sensorort+2, 0
	MOVWF      R4+2
	MOVF       _sensorort+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _sensorort+0
	MOVF       R0+1, 0
	MOVWF      _sensorort+1
	MOVF       R0+2, 0
	MOVWF      _sensorort+2
	MOVF       R0+3, 0
	MOVWF      _sensorort+3
;qtrmotor.c,130 :: 		sensorort+=(~PORTB.B6)*SensorDegerleri[6];
	BTFSC      PORTB+0, 6
	GOTO       L__main75
	BSF        3, 0
	GOTO       L__main76
L__main75:
	BCF        3, 0
L__main76:
	CLRF       R0+0
	BTFSC      3, 0
	INCF       R0+0, 1
	MOVLW      0
	MOVWF      R0+1
	MOVF       _SensorDegerleri+12, 0
	MOVWF      R4+0
	MOVF       _SensorDegerleri+13, 0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	CALL       _Int2Double+0
	MOVF       _sensorort+0, 0
	MOVWF      R4+0
	MOVF       _sensorort+1, 0
	MOVWF      R4+1
	MOVF       _sensorort+2, 0
	MOVWF      R4+2
	MOVF       _sensorort+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _sensorort+0
	MOVF       R0+1, 0
	MOVWF      _sensorort+1
	MOVF       R0+2, 0
	MOVWF      _sensorort+2
	MOVF       R0+3, 0
	MOVWF      _sensorort+3
;qtrmotor.c,131 :: 		sensorort+=(~PORTB.B7)*SensorDegerleri[7];
	BTFSC      PORTB+0, 7
	GOTO       L__main77
	BSF        3, 0
	GOTO       L__main78
L__main77:
	BCF        3, 0
L__main78:
	CLRF       R0+0
	BTFSC      3, 0
	INCF       R0+0, 1
	MOVLW      0
	MOVWF      R0+1
	MOVF       _SensorDegerleri+14, 0
	MOVWF      R4+0
	MOVF       _SensorDegerleri+15, 0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	CALL       _Int2Double+0
	MOVF       _sensorort+0, 0
	MOVWF      R4+0
	MOVF       _sensorort+1, 0
	MOVWF      R4+1
	MOVF       _sensorort+2, 0
	MOVWF      R4+2
	MOVF       _sensorort+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       R0+2, 0
	MOVWF      FLOC__main+2
	MOVF       R0+3, 0
	MOVWF      FLOC__main+3
	MOVF       FLOC__main+0, 0
	MOVWF      _sensorort+0
	MOVF       FLOC__main+1, 0
	MOVWF      _sensorort+1
	MOVF       FLOC__main+2, 0
	MOVWF      _sensorort+2
	MOVF       FLOC__main+3, 0
	MOVWF      _sensorort+3
;qtrmotor.c,132 :: 		sensorort/=BeyazSensorSayisi;
	MOVF       main_BeyazSensorSayisi_L0+0, 0
	MOVWF      R0+0
	MOVF       main_BeyazSensorSayisi_L0+1, 0
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	MOVF       FLOC__main+2, 0
	MOVWF      R0+2
	MOVF       FLOC__main+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _sensorort+0
	MOVF       R0+1, 0
	MOVWF      _sensorort+1
	MOVF       R0+2, 0
	MOVWF      _sensorort+2
	MOVF       R0+3, 0
	MOVWF      _sensorort+3
;qtrmotor.c,134 :: 		Motor1Carpan=255*(tanh(sensorort-2.5)+1)/2.0;//(tanh(x-2.5)+1)/2
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	CALL       _Sub_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FARG_tanh_x+0
	MOVF       R0+1, 0
	MOVWF      FARG_tanh_x+1
	MOVF       R0+2, 0
	MOVWF      FARG_tanh_x+2
	MOVF       R0+3, 0
	MOVWF      FARG_tanh_x+3
	CALL       _tanh+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      127
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      134
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _Double2Word+0
	MOVF       R0+0, 0
	MOVWF      main_Motor1Carpan_L0+0
	MOVF       R0+1, 0
	MOVWF      main_Motor1Carpan_L0+1
;qtrmotor.c,135 :: 		Motor2Carpan=255*(1-tanh(sensorort-6.5))/2.0;//(1-tanh(x-6.5))/2
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      80
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	MOVF       _sensorort+0, 0
	MOVWF      R0+0
	MOVF       _sensorort+1, 0
	MOVWF      R0+1
	MOVF       _sensorort+2, 0
	MOVWF      R0+2
	MOVF       _sensorort+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FARG_tanh_x+0
	MOVF       R0+1, 0
	MOVWF      FARG_tanh_x+1
	MOVF       R0+2, 0
	MOVWF      FARG_tanh_x+2
	MOVF       R0+3, 0
	MOVWF      FARG_tanh_x+3
	CALL       _tanh+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVLW      127
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      134
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _Double2Word+0
	MOVF       R0+0, 0
	MOVWF      main_Motor2Carpan_L0+0
	MOVF       R0+1, 0
	MOVWF      main_Motor2Carpan_L0+1
;qtrmotor.c,136 :: 		if(BeyazSensorSayisi>0)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_BeyazSensorSayisi_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main79
	MOVF       main_BeyazSensorSayisi_L0+0, 0
	SUBLW      0
L__main79:
	BTFSC      STATUS+0, 0
	GOTO       L_main40
;qtrmotor.c,139 :: 		PWM1_Set_Duty(Motor1Carpan);
	MOVF       main_Motor1Carpan_L0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;qtrmotor.c,140 :: 		PWM2_Set_Duty(Motor2Carpan);
	MOVF       main_Motor2Carpan_L0+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;qtrmotor.c,143 :: 		}
	GOTO       L_main41
L_main40:
;qtrmotor.c,146 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;qtrmotor.c,147 :: 		PWM2_Set_Duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;qtrmotor.c,174 :: 		}
L_main41:
;qtrmotor.c,175 :: 		Delay_ms(20);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main42:
	DECFSZ     R13+0, 1
	GOTO       L_main42
	DECFSZ     R12+0, 1
	GOTO       L_main42
	NOP
	NOP
;qtrmotor.c,176 :: 		}
	GOTO       L_main35
;qtrmotor.c,178 :: 		}
	GOTO       $+0
; end of _main
