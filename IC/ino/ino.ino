  
  
  #include <stdio.h>
  #include  <Stepper.h>

  // CS-D508
  #define steps_1 200         
  #define vel_1 500           
  #define dirPin1 9   
  #define stepPin1 10
  #define enaPin1 8  

 // CS-D808
  #define steps_2 200         
  #define vel_2 500           
  #define dirPin2 2  
  #define stepPin2 3
  #define enaPin2 1       


//Inicialização da biblioteca do motor de pass
  #define motorInterfaceType 1  
  Stepper stepper1(steps_1, stepPin1, dirPin1);
  Stepper stepper2(steps_2, stepPin2, dirPin2);

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);

// CS-D508
  
  pinMode(enaPin1,OUTPUT); //HIGH=ATIVO LOW=DESATIVO
  digitalWrite(enaPin1,HIGH);
  stepper1.setSpeed(vel_1);

// CS-D808
  pinMode(enaPin2,OUTPUT);
  digitalWrite(enaPin2,HIGH);
  stepper2.setSpeed(vel_2);


}

void loop() {
  stepper1.step(1);
  stepper2.step(1);  

}
