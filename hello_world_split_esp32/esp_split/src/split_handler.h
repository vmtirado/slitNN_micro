#include "tensorflow/lite/micro/micro_error_reporter.h"
extern bool pointer_updater(tflite::ErrorReporter* error_reporter,
                              float* input,float* output, int input_length);