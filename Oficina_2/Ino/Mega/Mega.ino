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

    void irPara(int *pos_atu, int pos_des){
      int x=pos_atu;
      nema.step(pos_des-x);
      pos_atu=pos_des;
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