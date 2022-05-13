#include "tensorflow/lite/micro/all_ops_resolver.h"
#include "constants.h"
#include "split1_model.h"
#include "split2_model.h"
#include "output_handler.h"
#include "split_handler.h"
#include "tensorflow/lite/micro/micro_error_reporter.h"
#include "tensorflow/lite/micro/micro_interpreter.h"
#include "tensorflow/lite/schema/schema_generated.h"
#include "tensorflow/lite/version.h"
#include <Arduino.h>

// Globals, used for compatibility with Arduino-style sketches.
namespace {
tflite::ErrorReporter* error_reporter = nullptr;
// For the first split
const tflite::Model* model_split1 = nullptr;
tflite::MicroInterpreter* interpreter_1 = nullptr;
TfLiteTensor* input_1 = nullptr;
TfLiteTensor* output_1 = nullptr;
//For the second split 
const tflite::Model* model_split2 = nullptr;
tflite::MicroInterpreter* interpreter_2 = nullptr;
TfLiteTensor* input_2 = nullptr;
TfLiteTensor* output_2 = nullptr;
int inference_count = 0;

// Create an area of memory to use for input, output, and intermediate arrays.
// Minimum arena size, at the time of writing. After allocating tensors
// you can retrieve this value by invoking interpreter.arena_used_bytes().
const int kModelArenaSize = 2468;
// Extra headroom for model + alignment + future interpreter changes.
const int kExtraArenaSize = 560 + 16 + 100;
const int kTensorArenaSize = kModelArenaSize + kExtraArenaSize;
uint8_t tensor_arena_1[kTensorArenaSize];
uint8_t tensor_arena_2[kTensorArenaSize];
}  // namespace

// The name of this function is important for Arduino compatibility.
void setup() {
  Serial.begin(9600);
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

  // Map the model of the second split
  model_split2= tflite::GetModel(split2_model);
  if (model_split2->version() != TFLITE_SCHEMA_VERSION) {
    TF_LITE_REPORT_ERROR(error_reporter,
                         "Model provided is schema version %d not equal "
                         "to supported version %d.",
                         model_split2->version(), TFLITE_SCHEMA_VERSION);
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


//-------------------------------------------Creating interpreters for the second split ---------------------------

  // This pulls in all the operation implementations we need.
  // NOLINTNEXTLINE(runtime-global-variables)
  static tflite::AllOpsResolver resolver_2;

  // Build an interpreter to run the model_split12with.
  static tflite::MicroInterpreter static_interpreter_2(
      model_split2, resolver_2, tensor_arena_2, kTensorArenaSize, error_reporter);
  interpreter_2 = &static_interpreter_2;

  // Allocate memory from the tensor_arena for the model's tensors.
  TfLiteStatus allocate_status_2 = interpreter_2->AllocateTensors();
  if (allocate_status_2 != kTfLiteOk) {
    TF_LITE_REPORT_ERROR(error_reporter, "AllocateTensors() failed");
    return;
  }




  // Obtain pointers to the model's input and output tensors.
  input_1 = interpreter_1->input(0);
  output_1 = interpreter_1->output(0);

  input_2 = interpreter_2->input(0);
  output_2 = interpreter_2->output(0);
  // Keep track of how many inferences we have performed.
  inference_count = 0;
}

// The name of this function is important for Arduino compatibility.
void loop() {
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
  pointer_updater(error_reporter,  output_1->data.f, input_2->data.f, output1_length);
  for (int i = 0; i <= output1_length; ++i) {
        float n = output_1->data.f[i];
        Serial.printf("%f, ",n );
        //Serial.print("Hello");
  }
  float output2_length = output_2->bytes / sizeof(float);
  //Serial.printf(" La longitud de la salida es %f \n ", output2_length);
  //Serial.printf("Vector de salida split 1 %f Vector de entrada split2 ",output1_length);
   
  // Run inference, and report any error
  TfLiteStatus invoke_status_2 = interpreter_2->Invoke();
  if (invoke_status_2 != kTfLiteOk) {
    TF_LITE_REPORT_ERROR(error_reporter, "Invoke failed on x_val: %f\n",
                         static_cast<double>(x_val));
    return;
  }

 float y_val = output_2->data.f[0];
 Serial.printf("\n");
Serial.printf("y= %f \n",y_val);
  //Serial.printf("x,%f,y,%f\n", x_val, y_val);
  //HandleOutput(error_reporter, x_val, y_val);

  // Increment the inference_counter, and reset it if we have reached
  // the total number per cycle
  inference_count += 1;
  if (inference_count >= kInferencesPerCycle) inference_count = 0;
}