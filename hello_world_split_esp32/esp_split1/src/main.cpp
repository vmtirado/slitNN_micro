#include "tensorflow/lite/micro/all_ops_resolver.h"
#include "constants.h"
#include "split1_model.h"
#include "output_handler.h"
#include "split_handler.h"
#include "tensorflow/lite/micro/micro_error_reporter.h"
#include "tensorflow/lite/micro/micro_interpreter.h"
#include "tensorflow/lite/schema/schema_generated.h"
#include "tensorflow/lite/version.h"
#include <Arduino.h>

#define RXp2 16
#define TXp2 17

int flag=0;
// Globals, used for compatibility with Arduino-style sketches.
namespace {
tflite::ErrorReporter* error_reporter = nullptr;
// For the first split
const tflite::Model* model_split1 = nullptr;
tflite::MicroInterpreter* interpreter_1 = nullptr;
TfLiteTensor* input_1 = nullptr;
TfLiteTensor* output_1 = nullptr;

int inference_count = 0;

// Create an area of memory to use for input, output, and intermediate arrays.
// Minimum arena size, at the time of writing. After allocating tensors
// you can retrieve this value by invoking interpreter.arena_used_bytes().
const int kModelArenaSize = 2468;
// Extra headroom for model + alignment + future interpreter changes.
const int kExtraArenaSize = 560 + 16 + 100;
const int kTensorArenaSize = kModelArenaSize + kExtraArenaSize;
uint8_t tensor_arena_1[kTensorArenaSize];
}

union float_split
{
    uint8_t     fBytes[sizeof( float )];
    float       fValue;
};
float_split flt;
void setup() {
  Serial.begin(9600);
  Serial2.begin(115200, SERIAL_8N1, RXp2, TXp2);

  // Set up logging. Google style is to avoid globals or statics because of
  // lifetime uncertainty, but since this has a trivial destructor it's okay.
  // NOLINTNEXTLINE(runtime-global-variables)
  static tflite::MicroErrorReporter micro_error_reporter;
  error_reporter = &micro_error_reporter;

//-------------------------------------------------Maping the models-----------------------------------------------
  // Map the model into a usable data structure. This doesn't involve any
  // copying or parsing, it's a very lightweight operation.

  // Map the model of the first split
  model_split1 = tflite::GetModel(split1_model);
  if (model_split1->version() != TFLITE_SCHEMA_VERSION) {
    TF_LITE_REPORT_ERROR(error_reporter,
                         "Model provided is schema version %d not equal "
                         "to supported version %d.",
                         model_split1->version(), TFLITE_SCHEMA_VERSION);
    return;
  }

//-------------------------------------------Creating interpreters for the first split ---------------------------
  // This pulls in all the operation implementations we need.
  // NOLINTNEXTLINE(runtime-global-variables)
  static tflite::AllOpsResolver resolver_1;

  // Build an interpreter to run the model_split1 with.
  static tflite::MicroInterpreter static_interpreter_1(
      model_split1, resolver_1, tensor_arena_1, kTensorArenaSize, error_reporter);
  interpreter_1 = &static_interpreter_1;

  // Allocate memory from the tensor_arena for the model's tensors.
  TfLiteStatus allocate_status_1 = interpreter_1->AllocateTensors();
  if (allocate_status_1 != kTfLiteOk) {
    TF_LITE_REPORT_ERROR(error_reporter, "AllocateTensors() failed");
    return;
  }




  // Obtain pointers to the model's input and output tensors.
  input_1 = interpreter_1->input(0);
  output_1 = interpreter_1->output(0);


  // Keep track of how many inferences we have performed.
  inference_count = 0;
}


void loop() {

if (flag==0){
    if(Serial2.available()){
    char data=Serial2.read();
    if(data=='*'){
      Serial.println("receiver solicito envio");
      flag=1;
    }
  }
}
if (flag==1){
  //-------------------------------------------Calculating the output of the first split ---------------------------
    // Calculate an x value to feed into the model. We compare the current
  // inference_count to the number of inferences per cycle to determine
  // our position within the range of possible x values the model was
  // trained on, and use this to calculate a value.
  float position = static_cast<float>(inference_count) /
                   static_cast<float>(kInferencesPerCycle);
  float x_val = position * kXrange;

  // Place our calculated x value in the model's input tensor
  input_1->data.f[0] = x_val;
   
  // Run inference, and report any error
  TfLiteStatus invoke_status_1 = interpreter_1->Invoke();
  if (invoke_status_1 != kTfLiteOk) {
    TF_LITE_REPORT_ERROR(error_reporter, "Invoke failed on x_val: %f\n",
                         static_cast<double>(x_val));
    return;
  }
    // Output from the split of the network 
  // Output the results. A custom HandleOutput function can be implemented
  // for each supported hardware target.

  // Place our calculated x value in the model's input tensor
  Serial.printf("------------------------------------------------------------\n");
  Serial.printf("x= %f \n",x_val);

 
 float output1_length = output_1->bytes / sizeof(float);
  //Serial.printf("El tamaño de la salida del vector de split %s", output_length);
  //-------------------------------------------Sending trough serial ---------------------------
  for (int i = 0; i <= output1_length; ++i) {
        float n = output_1->data.f[i];
        flt.fValue=n;
        Serial2.write( flt.fBytes, sizeof( float ) );
        Serial.println(flt.fValue,4);
        delay(1);
  }
  Serial2.write('<'); 
   
  inference_count += 1;
  if (inference_count >= kInferencesPerCycle) inference_count = 0;
  flag=0;

}

  

}