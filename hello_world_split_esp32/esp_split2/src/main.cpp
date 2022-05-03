#include "tensorflow/lite/micro/all_ops_resolver.h"
#include "constants.h"
#include "model.h"
#include "output_handler.h"
#include "tensorflow/lite/micro/micro_error_reporter.h"
#include "tensorflow/lite/micro/micro_interpreter.h"
#include "tensorflow/lite/schema/schema_generated.h"
#include "tensorflow/lite/version.h"
#include <Arduino.h>
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
  // Calculate an x value to feed into the model. We compare the current
  // inference_count to the number of inferences per cycle to determine
  // our position within the range of possible x values the model was
  // trained on, and use this to calculate a value.

  float out_value[21][16]= {{0.0,0.4711245596408844,0.0,0.0,0.0,0.018006956204771996,0.0,0.0,0.0,0.3355330228805542,0.7829717397689819,0.13247789442539215,0.08387140184640884,0.0,0.3705844581127167,0.0}, 
{0.0,0.6160030364990234,0.0,0.0,0.0,0.059337593615055084,0.0,0.0,0.0,0.36550429463386536,0.8046543598175049,0.17766152322292328,0.24343222379684448,0.0,0.3687797784805298,0.0}, 
{0.0,0.7608815431594849,0.0,0.0,0.0,0.10066823661327362,0.0,0.0,0.0,0.3954755961894989,0.8263369202613831,0.2228451669216156,0.40299302339553833,0.0,0.3669750690460205,0.0}, 
{0.0,0.9057600498199463,0.0,0.0,0.0,0.14199887216091156,0.0,0.0,0.0,0.42544686794281006,0.848019540309906,0.26802879571914673,0.562553882598877,0.02515663206577301,0.3651703894138336,0.0}, 
{0.0,1.0506385564804077,0.0,0.0,0.0,0.1833295077085495,0.16218489408493042,0.0,0.0,0.4554181694984436,0.869702160358429,0.31321242451667786,0.7221146821975708,0.08423018455505371,0.36336570978164673,0.0}, 
{0.0,1.1955170631408691,0.0,0.0,0.0,0.22466014325618744,0.3544766902923584,0.0,0.07890385389328003,0.48538944125175476,0.8913847208023071,0.358396053314209,0.8816755414009094,0.1433037370443344,0.36156100034713745,0.0}, 
{0.0,1.3403955698013306,0.0,0.0,0.0,0.2659907937049866,0.5467684864997864,0.0,0.1757086217403412,0.5153607130050659,0.9130673408508301,0.4035797119140625,1.0412362813949585,0.2023773044347763,0.35975632071495056,0.0}, 
{0.0,1.4852739572525024,0.0,0.0,0.0,0.3073213994503021,0.7390602231025696,0.0,0.27251335978507996,0.5453320145606995,0.934749960899353,0.44876331090927124,1.2007970809936523,0.2614508271217346,0.3579516112804413,0.0}, 
{0.0,1.6301524639129639,0.0,0.0,0.0,0.34865206480026245,0.9313520789146423,0.0,0.3693182170391083,0.575303316116333,0.9564325213432312,0.49394696950912476,1.3603578805923462,0.3205243945121765,0.3561469316482544,0.0}, 
{0.0,1.7750309705734253,0.0156480073928833,0.0,0.0,0.389982670545578,1.1236438751220703,0.0,0.46612295508384705,0.6052745580673218,0.9781151413917542,0.5391305685043335,1.51991868019104,0.3795979619026184,0.3543422520160675,0.0}, 
{0.0,1.9199094772338867,0.13237977027893066,0.0,0.0,0.43131333589553833,1.3159356117248535,0.0,0.5629278421401978,0.6352458596229553,0.9997977614402771,0.584314227104187,1.6794795989990234,0.4386715292930603,0.3525375425815582,0.0}, 
{0.0,2.0647881031036377,0.24911141395568848,0.0,0.0,0.47264397144317627,1.5082275867462158,0.0,0.659732460975647,0.6652171611785889,1.0214803218841553,0.6294978260993958,1.8390402793884277,0.4977450966835022,0.35073286294937134,0.0}, 
{0.0,2.2096664905548096,0.36584317684173584,0.0,0.0,0.5139746069908142,1.700519323348999,0.0,0.7565373182296753,0.6951884031295776,1.0431629419326782,0.6746814846992493,1.9986011981964111,0.5568186640739441,0.34892818331718445,0.0}, 
{0.0,2.3545451164245605,0.48257505893707275,0.0,0.0,0.5553053021430969,1.8928112983703613,0.0,0.8533421754837036,0.7251597046852112,1.0648455619812012,0.7198651432991028,2.1581621170043945,0.615892231464386,0.34712347388267517,0.0}, 
{0.0,2.4994235038757324,0.599306583404541,0.0,0.0,0.5966358780860901,2.0851027965545654,0.0,0.9501467943191528,0.7551310062408447,1.0865280628204346,0.7650486826896667,2.317722797393799,0.6749657392501831,0.3453187942504883,0.0}, 
{0.0,2.6443021297454834,0.7160383462905884,0.0,0.0,0.6379665732383728,2.2773947715759277,0.0,1.0469516515731812,0.7851022481918335,1.108210802078247,0.8102323412895203,2.4772837162017822,0.734039306640625,0.343514084815979,0.0}, 
{0.0,2.7891805171966553,0.8327702283859253,0.0,0.0,0.6792972087860107,2.469686508178711,0.0,1.1437565088272095,0.815073549747467,1.1298933029174805,0.8554159998893738,2.6368443965911865,0.7931128740310669,0.3417094051837921,0.0}, 
{0.0,2.934058904647827,0.9495017528533936,0.0,0.0,0.7206277847290039,2.661978244781494,0.0,1.2405611276626587,0.8450447916984558,1.1515759229660034,0.9005995988845825,2.796405076980591,0.852186381816864,0.3399047255516052,0.0}, 
{0.0,3.078937530517578,1.0662336349487305,0.0,0.0,0.7619584202766418,2.8542699813842773,0.0,1.337365984916687,0.8750160932540894,1.1732585430145264,0.945783257484436,2.955965995788574,0.9112599492073059,0.33810001611709595,0.0}, 
{0.0,3.223816156387329,1.1829652786254883,0.0,0.0,0.8032891154289246,3.0465619564056396,0.0,1.4341708421707153,0.9049873948097229,1.1949411630630493,0.9909669160842896,3.1155269145965576,0.9703335165977478,0.33629533648490906,0.0}, 
{0.0,3.368694543838501,1.2996971607208252,0.0,0.0,0.8446197509765625,3.238853693008423,0.0,1.5309756994247437,0.9349586963653564,1.2166237831115723,1.036150574684143,3.275087833404541,1.029407024383545,0.33449065685272217,0.0} 
};
Serial.printf("Los valores en el vector para la inferencia %d son------------------- \n", inference_count);
  for(int i=0; i<16;i++){
    input->data.f[i]= out_value[inference_count][i];
    Serial.printf("%f, ",input->data.f[i]);
  }

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
}