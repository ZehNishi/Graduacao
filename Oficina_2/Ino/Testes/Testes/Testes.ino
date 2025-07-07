#include <stdlib.h>
#include <stdio.h>
#include <Stepper.h>

//Estrutura da bebida

  typedef struct{
    bool b_cafe;
    bool b_cappu;
    bool b_leite;
    bool b_achoc;
    bool b_acucar;
    float t_cafe;
    float t_cappu;
    float t_leite;
    float t_achoc;
    float t_acucar;
    float t_agua;
    float t_mixer;
  }bebida;
  bool canecas[4];
  #define tam_s 1.0
  #define tam_m 1.5
  #define tam_b 2.0

//Cosntantes localização dos reservatórios

  #define inicio 0
  #define cafe 28
  #define cappu 56
  #define leite 84
  #define achoc 112
  #define acucar 140
  #define agua 168
  #define mixer 196

//Constantes motor de passo (Nema17)

  #define steps_nema 200          //Numero de passos por revolução (Nema17)
  #define vel_nema 50            //Velocidade do motor (Nema17)
  #define stp_pin 23               //Pino de passo (A4988)
  #define dir_pin 22               //Pino de direção (A4988)
  #define zero_pin 4              //Pino da posição zero
  int *pos_atual=0, pos_des=0;


//Constantes de controle

  #define rele1 19                //Pino do rele 1
  #define rele2 21                //Pino do rele 2

//Inicialização da biblioteca do motor de passo (Nema17)

  Stepper nema(steps_nema, stp_pin, dir_pin);
  #define motorInterfaceType 1  



void setup() {
  Serial.begin(115200);
  pinMode(rele1, OUTPUT);
  pinMode(rele2, OUTPUT);
  digitalWrite(rele1, HIGH);
  digitalWrite(rele2, HIGH);
  motor(rele1,1500);
  
}

void loop() {
  delay(10000);
}

//Função para deslocamento

    void irPara(int pos_des){
      nema.step(4*(pos_des-*pos_atual));
      *pos_atual=pos_des;
    }

//Função para construção da bebida

  bebida set_drink(int inf[1]){
    bebida drink;

    switch (inf[0]) {
      case 1:
        drink.b_cafe=1;
        drink.b_cappu=0;
        drink.b_leite=0;
        drink.b_achoc=0;
        drink.b_acucar=0;
        break;
      case 2:
        drink.b_cafe=1;
        drink.b_cappu=0;
        drink.b_leite=1;
        drink.b_achoc=0;
        drink.b_acucar=0;
        break;
      case 3:
        drink.b_cafe=0;
        drink.b_cappu=1;
        drink.b_leite=0;
        drink.b_achoc=0;
        drink.b_acucar=0;
        break;
      case 4:
        drink.b_cafe=0;
        drink.b_cappu=0;
        drink.b_leite=1;
        drink.b_achoc=1;
        drink.b_acucar=0;
        break;
      default:
        break;
    }


    switch (inf[1]) {
      case 1:
        drink.t_agua=tam_s;
        drink.t_mixer=5;
        if(drink.b_cafe) drink.t_cafe = 1.0;
        if(drink.b_cappu) drink.t_cappu = 1.0;
        if(drink.b_leite) drink.t_leite = 1.0; 
        if(drink.b_achoc) drink.t_achoc = 1.0; 
        if(drink.b_acucar) drink.t_acucar = 1.0;
        break;
      case 2:
        drink.t_agua=tam_m;
        drink.t_mixer=5;
        if(drink.b_cafe) drink.t_cafe = 1.5;
        if(drink.b_cappu) drink.t_cappu = 1.5;
        if(drink.b_leite) drink.t_leite = 1.5; 
        if(drink.b_achoc) drink.t_achoc = 1.5; 
        if(drink.b_acucar) drink.t_acucar = 1.5;
        break;
      case 3:
        drink.t_agua=tam_b;
        drink.t_mixer=5;
        if(drink.b_cafe) drink.t_cafe = 2.0;
        if(drink.b_cappu) drink.t_cappu = 2.0;
        if(drink.b_leite) drink.t_leite = 2.0; 
        if(drink.b_achoc) drink.t_achoc = 2.0; 
        if(drink.b_acucar) drink.t_acucar = 2.0;
        break;
      default:
        break;
    }



    return drink;
  }

//Função para preparo da bebida

  void preparar(bebida drink){
    if(drink.b_cafe){
      irPara(cafe);
      delay(drink.t_cafe*1000);
    }
    if(drink.b_cappu){
       irPara(cappu);
       delay(drink.t_cappu*1000);
    } 
    if(drink.b_leite){
       irPara(leite);
       delay(drink.t_leite*1000);
    } 
    if(drink.b_achoc) {
       irPara(achoc);
       delay(drink.t_achoc*1000);
    }
    if(drink.b_acucar){
       irPara(acucar);
       delay(drink.t_acucar*1000);
    } 
    irPara(agua);
    delay(drink.t_agua*1000);
    irPara(mixer);
    delay(drink.t_mixer*1000);
    irPara(inicio);

  }


//Função para acionamento dos motores

  void motor(int rele,int tempo){
    digitalWrite(rele, LOW);
    delay(tempo);
    digitalWrite(rele, HIGH);
  }