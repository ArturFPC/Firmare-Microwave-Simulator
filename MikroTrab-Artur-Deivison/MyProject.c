//Autores: Artur Francisco Pereira Carvalho e Deivison Oliveira Costa
//Settando configurações do LCD
// Lcd pinout settings
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;
void main() {
     //Variavel para contar os segundos
     int contadorSegundos = 0;
     //Variavel para parar o funcionamento
     int interrompe = 0;
     //Variavel para verificar se o segundo chegou a zero e para ler o potenciomentro
     int validaSegundos = 0;
     //Variavel para contar os minutos e ler o potenciometro
     int contadorMinutos = 0;
     //Variavel para mostrar os segundos
     char palavra[6];
     //Variavel para mostrar os minutos
     char palavra2[6];
     //Configurando o PWM
     Pwm1_init(5000);
     //Iniciando o PWM
     Pwm1_start();
     //Iniciando os LCD's
     Lcd_init();
     //Definindo portas C como saída
     TRISC = 0;
     //Defindo portas B como entrada
     TRISB = 255;
     //Configurando os potenciometros
     ADCON1 = 0b00001100;
     while(1){
              //Desligando o cooler
              Pwm1_Set_Duty(0);
              //Lendo o potênciometro 0 e colocando ele na escala e tipo certo
              validaSegundos = ADC_READ(0) * 0.059;
              WordToStr(validaSegundos,palavra);
              //Mostrando o valor em segundos
              Lcd_out(2,1,"Segundos: ");
              Lcd_out(2,10,palavra);
              //Lendo o potênciometro 1 e colocando ele na escala e tipo certo
              contadorMinutos = ADC_READ(1) * 0.098;
              WordToStr(contadorMinutos,palavra2);
              //Mostrando o valor em minutos
              Lcd_out(1,1,"Minutos: ");
              Lcd_out(1,10,palavra2);
              //Verificando se o botão b1 foi acionado para acionar o micro-ondas
              if (BUTTON(&PORTB,1,1,0)){
                 //ligando o micro-ondas
                  Pwm1_Set_Duty(255);
                  //Setando o timer
                  TMR0L = 0x18;
                  TMR0H = 0xC6;
                  //Ligando o timer
                  T0CON = 0b10000110;
                  //Repetindo até minuto chegar em 0
                  while (contadorMinutos >=0){
                    //Repetindo até segundo chegar em 0
                    while (contadorSegundos <= validaSegundos){
                          //Interrompendo caso o botão 3 for acionado
                        if (BUTTON(&PORTB,3,1,0)){
                           interrompe=1;
                           break;   //utilizei o break porque o comando operações lógicas não funcionam em laços no mikroC
                        }
                        //realizando a contagem
                        if (intcon.tmr0if == 1){
                          contadorSegundos = contadorSegundos +1;
                          WordToStr((validaSegundos -contadorSegundos),palavra);
                          Lcd_out(2,10,palavra);
                          TMR0L = 0x18;
                          TMR0H = 0xC6;
                          intcon.tmr0if =0;
                        }
                    }
                    //Interrompendo caso o botão 3 for acionado
                    if (interrompe==1){
                       break;
                    }
                    //Definindo o contador de segundos como 0
                    contadorSegundos = 0;
                    //Definindo o valor de segundos a ser mostrado como 59
                    validaSegundos = 59;
                    //Decrementando minutos
                    contadorMinutos = contadorMinutos-1;
                    //Mostrando minutos/segundos
                    WordToStr(contadorMinutos,palavra2);
                    Lcd_out(1,10,palavra2);
                    WordToStr(validaSegundos,palavra);
                    Lcd_out(2,10,palavra);
                  }
                  //Iniciando o buzzer se o cronometro não tiver sido interrompido
                  if (interrompe == 0){
                     PORTC = 255;
                  }else{
                        interrompe =0;
                  }
                  //Resetando o contador de segundos
                  contadorSegundos = 0;
              }
              //Desligando o buzzer
              if (BUTTON(&PORTB,2,1,0)){
                 PORTC = 0;
              }
     }

}