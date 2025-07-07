//Bibliotecas

  #include <stdio.h>
  #include  <Stepper.h>
  #include <Ultrasonic.h>

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
  #define tam_s 10
  #define tam_m 15
  #define tam_b 20

//Cosntantes localização dos reservatórios

  #define inicio 0
  #define cafe 28
  #define cappu 56
  #define leite 84
  #define achoc 112
  #define acucar 140
  #define agua 168
  #define mixer 196

//Constantes sensor de canecas

  #define echo_pin 7      //Pino digital echo (recebe)
  #define trig_pin 6      //Pino digital trig (envia)
  #define passos_caneca 40//Distribuição das canecas em função dos passos do motor
  #define cota 5          //Distancia para detectar caneca
  int leit_caneca;
  Ultrasonic ultrasonic(trig_pin,echo_pin);
//Constantes motor de passo (Nema17)

  #define steps_nema 200          //Numero de passos por revolução (Nema17)
  #define vel_nema 500            //Velocidade do motor (Nema17)
  #define stp_pin 3               //Pino de passo (A4988)
  #define dir_pin 2               //Pino de direção (A4988)
  #define zero_pin 4              //Pino da posição zero
  int *pos_atu=0, pos_des=0;


//Constantes de controle

  #define rele1 34                //Pino do rele 1
  #define rele2 35                //Pino do rele 2

//Inicialização da biblioteca do motor de passo (Nema17)

  Stepper nema(steps_nema, stp_pin, dir_pin);
  #define motorInterfaceType 1    

//setup
  void setup() {
    Serial.begin(9600);
    pinMode(echo_pin, INPUT);
    pinMode(trig_pin, OUTPUT);
    nema.setSpeed(vel_nema);
    zerar();
    canecas[4]=chec_inic();


    //pre-set de receitas
      bebida expresso;
      expresso.b_cafe=1;
      expresso.b_cappu=0;
      expresso.b_leite=0;
      expresso.b_achoc=0;
      expresso.b_acucar=0;
      expresso.t_cafe=2;
      expresso.t_cappu=0;
      expresso.t_leite=0;
      expresso.t_achoc=0;
      expresso.t_acucar=0;
      expresso.t_agua=10;
      expresso.t_mixer=5;

      


  }
//loop
  void loop() {


  }

//Função para zerar posição
  void zerar(){
    pinMode(zero_pin, INPUT_PULLUP);
    while(!zero_pin){
      nema.step(1);
    }
  }
//Função de checagem de canecas inicial
  bool chec_inic(){
    bool canec[4];
    int count=0;
    while(count!=4){
      if(chec_caneca()){
        canec[count]=1;
      }
      canec[count]=0;
      count++;
    }
    zerar();
    return canec;
  }
//Função checagem de canecas

  bool chec_caneca(){
    sens_caneca();
    if(leit_caneca<cota){
      return 1;
    }
    return 0;
  }

//Função para deslocamento

    void irPara(int pos_des){
      nema.step(pos_des-*pos_atu);
      *pos_atu=pos_des;
    }

//Função do sensor de caneca
  void sens_caneca(){
      digitalWrite(trig_pin, LOW); //SETA O PINO 6 COM UM PULSO BAIXO "LOW"
      delayMicroseconds(2); //INTERVALO DE 2 MICROSSEGUNDOS
      digitalWrite(trig_pin, HIGH); //SETA O PINO 6 COM PULSO ALTO "HIGH"
      delayMicroseconds(10); //INTERVALO DE 10 MICROSSEGUNDOS
      digitalWrite(trig_pin, LOW); //SETA O PINO 6 COM PULSO BAIXO "LOW" NOVAMENTE
      //FUNÇÃO RANGING, FAZ A CONVERSÃO DO TEMPO DE
      //RESPOSTA DO ECHO EM CENTIMETROS, E ARMAZENA
      //NA VARIAVEL "distancia"
      leit_caneca = (ultrasonic.read()); //VARIÁVEL GLOBAL RECEBE O VALOR DA DISTÂNCIA MEDIDA
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
        if(drink.b_cafe) drink.t_cafe = 10;
        if(drink.b_cappu) drink.t_cappu = 10;
        if(drink.b_leite) drink.t_leite = 10; 
        if(drink.b_achoc) drink.t_achoc = 10; 
        if(drink.b_acucar) drink.t_acucar = 10;
        break;
      case 2:
        drink.t_agua=tam_m;
        drink.t_mixer=5;
        if(drink.b_cafe) drink.t_cafe = 15;
        if(drink.b_cappu) drink.t_cappu = 15;
        if(drink.b_leite) drink.t_leite = 15; 
        if(drink.b_achoc) drink.t_achoc = 15; 
        if(drink.b_acucar) drink.t_acucar = 15;
        break;
      case 3:
        drink.t_agua=tam_b;
        drink.t_mixer=5;
        if(drink.b_cafe) drink.t_cafe = 20;
        if(drink.b_cappu) drink.t_cappu = 20;
        if(drink.b_leite) drink.t_leite = 20; 
        if(drink.b_achoc) drink.t_achoc = 20; 
        if(drink.b_acucar) drink.t_acucar = 20;
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