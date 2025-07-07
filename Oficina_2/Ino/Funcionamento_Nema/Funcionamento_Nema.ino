// Biblioteca do nema

 #include  <Stepper.h>


//Cosntantes localização dos reservatórios
//A posição é dada pelo número de passos que o motor da para chegar na posição

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
  #define vel_nema 500            //Velocidade do motor (Nema17)
  #define stp_pin 3               //Pino de passo (A4988)
  #define dir_pin 2               //Pino de direção (A4988)
  #define zero_pin 4              //Pino da posição zero (Implementar o sensor para dizer que é o zero)
  int *pos_atu=0, pos_des=0;


//Inicialização da biblioteca do motor de passo (Nema17)

  Stepper nema(steps_nema, stp_pin, dir_pin);
  #define motorInterfaceType 1    

//Setup  do motor

  nema.setSpeed(vel_nema);


//Função para deslocamento

    void irPara(int *pos_atu, int pos_des){
      int x=pos_atu;
      nema.step(pos_des-x);
      pos_atu=pos_des;
    }


//Função para zerar posição
  void zerar(){
    pinMode(zero_pin, INPUT_PULLUP);
    while(!zero_pin){
      nema.step(1);
    }
  }