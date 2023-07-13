#line 1 "C:/Users/artur/Documents/microaula2006/teste/MyProject.c"

sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;


sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;
void main() {
 int i = 0;
 int contadorSegundos = 0;
 int interrompe = 0;
 int validaSegundos = 0;
 int contadorMinutos = 0;
 char palavra[6];
 char palavra2[6];
 Pwm1_init(5000);
 Pwm1_start();
 Lcd_init();
 TRISC = 0;
 TRISB = 255;
 ADCON1 = 0b00001100;
 while(1){
 Pwm1_Set_Duty(0);
 validaSegundos = ADC_READ(0) * 0.059;
 WordToStr(validaSegundos,palavra);
 Lcd_out(2,1,"Segundos: ");
 Lcd_out(2,10,palavra);
 contadorMinutos = ADC_READ(1) * 0.098;
 WordToStr(contadorMinutos,palavra2);
 Lcd_out(1,1,"Minutos: ");
 Lcd_out(1,10,palavra2);
 if (BUTTON(&PORTB,1,1,0)){
 Pwm1_Set_Duty(255);
 TMR0L = 0x18;
 TMR0H = 0xC6;
 T0CON = 0b10000110;
 while (contadorMinutos >=0){
 while (contadorSegundos <= validaSegundos){
 if (BUTTON(&PORTB,3,1,0)){
 interrompe=1;
 break;
 }
 if (intcon.tmr0if == 1){
 contadorSegundos = contadorSegundos +1;
 WordToStr((validaSegundos -contadorSegundos),palavra);
 Lcd_out(2,10,palavra);
 TMR0L = 0x18;
 TMR0H = 0xC6;
 intcon.tmr0if =0;
 }
 }
 if (interrompe==1){
 break;
 }
 contadorSegundos = 0;
 validaSegundos = 59;
 contadorMinutos = contadorMinutos-1;
 WordToStr(contadorMinutos,palavra2);
 Lcd_out(1,10,palavra2);
 WordToStr(validaSegundos,palavra);
 Lcd_out(2,10,palavra);
 }

 if (interrompe == 0){
 PORTC = 255;
 }else{
 interrompe =0;
 }
 contadorSegundos = 0;
 i = 0;
 }
 if (BUTTON(&PORTB,2,1,0)){
 PORTC = 0;
 }
 }

}
