
_main:

;MyProject.c,16 :: 		void main() {
;MyProject.c,17 :: 		int i = 0;
;MyProject.c,18 :: 		int contadorSegundos = 0;
	CLRF        main_contadorSegundos_L0+0 
	CLRF        main_contadorSegundos_L0+1 
	CLRF        main_interrompe_L0+0 
	CLRF        main_interrompe_L0+1 
	CLRF        main_validaSegundos_L0+0 
	CLRF        main_validaSegundos_L0+1 
	CLRF        main_contadorMinutos_L0+0 
	CLRF        main_contadorMinutos_L0+1 
;MyProject.c,24 :: 		Pwm1_init(5000);
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;MyProject.c,25 :: 		Pwm1_start();
	CALL        _PWM1_Start+0, 0
;MyProject.c,26 :: 		Lcd_init();
	CALL        _Lcd_Init+0, 0
;MyProject.c,27 :: 		TRISC = 0;
	CLRF        TRISC+0 
;MyProject.c,28 :: 		TRISB = 255;
	MOVLW       255
	MOVWF       TRISB+0 
;MyProject.c,29 :: 		ADCON1 = 0b00001100;
	MOVLW       12
	MOVWF       ADCON1+0 
;MyProject.c,30 :: 		while(1){
L_main0:
;MyProject.c,31 :: 		Pwm1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;MyProject.c,32 :: 		validaSegundos = ADC_READ(0) * 0.059;
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       252
	MOVWF       R4 
	MOVLW       169
	MOVWF       R5 
	MOVLW       113
	MOVWF       R6 
	MOVLW       122
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       main_validaSegundos_L0+0 
	MOVF        R1, 0 
	MOVWF       main_validaSegundos_L0+1 
;MyProject.c,33 :: 		WordToStr(validaSegundos,palavra);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_palavra_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_palavra_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;MyProject.c,34 :: 		Lcd_out(2,1,"Segundos: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,35 :: 		Lcd_out(2,10,palavra);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_palavra_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_palavra_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,36 :: 		contadorMinutos = ADC_READ(1) * 0.098;
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       57
	MOVWF       R4 
	MOVLW       180
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       main_contadorMinutos_L0+0 
	MOVF        R1, 0 
	MOVWF       main_contadorMinutos_L0+1 
;MyProject.c,37 :: 		WordToStr(contadorMinutos,palavra2);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_palavra2_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_palavra2_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;MyProject.c,38 :: 		Lcd_out(1,1,"Minutos: ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,39 :: 		Lcd_out(1,10,palavra2);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_palavra2_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_palavra2_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,40 :: 		if (BUTTON(&PORTB,1,1,0)){
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main2
;MyProject.c,41 :: 		Pwm1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;MyProject.c,42 :: 		TMR0L = 0x18;
	MOVLW       24
	MOVWF       TMR0L+0 
;MyProject.c,43 :: 		TMR0H = 0xC6;
	MOVLW       198
	MOVWF       TMR0H+0 
;MyProject.c,44 :: 		T0CON = 0b10000110;
	MOVLW       134
	MOVWF       T0CON+0 
;MyProject.c,45 :: 		while (contadorMinutos >=0){
L_main3:
	MOVLW       128
	XORWF       main_contadorMinutos_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main14
	MOVLW       0
	SUBWF       main_contadorMinutos_L0+0, 0 
L__main14:
	BTFSS       STATUS+0, 0 
	GOTO        L_main4
;MyProject.c,46 :: 		while (contadorSegundos <= validaSegundos){
L_main5:
	MOVLW       128
	XORWF       main_validaSegundos_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       main_contadorSegundos_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main15
	MOVF        main_contadorSegundos_L0+0, 0 
	SUBWF       main_validaSegundos_L0+0, 0 
L__main15:
	BTFSS       STATUS+0, 0 
	GOTO        L_main6
;MyProject.c,47 :: 		if (BUTTON(&PORTB,3,1,0)){
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       3
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main7
;MyProject.c,48 :: 		interrompe=1;
	MOVLW       1
	MOVWF       main_interrompe_L0+0 
	MOVLW       0
	MOVWF       main_interrompe_L0+1 
;MyProject.c,49 :: 		break;   //utilizei o break porque o comando operações lógicas não funcionam em laços no mikroC
	GOTO        L_main6
;MyProject.c,50 :: 		}
L_main7:
;MyProject.c,51 :: 		if (intcon.tmr0if == 1){
	BTFSS       INTCON+0, 2 
	GOTO        L_main8
;MyProject.c,52 :: 		contadorSegundos = contadorSegundos +1;
	INFSNZ      main_contadorSegundos_L0+0, 1 
	INCF        main_contadorSegundos_L0+1, 1 
;MyProject.c,53 :: 		WordToStr((validaSegundos -contadorSegundos),palavra);
	MOVF        main_contadorSegundos_L0+0, 0 
	SUBWF       main_validaSegundos_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        main_contadorSegundos_L0+1, 0 
	SUBWFB      main_validaSegundos_L0+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_palavra_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_palavra_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;MyProject.c,54 :: 		Lcd_out(2,10,palavra);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_palavra_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_palavra_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,55 :: 		TMR0L = 0x18;
	MOVLW       24
	MOVWF       TMR0L+0 
;MyProject.c,56 :: 		TMR0H = 0xC6;
	MOVLW       198
	MOVWF       TMR0H+0 
;MyProject.c,57 :: 		intcon.tmr0if =0;
	BCF         INTCON+0, 2 
;MyProject.c,58 :: 		}
L_main8:
;MyProject.c,59 :: 		}
	GOTO        L_main5
L_main6:
;MyProject.c,60 :: 		if (interrompe==1){
	MOVLW       0
	XORWF       main_interrompe_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main16
	MOVLW       1
	XORWF       main_interrompe_L0+0, 0 
L__main16:
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
;MyProject.c,61 :: 		break;
	GOTO        L_main4
;MyProject.c,62 :: 		}
L_main9:
;MyProject.c,63 :: 		contadorSegundos = 0;
	CLRF        main_contadorSegundos_L0+0 
	CLRF        main_contadorSegundos_L0+1 
;MyProject.c,64 :: 		validaSegundos = 59;
	MOVLW       59
	MOVWF       main_validaSegundos_L0+0 
	MOVLW       0
	MOVWF       main_validaSegundos_L0+1 
;MyProject.c,65 :: 		contadorMinutos = contadorMinutos-1;
	MOVLW       1
	SUBWF       main_contadorMinutos_L0+0, 1 
	MOVLW       0
	SUBWFB      main_contadorMinutos_L0+1, 1 
;MyProject.c,66 :: 		WordToStr(contadorMinutos,palavra2);
	MOVF        main_contadorMinutos_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        main_contadorMinutos_L0+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_palavra2_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_palavra2_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;MyProject.c,67 :: 		Lcd_out(1,10,palavra2);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_palavra2_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_palavra2_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,68 :: 		WordToStr(validaSegundos,palavra);
	MOVF        main_validaSegundos_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        main_validaSegundos_L0+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_palavra_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_palavra_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;MyProject.c,69 :: 		Lcd_out(2,10,palavra);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_palavra_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_palavra_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,70 :: 		}
	GOTO        L_main3
L_main4:
;MyProject.c,72 :: 		if (interrompe == 0){
	MOVLW       0
	XORWF       main_interrompe_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main17
	MOVLW       0
	XORWF       main_interrompe_L0+0, 0 
L__main17:
	BTFSS       STATUS+0, 2 
	GOTO        L_main10
;MyProject.c,73 :: 		PORTC = 255;
	MOVLW       255
	MOVWF       PORTC+0 
;MyProject.c,74 :: 		}else{
	GOTO        L_main11
L_main10:
;MyProject.c,75 :: 		interrompe =0;
	CLRF        main_interrompe_L0+0 
	CLRF        main_interrompe_L0+1 
;MyProject.c,76 :: 		}
L_main11:
;MyProject.c,77 :: 		contadorSegundos = 0;
	CLRF        main_contadorSegundos_L0+0 
	CLRF        main_contadorSegundos_L0+1 
;MyProject.c,79 :: 		}
L_main2:
;MyProject.c,80 :: 		if (BUTTON(&PORTB,2,1,0)){
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       2
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
;MyProject.c,81 :: 		PORTC = 0;
	CLRF        PORTC+0 
;MyProject.c,82 :: 		}
L_main12:
;MyProject.c,83 :: 		}
	GOTO        L_main0
;MyProject.c,85 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
