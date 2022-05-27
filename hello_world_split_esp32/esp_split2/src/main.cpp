#include "tensorflow/lite/micro/all_ops_resolver.h"
#include "constants.h"
#include "model.h"
#include "output_handler.h"
#include "tensorflow/lite/micro/micro_error_reporter.h"
#include "tensorflow/lite/micro/micro_interpreter.h"
#include "tensorflow/lite/schema/schema_generated.h"
#include "tensorflow/lite/version.h"
#include <Arduino.h>

#define RXp2 16
#define TXp2 17

 float serial_data;
 unsigned char serial_buffer[4];
 float input2[16];
 int flag=0;
 int pos=0;
// Globals, used for compatibility with Arduino-style sketches.
namespace {
tflite::ErrorReporter* error_reporter = nullptr;
const tflite::Model* model = nullptr;
tflite::MicroInterpreter* interpreter = nullptr;
TfLiteTensor* input = nullptr;
TfLiteTensor* output = nullptr;
int inference_count = 0;

// Create an area of memory to use for input, output, and intermediate arrays.
// Minimum arena size, at the time of writing. After allocating tensors
// you can retrieve this value by invoking interpreter.arena_used_bytes().
const int kModelArenaSize = 2468;
// Extra headroom for model + alignment + future interpreter changes.
const int kExtraArenaSize = 560 + 16 + 100;
const int kTensorArenaSize = kModelArenaSize + kExtraArenaSize;
uint8_t tensor_arena[kTensorArenaSize];
}  // namespace

// The name of this function is important for Arduino compatibility.
void setup() {
  Serial.begin(9600);
  Serial2.begin(115200, SERIAL_8N1, RXp2, TXp2);
  // Set up logging. Google style is to avoid globals or statics because of
  // lifetime uncertainty, but since this has a trivial destructor it's okay.
  // NOLINTNEXTLINE(runtime-global-variables)
  static tflite::MicroErrorReporter micro_error_reporter;
  error_reporter = &micro_error_reporter;

  // Map the model into a usable data structure. This doesn't involve any
  // copying or parsing, it's a very lightweight operation.
  model = tflite::GetModel(split2_model);
  if (model->version() != TFLITE_SCHEMA_VERSION) {
    TF_LITE_REPORT_ERROR(error_reporter,
                         "Model provided is schema version %d not equal "
                         "to supported version %d.",
                         model->version(), TFLITE_SCHEMA_VERSION);
    return;
  }

  // This pulls in all the operation implementations we need.
  // NOLINTNEXTLINE(runtime-global-variables)
  static tflite::AllOpsResolver resolver;

  // Build an interpreter to run the model with.
  static tflite::MicroInterpreter static_interpreter(
      model, resolver, tensor_arena, kTensorArenaSize, error_reporter);
  interpreter = &static_interpreter;

  // Allocate memory from the tensor_arena for the model's tensors.
  TfLiteStatus allocate_status = interpreter->AllocateTensors();
  if (allocate_status != kTfLiteOk) {
    TF_LITE_REPORT_ERROR(error_reporter, "AllocateTensors() failed");
    return;
  }

  // Obtain pointers to the model's input and output tensors.
  input = interpreter->input(0);
  output = interpreter->output(0);

  // Keep track of how many inferences we have performed.
  inference_count = 0;
}

// The name of this function is important for Arduino compatibility.
void loop() {
  if (flag==0){
    Serial2.write('*');
    Serial.println("Solicite datos");
    flag=1;
  }
  if(flag==2){
    // Calculate an x value to feed into the model. We compare the current
    // inference_count to the number of inferences per cycle to determine
    // our position within the range of possible x values the model was
    // trained on, and use this to calculate a value.
  Serial.printf("Los valores en el vector para la inferencia son------------------- \n", inference_count);
    for(int i=0; i<=16;i++){
      input->data.f[i]= input2[i];
      Serial.printf("%f, ",input->data.f[i]);
    }
    Serial.println("--------");

    float input_length= input->bytes / sizeof(float);
    //Serial.printf("El tamaño del vector es %f", input_length);

    // Run inference, and report any error
    TfLiteStatus invoke_status = interpreter->Invoke();
    if (invoke_status != kTfLiteOk) {
      TF_LITE_REPORT_ERROR(error_reporter, "Invoke failed on x_val: %f\n",
                          static_cast<double>(1));
      return;
    }

    // Read the predicted y value from the model's output tensor
    float y_val = output->data.f[0];
    //Serial.printf("El valor de y es %.2f \n",y_val);
    // Output the results. A custom HandleOutput function can be implemented
    // for each supported hardware target.


    Serial.printf("salida: %f\n", y_val);
    //HandleOutput(error_reporter, x_val, y_val);

    // Increment the inference_counter, and reset it if we have reached
    // the total number per cycle
    inference_count += 1;
    Serial.println(inference_count);
    if (inference_count >= 21) inference_count = 0;
    flag=3;
  }
}

void serialEvent2(){
  if(Serial2.available()){
    if(flag==1){
      if (Serial2.readBytesUntil('<',serial_buffer, sizeof(float)) == sizeof(float)){
        memcpy(&serial_data, serial_buffer, sizeof(float));
        input2[pos]=serial_data;
        Serial.print("Asigne");
        Serial.println(serial_data,4);
        flag=1;
        pos++;
      }else{
        Serial.println("done");
        flag=2;
      }
    }

  }
}