#include <Stepper.h>
#define STEPS 2038 // the number of steps in one revolution of your motor (28BYJ-48)

Stepper stepper(STEPS, 8, 10, 9, 11);

void setup() {

  Serial.begin(115200);
  Serial.flush();

  Serial.println("Starting Delphi Controller");
  Serial.println("");  
  Serial.println("R = Right Spin");
  Serial.println("L = Left Spin");
  Serial.println("");

  stepper.setSpeed(15);
}

void loop() {

  if (Serial.available()) {

    char cmd = Serial.read();
    Serial.flush();

    if (cmd == 'R') {
      cmd = 0;
      Serial.println("Command : Right GO");
      stepper.step(200);
      delay(1000);
    } else

      if (cmd == 'L')  {
        cmd = 0;
        Serial.println("Command : Left GO");
        stepper.step(-200);
        delay(1000);
      };


  }
}
