#include "split_handler.h"
#include <Arduino.h>
bool pointer_updater(tflite::ErrorReporter* error_reporter,
                              float* input,float* output, int input_length){

    for (int i = 0; i < input_length; ++i) {
        output[i]=input[i];
        //Serial.print("Hello");
  }
  return true;
}
