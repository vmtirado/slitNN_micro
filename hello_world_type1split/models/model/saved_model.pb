ир
▓Г
B
AssignVariableOp
resource
value"dtype"
dtypetypeИ
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(И

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetypeИ
E
Relu
features"T
activations"T"
Ttype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
╛
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring И
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
Ц
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 И"serve*2.4.02v2.4.0-rc4-71-g582c8d236cb8─╚
А
first_layer/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*#
shared_namefirst_layer/kernel
y
&first_layer/kernel/Read/ReadVariableOpReadVariableOpfirst_layer/kernel*
_output_shapes

:*
dtype0
x
first_layer/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*!
shared_namefirst_layer/bias
q
$first_layer/bias/Read/ReadVariableOpReadVariableOpfirst_layer/bias*
_output_shapes
:*
dtype0
В
second_layer/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*$
shared_namesecond_layer/kernel
{
'second_layer/kernel/Read/ReadVariableOpReadVariableOpsecond_layer/kernel*
_output_shapes

:*
dtype0
z
second_layer/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*"
shared_namesecond_layer/bias
s
%second_layer/bias/Read/ReadVariableOpReadVariableOpsecond_layer/bias*
_output_shapes
:*
dtype0
В
output_layer/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*$
shared_nameoutput_layer/kernel
{
'output_layer/kernel/Read/ReadVariableOpReadVariableOpoutput_layer/kernel*
_output_shapes

:*
dtype0
z
output_layer/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*"
shared_nameoutput_layer/bias
s
%output_layer/bias/Read/ReadVariableOpReadVariableOpoutput_layer/bias*
_output_shapes
:*
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
О
Adam/first_layer/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:**
shared_nameAdam/first_layer/kernel/m
З
-Adam/first_layer/kernel/m/Read/ReadVariableOpReadVariableOpAdam/first_layer/kernel/m*
_output_shapes

:*
dtype0
Ж
Adam/first_layer/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*(
shared_nameAdam/first_layer/bias/m

+Adam/first_layer/bias/m/Read/ReadVariableOpReadVariableOpAdam/first_layer/bias/m*
_output_shapes
:*
dtype0
Р
Adam/second_layer/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*+
shared_nameAdam/second_layer/kernel/m
Й
.Adam/second_layer/kernel/m/Read/ReadVariableOpReadVariableOpAdam/second_layer/kernel/m*
_output_shapes

:*
dtype0
И
Adam/second_layer/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*)
shared_nameAdam/second_layer/bias/m
Б
,Adam/second_layer/bias/m/Read/ReadVariableOpReadVariableOpAdam/second_layer/bias/m*
_output_shapes
:*
dtype0
Р
Adam/output_layer/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*+
shared_nameAdam/output_layer/kernel/m
Й
.Adam/output_layer/kernel/m/Read/ReadVariableOpReadVariableOpAdam/output_layer/kernel/m*
_output_shapes

:*
dtype0
И
Adam/output_layer/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*)
shared_nameAdam/output_layer/bias/m
Б
,Adam/output_layer/bias/m/Read/ReadVariableOpReadVariableOpAdam/output_layer/bias/m*
_output_shapes
:*
dtype0
О
Adam/first_layer/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:**
shared_nameAdam/first_layer/kernel/v
З
-Adam/first_layer/kernel/v/Read/ReadVariableOpReadVariableOpAdam/first_layer/kernel/v*
_output_shapes

:*
dtype0
Ж
Adam/first_layer/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*(
shared_nameAdam/first_layer/bias/v

+Adam/first_layer/bias/v/Read/ReadVariableOpReadVariableOpAdam/first_layer/bias/v*
_output_shapes
:*
dtype0
Р
Adam/second_layer/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*+
shared_nameAdam/second_layer/kernel/v
Й
.Adam/second_layer/kernel/v/Read/ReadVariableOpReadVariableOpAdam/second_layer/kernel/v*
_output_shapes

:*
dtype0
И
Adam/second_layer/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*)
shared_nameAdam/second_layer/bias/v
Б
,Adam/second_layer/bias/v/Read/ReadVariableOpReadVariableOpAdam/second_layer/bias/v*
_output_shapes
:*
dtype0
Р
Adam/output_layer/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*+
shared_nameAdam/output_layer/kernel/v
Й
.Adam/output_layer/kernel/v/Read/ReadVariableOpReadVariableOpAdam/output_layer/kernel/v*
_output_shapes

:*
dtype0
И
Adam/output_layer/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*)
shared_nameAdam/output_layer/bias/v
Б
,Adam/output_layer/bias/v/Read/ReadVariableOpReadVariableOpAdam/output_layer/bias/v*
_output_shapes
:*
dtype0

NoOpNoOp
ш%
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*г%
valueЩ%BЦ% BП%
ц
layer_with_weights-0
layer-0
layer_with_weights-1
layer-1
layer_with_weights-2
layer-2
	optimizer
	variables
regularization_losses
trainable_variables
	keras_api
	
signatures
h


kernel
bias
	variables
regularization_losses
trainable_variables
	keras_api
h

kernel
bias
	variables
regularization_losses
trainable_variables
	keras_api
h

kernel
bias
	variables
regularization_losses
trainable_variables
	keras_api
м
iter

beta_1

beta_2
	decay
 learning_rate
m@mAmBmCmDmE
vFvGvHvIvJvK
*

0
1
2
3
4
5
 
*

0
1
2
3
4
5
н

!layers
"layer_regularization_losses
	variables
#metrics
regularization_losses
$layer_metrics
trainable_variables
%non_trainable_variables
 
^\
VARIABLE_VALUEfirst_layer/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE
ZX
VARIABLE_VALUEfirst_layer/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE


0
1
 


0
1
н

&layers
'layer_regularization_losses
	variables
(metrics
regularization_losses
)layer_metrics
trainable_variables
*non_trainable_variables
_]
VARIABLE_VALUEsecond_layer/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE
[Y
VARIABLE_VALUEsecond_layer/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1
 

0
1
н

+layers
,layer_regularization_losses
	variables
-metrics
regularization_losses
.layer_metrics
trainable_variables
/non_trainable_variables
_]
VARIABLE_VALUEoutput_layer/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE
[Y
VARIABLE_VALUEoutput_layer/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1
 

0
1
н

0layers
1layer_regularization_losses
	variables
2metrics
regularization_losses
3layer_metrics
trainable_variables
4non_trainable_variables
HF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE
JH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE
ZX
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE

0
1
2
 

50
61
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
4
	7total
	8count
9	variables
:	keras_api
D
	;total
	<count
=
_fn_kwargs
>	variables
?	keras_api
OM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE
OM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE

70
81

9	variables
QO
VARIABLE_VALUEtotal_14keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE
QO
VARIABLE_VALUEcount_14keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE
 

;0
<1

>	variables
Б
VARIABLE_VALUEAdam/first_layer/kernel/mRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/first_layer/bias/mPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
ГА
VARIABLE_VALUEAdam/second_layer/kernel/mRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/second_layer/bias/mPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
ГА
VARIABLE_VALUEAdam/output_layer/kernel/mRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/output_layer/bias/mPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
Б
VARIABLE_VALUEAdam/first_layer/kernel/vRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/first_layer/bias/vPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
ГА
VARIABLE_VALUEAdam/second_layer/kernel/vRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/second_layer/bias/vPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
ГА
VARIABLE_VALUEAdam/output_layer/kernel/vRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/output_layer/bias/vPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
Д
!serving_default_first_layer_inputPlaceholder*'
_output_shapes
:         *
dtype0*
shape:         
╜
StatefulPartitionedCallStatefulPartitionedCall!serving_default_first_layer_inputfirst_layer/kernelfirst_layer/biassecond_layer/kernelsecond_layer/biasoutput_layer/kerneloutput_layer/bias*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8В *,
f'R%
#__inference_signature_wrapper_85279
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
ь

StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename&first_layer/kernel/Read/ReadVariableOp$first_layer/bias/Read/ReadVariableOp'second_layer/kernel/Read/ReadVariableOp%second_layer/bias/Read/ReadVariableOp'output_layer/kernel/Read/ReadVariableOp%output_layer/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOp-Adam/first_layer/kernel/m/Read/ReadVariableOp+Adam/first_layer/bias/m/Read/ReadVariableOp.Adam/second_layer/kernel/m/Read/ReadVariableOp,Adam/second_layer/bias/m/Read/ReadVariableOp.Adam/output_layer/kernel/m/Read/ReadVariableOp,Adam/output_layer/bias/m/Read/ReadVariableOp-Adam/first_layer/kernel/v/Read/ReadVariableOp+Adam/first_layer/bias/v/Read/ReadVariableOp.Adam/second_layer/kernel/v/Read/ReadVariableOp,Adam/second_layer/bias/v/Read/ReadVariableOp.Adam/output_layer/kernel/v/Read/ReadVariableOp,Adam/output_layer/bias/v/Read/ReadVariableOpConst*(
Tin!
2	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *'
f"R 
__inference__traced_save_85524
╦
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamefirst_layer/kernelfirst_layer/biassecond_layer/kernelsecond_layer/biasoutput_layer/kerneloutput_layer/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcounttotal_1count_1Adam/first_layer/kernel/mAdam/first_layer/bias/mAdam/second_layer/kernel/mAdam/second_layer/bias/mAdam/output_layer/kernel/mAdam/output_layer/bias/mAdam/first_layer/kernel/vAdam/first_layer/bias/vAdam/second_layer/kernel/vAdam/second_layer/bias/vAdam/output_layer/kernel/vAdam/output_layer/bias/v*'
Tin 
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В **
f%R#
!__inference__traced_restore_85615 ╫
▄
є
G__inference_sequential_4_layer_call_and_return_conditional_losses_85160
first_layer_input
first_layer_85101
first_layer_85103
second_layer_85128
second_layer_85130
output_layer_85154
output_layer_85156
identityИв#first_layer/StatefulPartitionedCallв$output_layer/StatefulPartitionedCallв$second_layer/StatefulPartitionedCallл
#first_layer/StatefulPartitionedCallStatefulPartitionedCallfirst_layer_inputfirst_layer_85101first_layer_85103*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *O
fJRH
F__inference_first_layer_layer_call_and_return_conditional_losses_850902%
#first_layer/StatefulPartitionedCall╦
$second_layer/StatefulPartitionedCallStatefulPartitionedCall,first_layer/StatefulPartitionedCall:output:0second_layer_85128second_layer_85130*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *P
fKRI
G__inference_second_layer_layer_call_and_return_conditional_losses_851172&
$second_layer/StatefulPartitionedCall╠
$output_layer/StatefulPartitionedCallStatefulPartitionedCall-second_layer/StatefulPartitionedCall:output:0output_layer_85154output_layer_85156*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *P
fKRI
G__inference_output_layer_layer_call_and_return_conditional_losses_851432&
$output_layer/StatefulPartitionedCallї
IdentityIdentity-output_layer/StatefulPartitionedCall:output:0$^first_layer/StatefulPartitionedCall%^output_layer/StatefulPartitionedCall%^second_layer/StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*>
_input_shapes-
+:         ::::::2J
#first_layer/StatefulPartitionedCall#first_layer/StatefulPartitionedCall2L
$output_layer/StatefulPartitionedCall$output_layer/StatefulPartitionedCall2L
$second_layer/StatefulPartitionedCall$second_layer/StatefulPartitionedCall:Z V
'
_output_shapes
:         
+
_user_specified_namefirst_layer_input
╗
ш
G__inference_sequential_4_layer_call_and_return_conditional_losses_85201

inputs
first_layer_85185
first_layer_85187
second_layer_85190
second_layer_85192
output_layer_85195
output_layer_85197
identityИв#first_layer/StatefulPartitionedCallв$output_layer/StatefulPartitionedCallв$second_layer/StatefulPartitionedCallа
#first_layer/StatefulPartitionedCallStatefulPartitionedCallinputsfirst_layer_85185first_layer_85187*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *O
fJRH
F__inference_first_layer_layer_call_and_return_conditional_losses_850902%
#first_layer/StatefulPartitionedCall╦
$second_layer/StatefulPartitionedCallStatefulPartitionedCall,first_layer/StatefulPartitionedCall:output:0second_layer_85190second_layer_85192*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *P
fKRI
G__inference_second_layer_layer_call_and_return_conditional_losses_851172&
$second_layer/StatefulPartitionedCall╠
$output_layer/StatefulPartitionedCallStatefulPartitionedCall-second_layer/StatefulPartitionedCall:output:0output_layer_85195output_layer_85197*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *P
fKRI
G__inference_output_layer_layer_call_and_return_conditional_losses_851432&
$output_layer/StatefulPartitionedCallї
IdentityIdentity-output_layer/StatefulPartitionedCall:output:0$^first_layer/StatefulPartitionedCall%^output_layer/StatefulPartitionedCall%^second_layer/StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*>
_input_shapes-
+:         ::::::2J
#first_layer/StatefulPartitionedCall#first_layer/StatefulPartitionedCall2L
$output_layer/StatefulPartitionedCall$output_layer/StatefulPartitionedCall2L
$second_layer/StatefulPartitionedCall$second_layer/StatefulPartitionedCall:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
у
Б
,__inference_second_layer_layer_call_fn_85401

inputs
unknown
	unknown_0
identityИвStatefulPartitionedCallў
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *P
fKRI
G__inference_second_layer_layer_call_and_return_conditional_losses_851172
StatefulPartitionedCallО
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*.
_input_shapes
:         ::22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
Ё	
▀
F__inference_first_layer_layer_call_and_return_conditional_losses_85372

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identityИвBiasAdd/ReadVariableOpвMatMul/ReadVariableOpН
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
MatMulМ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOpБ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:         2
ReluЧ
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*.
_input_shapes
:         ::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
г>
╦
__inference__traced_save_85524
file_prefix1
-savev2_first_layer_kernel_read_readvariableop/
+savev2_first_layer_bias_read_readvariableop2
.savev2_second_layer_kernel_read_readvariableop0
,savev2_second_layer_bias_read_readvariableop2
.savev2_output_layer_kernel_read_readvariableop0
,savev2_output_layer_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableop8
4savev2_adam_first_layer_kernel_m_read_readvariableop6
2savev2_adam_first_layer_bias_m_read_readvariableop9
5savev2_adam_second_layer_kernel_m_read_readvariableop7
3savev2_adam_second_layer_bias_m_read_readvariableop9
5savev2_adam_output_layer_kernel_m_read_readvariableop7
3savev2_adam_output_layer_bias_m_read_readvariableop8
4savev2_adam_first_layer_kernel_v_read_readvariableop6
2savev2_adam_first_layer_bias_v_read_readvariableop9
5savev2_adam_second_layer_kernel_v_read_readvariableop7
3savev2_adam_second_layer_bias_v_read_readvariableop9
5savev2_adam_output_layer_kernel_v_read_readvariableop7
3savev2_adam_output_layer_bias_v_read_readvariableop
savev2_const

identity_1ИвMergeV2CheckpointsП
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*2
StaticRegexFullMatchc
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part2
Constl
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part2	
Const_1Л
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: 2
Selectt

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: 2

StringJoinZ

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :2

num_shards
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 2
ShardedFilename/shardж
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilenameМ
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*Ю
valueФBСB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_names└
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
SaveV2/shape_and_slices╔
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0-savev2_first_layer_kernel_read_readvariableop+savev2_first_layer_bias_read_readvariableop.savev2_second_layer_kernel_read_readvariableop,savev2_second_layer_bias_read_readvariableop.savev2_output_layer_kernel_read_readvariableop,savev2_output_layer_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop4savev2_adam_first_layer_kernel_m_read_readvariableop2savev2_adam_first_layer_bias_m_read_readvariableop5savev2_adam_second_layer_kernel_m_read_readvariableop3savev2_adam_second_layer_bias_m_read_readvariableop5savev2_adam_output_layer_kernel_m_read_readvariableop3savev2_adam_output_layer_bias_m_read_readvariableop4savev2_adam_first_layer_kernel_v_read_readvariableop2savev2_adam_first_layer_bias_v_read_readvariableop5savev2_adam_second_layer_kernel_v_read_readvariableop3savev2_adam_second_layer_bias_v_read_readvariableop5savev2_adam_output_layer_kernel_v_read_readvariableop3savev2_adam_output_layer_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 **
dtypes 
2	2
SaveV2║
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixesб
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

Identitym

Identity_1IdentityIdentity:output:0^MergeV2Checkpoints*
T0*
_output_shapes
: 2

Identity_1"!

identity_1Identity_1:output:0*╗
_input_shapesй
ж: ::::::: : : : : : : : : ::::::::::::: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::

_output_shapes
: :

_output_shapes
: :	

_output_shapes
: :


_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::

_output_shapes
: 
у
╜
,__inference_sequential_4_layer_call_fn_85344

inputs
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
identityИвStatefulPartitionedCallл
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8В *P
fKRI
G__inference_sequential_4_layer_call_and_return_conditional_losses_852012
StatefulPartitionedCallО
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*>
_input_shapes-
+:         ::::::22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
у
Б
,__inference_output_layer_layer_call_fn_85420

inputs
unknown
	unknown_0
identityИвStatefulPartitionedCallў
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *P
fKRI
G__inference_output_layer_layer_call_and_return_conditional_losses_851432
StatefulPartitionedCallО
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*.
_input_shapes
:         ::22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
Щ
ь
G__inference_sequential_4_layer_call_and_return_conditional_losses_85327

inputs.
*first_layer_matmul_readvariableop_resource/
+first_layer_biasadd_readvariableop_resource/
+second_layer_matmul_readvariableop_resource0
,second_layer_biasadd_readvariableop_resource/
+output_layer_matmul_readvariableop_resource0
,output_layer_biasadd_readvariableop_resource
identityИв"first_layer/BiasAdd/ReadVariableOpв!first_layer/MatMul/ReadVariableOpв#output_layer/BiasAdd/ReadVariableOpв"output_layer/MatMul/ReadVariableOpв#second_layer/BiasAdd/ReadVariableOpв"second_layer/MatMul/ReadVariableOp▒
!first_layer/MatMul/ReadVariableOpReadVariableOp*first_layer_matmul_readvariableop_resource*
_output_shapes

:*
dtype02#
!first_layer/MatMul/ReadVariableOpЧ
first_layer/MatMulMatMulinputs)first_layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
first_layer/MatMul░
"first_layer/BiasAdd/ReadVariableOpReadVariableOp+first_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02$
"first_layer/BiasAdd/ReadVariableOp▒
first_layer/BiasAddBiasAddfirst_layer/MatMul:product:0*first_layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
first_layer/BiasAdd|
first_layer/ReluRelufirst_layer/BiasAdd:output:0*
T0*'
_output_shapes
:         2
first_layer/Relu┤
"second_layer/MatMul/ReadVariableOpReadVariableOp+second_layer_matmul_readvariableop_resource*
_output_shapes

:*
dtype02$
"second_layer/MatMul/ReadVariableOp▓
second_layer/MatMulMatMulfirst_layer/Relu:activations:0*second_layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
second_layer/MatMul│
#second_layer/BiasAdd/ReadVariableOpReadVariableOp,second_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02%
#second_layer/BiasAdd/ReadVariableOp╡
second_layer/BiasAddBiasAddsecond_layer/MatMul:product:0+second_layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
second_layer/BiasAdd
second_layer/ReluRelusecond_layer/BiasAdd:output:0*
T0*'
_output_shapes
:         2
second_layer/Relu┤
"output_layer/MatMul/ReadVariableOpReadVariableOp+output_layer_matmul_readvariableop_resource*
_output_shapes

:*
dtype02$
"output_layer/MatMul/ReadVariableOp│
output_layer/MatMulMatMulsecond_layer/Relu:activations:0*output_layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
output_layer/MatMul│
#output_layer/BiasAdd/ReadVariableOpReadVariableOp,output_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02%
#output_layer/BiasAdd/ReadVariableOp╡
output_layer/BiasAddBiasAddoutput_layer/MatMul:product:0+output_layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
output_layer/BiasAdd╨
IdentityIdentityoutput_layer/BiasAdd:output:0#^first_layer/BiasAdd/ReadVariableOp"^first_layer/MatMul/ReadVariableOp$^output_layer/BiasAdd/ReadVariableOp#^output_layer/MatMul/ReadVariableOp$^second_layer/BiasAdd/ReadVariableOp#^second_layer/MatMul/ReadVariableOp*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*>
_input_shapes-
+:         ::::::2H
"first_layer/BiasAdd/ReadVariableOp"first_layer/BiasAdd/ReadVariableOp2F
!first_layer/MatMul/ReadVariableOp!first_layer/MatMul/ReadVariableOp2J
#output_layer/BiasAdd/ReadVariableOp#output_layer/BiasAdd/ReadVariableOp2H
"output_layer/MatMul/ReadVariableOp"output_layer/MatMul/ReadVariableOp2J
#second_layer/BiasAdd/ReadVariableOp#second_layer/BiasAdd/ReadVariableOp2H
"second_layer/MatMul/ReadVariableOp"second_layer/MatMul/ReadVariableOp:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
Ё	
▀
F__inference_first_layer_layer_call_and_return_conditional_losses_85090

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identityИвBiasAdd/ReadVariableOpвMatMul/ReadVariableOpН
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
MatMulМ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOpБ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:         2
ReluЧ
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*.
_input_shapes
:         ::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
ё	
р
G__inference_second_layer_layer_call_and_return_conditional_losses_85392

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identityИвBiasAdd/ReadVariableOpвMatMul/ReadVariableOpН
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
MatMulМ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOpБ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:         2
ReluЧ
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*.
_input_shapes
:         ::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
Щ
ь
G__inference_sequential_4_layer_call_and_return_conditional_losses_85303

inputs.
*first_layer_matmul_readvariableop_resource/
+first_layer_biasadd_readvariableop_resource/
+second_layer_matmul_readvariableop_resource0
,second_layer_biasadd_readvariableop_resource/
+output_layer_matmul_readvariableop_resource0
,output_layer_biasadd_readvariableop_resource
identityИв"first_layer/BiasAdd/ReadVariableOpв!first_layer/MatMul/ReadVariableOpв#output_layer/BiasAdd/ReadVariableOpв"output_layer/MatMul/ReadVariableOpв#second_layer/BiasAdd/ReadVariableOpв"second_layer/MatMul/ReadVariableOp▒
!first_layer/MatMul/ReadVariableOpReadVariableOp*first_layer_matmul_readvariableop_resource*
_output_shapes

:*
dtype02#
!first_layer/MatMul/ReadVariableOpЧ
first_layer/MatMulMatMulinputs)first_layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
first_layer/MatMul░
"first_layer/BiasAdd/ReadVariableOpReadVariableOp+first_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02$
"first_layer/BiasAdd/ReadVariableOp▒
first_layer/BiasAddBiasAddfirst_layer/MatMul:product:0*first_layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
first_layer/BiasAdd|
first_layer/ReluRelufirst_layer/BiasAdd:output:0*
T0*'
_output_shapes
:         2
first_layer/Relu┤
"second_layer/MatMul/ReadVariableOpReadVariableOp+second_layer_matmul_readvariableop_resource*
_output_shapes

:*
dtype02$
"second_layer/MatMul/ReadVariableOp▓
second_layer/MatMulMatMulfirst_layer/Relu:activations:0*second_layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
second_layer/MatMul│
#second_layer/BiasAdd/ReadVariableOpReadVariableOp,second_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02%
#second_layer/BiasAdd/ReadVariableOp╡
second_layer/BiasAddBiasAddsecond_layer/MatMul:product:0+second_layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
second_layer/BiasAdd
second_layer/ReluRelusecond_layer/BiasAdd:output:0*
T0*'
_output_shapes
:         2
second_layer/Relu┤
"output_layer/MatMul/ReadVariableOpReadVariableOp+output_layer_matmul_readvariableop_resource*
_output_shapes

:*
dtype02$
"output_layer/MatMul/ReadVariableOp│
output_layer/MatMulMatMulsecond_layer/Relu:activations:0*output_layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
output_layer/MatMul│
#output_layer/BiasAdd/ReadVariableOpReadVariableOp,output_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02%
#output_layer/BiasAdd/ReadVariableOp╡
output_layer/BiasAddBiasAddoutput_layer/MatMul:product:0+output_layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
output_layer/BiasAdd╨
IdentityIdentityoutput_layer/BiasAdd:output:0#^first_layer/BiasAdd/ReadVariableOp"^first_layer/MatMul/ReadVariableOp$^output_layer/BiasAdd/ReadVariableOp#^output_layer/MatMul/ReadVariableOp$^second_layer/BiasAdd/ReadVariableOp#^second_layer/MatMul/ReadVariableOp*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*>
_input_shapes-
+:         ::::::2H
"first_layer/BiasAdd/ReadVariableOp"first_layer/BiasAdd/ReadVariableOp2F
!first_layer/MatMul/ReadVariableOp!first_layer/MatMul/ReadVariableOp2J
#output_layer/BiasAdd/ReadVariableOp#output_layer/BiasAdd/ReadVariableOp2H
"output_layer/MatMul/ReadVariableOp"output_layer/MatMul/ReadVariableOp2J
#second_layer/BiasAdd/ReadVariableOp#second_layer/BiasAdd/ReadVariableOp2H
"second_layer/MatMul/ReadVariableOp"second_layer/MatMul/ReadVariableOp:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
Х	
р
G__inference_output_layer_layer_call_and_return_conditional_losses_85411

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identityИвBiasAdd/ReadVariableOpвMatMul/ReadVariableOpН
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
MatMulМ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOpБ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2	
BiasAddХ
IdentityIdentityBiasAdd:output:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*.
_input_shapes
:         ::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
ўs
е
!__inference__traced_restore_85615
file_prefix'
#assignvariableop_first_layer_kernel'
#assignvariableop_1_first_layer_bias*
&assignvariableop_2_second_layer_kernel(
$assignvariableop_3_second_layer_bias*
&assignvariableop_4_output_layer_kernel(
$assignvariableop_5_output_layer_bias 
assignvariableop_6_adam_iter"
assignvariableop_7_adam_beta_1"
assignvariableop_8_adam_beta_2!
assignvariableop_9_adam_decay*
&assignvariableop_10_adam_learning_rate
assignvariableop_11_total
assignvariableop_12_count
assignvariableop_13_total_1
assignvariableop_14_count_11
-assignvariableop_15_adam_first_layer_kernel_m/
+assignvariableop_16_adam_first_layer_bias_m2
.assignvariableop_17_adam_second_layer_kernel_m0
,assignvariableop_18_adam_second_layer_bias_m2
.assignvariableop_19_adam_output_layer_kernel_m0
,assignvariableop_20_adam_output_layer_bias_m1
-assignvariableop_21_adam_first_layer_kernel_v/
+assignvariableop_22_adam_first_layer_bias_v2
.assignvariableop_23_adam_second_layer_kernel_v0
,assignvariableop_24_adam_second_layer_bias_v2
.assignvariableop_25_adam_output_layer_kernel_v0
,assignvariableop_26_adam_output_layer_bias_v
identity_28ИвAssignVariableOpвAssignVariableOp_1вAssignVariableOp_10вAssignVariableOp_11вAssignVariableOp_12вAssignVariableOp_13вAssignVariableOp_14вAssignVariableOp_15вAssignVariableOp_16вAssignVariableOp_17вAssignVariableOp_18вAssignVariableOp_19вAssignVariableOp_2вAssignVariableOp_20вAssignVariableOp_21вAssignVariableOp_22вAssignVariableOp_23вAssignVariableOp_24вAssignVariableOp_25вAssignVariableOp_26вAssignVariableOp_3вAssignVariableOp_4вAssignVariableOp_5вAssignVariableOp_6вAssignVariableOp_7вAssignVariableOp_8вAssignVariableOp_9Т
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*Ю
valueФBСB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_names╞
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*K
valueBB@B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
RestoreV2/shape_and_slices╕
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*Д
_output_shapesr
p::::::::::::::::::::::::::::**
dtypes 
2	2
	RestoreV2g
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:2

Identityв
AssignVariableOpAssignVariableOp#assignvariableop_first_layer_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOpk

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:2

Identity_1и
AssignVariableOp_1AssignVariableOp#assignvariableop_1_first_layer_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_1k

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:2

Identity_2л
AssignVariableOp_2AssignVariableOp&assignvariableop_2_second_layer_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_2k

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:2

Identity_3й
AssignVariableOp_3AssignVariableOp$assignvariableop_3_second_layer_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_3k

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:2

Identity_4л
AssignVariableOp_4AssignVariableOp&assignvariableop_4_output_layer_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_4k

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:2

Identity_5й
AssignVariableOp_5AssignVariableOp$assignvariableop_5_output_layer_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_5k

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0	*
_output_shapes
:2

Identity_6б
AssignVariableOp_6AssignVariableOpassignvariableop_6_adam_iterIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	2
AssignVariableOp_6k

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:2

Identity_7г
AssignVariableOp_7AssignVariableOpassignvariableop_7_adam_beta_1Identity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_7k

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:2

Identity_8г
AssignVariableOp_8AssignVariableOpassignvariableop_8_adam_beta_2Identity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_8k

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:2

Identity_9в
AssignVariableOp_9AssignVariableOpassignvariableop_9_adam_decayIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_9n
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:2
Identity_10о
AssignVariableOp_10AssignVariableOp&assignvariableop_10_adam_learning_rateIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_10n
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:2
Identity_11б
AssignVariableOp_11AssignVariableOpassignvariableop_11_totalIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_11n
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:2
Identity_12б
AssignVariableOp_12AssignVariableOpassignvariableop_12_countIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_12n
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:2
Identity_13г
AssignVariableOp_13AssignVariableOpassignvariableop_13_total_1Identity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_13n
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:2
Identity_14г
AssignVariableOp_14AssignVariableOpassignvariableop_14_count_1Identity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_14n
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:2
Identity_15╡
AssignVariableOp_15AssignVariableOp-assignvariableop_15_adam_first_layer_kernel_mIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_15n
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:2
Identity_16│
AssignVariableOp_16AssignVariableOp+assignvariableop_16_adam_first_layer_bias_mIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_16n
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:2
Identity_17╢
AssignVariableOp_17AssignVariableOp.assignvariableop_17_adam_second_layer_kernel_mIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_17n
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:2
Identity_18┤
AssignVariableOp_18AssignVariableOp,assignvariableop_18_adam_second_layer_bias_mIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_18n
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:2
Identity_19╢
AssignVariableOp_19AssignVariableOp.assignvariableop_19_adam_output_layer_kernel_mIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_19n
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:2
Identity_20┤
AssignVariableOp_20AssignVariableOp,assignvariableop_20_adam_output_layer_bias_mIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_20n
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:2
Identity_21╡
AssignVariableOp_21AssignVariableOp-assignvariableop_21_adam_first_layer_kernel_vIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_21n
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:2
Identity_22│
AssignVariableOp_22AssignVariableOp+assignvariableop_22_adam_first_layer_bias_vIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_22n
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:2
Identity_23╢
AssignVariableOp_23AssignVariableOp.assignvariableop_23_adam_second_layer_kernel_vIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_23n
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:2
Identity_24┤
AssignVariableOp_24AssignVariableOp,assignvariableop_24_adam_second_layer_bias_vIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_24n
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:2
Identity_25╢
AssignVariableOp_25AssignVariableOp.assignvariableop_25_adam_output_layer_kernel_vIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_25n
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:2
Identity_26┤
AssignVariableOp_26AssignVariableOp,assignvariableop_26_adam_output_layer_bias_vIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_269
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOp░
Identity_27Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2
Identity_27г
Identity_28IdentityIdentity_27:output:0^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*
T0*
_output_shapes
: 2
Identity_28"#
identity_28Identity_28:output:0*Б
_input_shapesp
n: :::::::::::::::::::::::::::2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
Х	
р
G__inference_output_layer_layer_call_and_return_conditional_losses_85143

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identityИвBiasAdd/ReadVariableOpвMatMul/ReadVariableOpН
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
MatMulМ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOpБ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2	
BiasAddХ
IdentityIdentityBiasAdd:output:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*.
_input_shapes
:         ::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
с
А
+__inference_first_layer_layer_call_fn_85381

inputs
unknown
	unknown_0
identityИвStatefulPartitionedCallЎ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *O
fJRH
F__inference_first_layer_layer_call_and_return_conditional_losses_850902
StatefulPartitionedCallО
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*.
_input_shapes
:         ::22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
▄
є
G__inference_sequential_4_layer_call_and_return_conditional_losses_85179
first_layer_input
first_layer_85163
first_layer_85165
second_layer_85168
second_layer_85170
output_layer_85173
output_layer_85175
identityИв#first_layer/StatefulPartitionedCallв$output_layer/StatefulPartitionedCallв$second_layer/StatefulPartitionedCallл
#first_layer/StatefulPartitionedCallStatefulPartitionedCallfirst_layer_inputfirst_layer_85163first_layer_85165*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *O
fJRH
F__inference_first_layer_layer_call_and_return_conditional_losses_850902%
#first_layer/StatefulPartitionedCall╦
$second_layer/StatefulPartitionedCallStatefulPartitionedCall,first_layer/StatefulPartitionedCall:output:0second_layer_85168second_layer_85170*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *P
fKRI
G__inference_second_layer_layer_call_and_return_conditional_losses_851172&
$second_layer/StatefulPartitionedCall╠
$output_layer/StatefulPartitionedCallStatefulPartitionedCall-second_layer/StatefulPartitionedCall:output:0output_layer_85173output_layer_85175*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *P
fKRI
G__inference_output_layer_layer_call_and_return_conditional_losses_851432&
$output_layer/StatefulPartitionedCallї
IdentityIdentity-output_layer/StatefulPartitionedCall:output:0$^first_layer/StatefulPartitionedCall%^output_layer/StatefulPartitionedCall%^second_layer/StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*>
_input_shapes-
+:         ::::::2J
#first_layer/StatefulPartitionedCall#first_layer/StatefulPartitionedCall2L
$output_layer/StatefulPartitionedCall$output_layer/StatefulPartitionedCall2L
$second_layer/StatefulPartitionedCall$second_layer/StatefulPartitionedCall:Z V
'
_output_shapes
:         
+
_user_specified_namefirst_layer_input
Д
╚
,__inference_sequential_4_layer_call_fn_85216
first_layer_input
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
identityИвStatefulPartitionedCall╢
StatefulPartitionedCallStatefulPartitionedCallfirst_layer_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8В *P
fKRI
G__inference_sequential_4_layer_call_and_return_conditional_losses_852012
StatefulPartitionedCallО
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*>
_input_shapes-
+:         ::::::22
StatefulPartitionedCallStatefulPartitionedCall:Z V
'
_output_shapes
:         
+
_user_specified_namefirst_layer_input
╘
┐
#__inference_signature_wrapper_85279
first_layer_input
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
identityИвStatefulPartitionedCallП
StatefulPartitionedCallStatefulPartitionedCallfirst_layer_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8В *)
f$R"
 __inference__wrapped_model_850752
StatefulPartitionedCallО
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*>
_input_shapes-
+:         ::::::22
StatefulPartitionedCallStatefulPartitionedCall:Z V
'
_output_shapes
:         
+
_user_specified_namefirst_layer_input
Д
╚
,__inference_sequential_4_layer_call_fn_85252
first_layer_input
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
identityИвStatefulPartitionedCall╢
StatefulPartitionedCallStatefulPartitionedCallfirst_layer_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8В *P
fKRI
G__inference_sequential_4_layer_call_and_return_conditional_losses_852372
StatefulPartitionedCallО
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*>
_input_shapes-
+:         ::::::22
StatefulPartitionedCallStatefulPartitionedCall:Z V
'
_output_shapes
:         
+
_user_specified_namefirst_layer_input
ё	
р
G__inference_second_layer_layer_call_and_return_conditional_losses_85117

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identityИвBiasAdd/ReadVariableOpвMatMul/ReadVariableOpН
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
MatMulМ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOpБ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:         2
ReluЧ
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*.
_input_shapes
:         ::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
у
╜
,__inference_sequential_4_layer_call_fn_85361

inputs
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
identityИвStatefulPartitionedCallл
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8В *P
fKRI
G__inference_sequential_4_layer_call_and_return_conditional_losses_852372
StatefulPartitionedCallО
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*>
_input_shapes-
+:         ::::::22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
╗
ш
G__inference_sequential_4_layer_call_and_return_conditional_losses_85237

inputs
first_layer_85221
first_layer_85223
second_layer_85226
second_layer_85228
output_layer_85231
output_layer_85233
identityИв#first_layer/StatefulPartitionedCallв$output_layer/StatefulPartitionedCallв$second_layer/StatefulPartitionedCallа
#first_layer/StatefulPartitionedCallStatefulPartitionedCallinputsfirst_layer_85221first_layer_85223*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *O
fJRH
F__inference_first_layer_layer_call_and_return_conditional_losses_850902%
#first_layer/StatefulPartitionedCall╦
$second_layer/StatefulPartitionedCallStatefulPartitionedCall,first_layer/StatefulPartitionedCall:output:0second_layer_85226second_layer_85228*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *P
fKRI
G__inference_second_layer_layer_call_and_return_conditional_losses_851172&
$second_layer/StatefulPartitionedCall╠
$output_layer/StatefulPartitionedCallStatefulPartitionedCall-second_layer/StatefulPartitionedCall:output:0output_layer_85231output_layer_85233*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *P
fKRI
G__inference_output_layer_layer_call_and_return_conditional_losses_851432&
$output_layer/StatefulPartitionedCallї
IdentityIdentity-output_layer/StatefulPartitionedCall:output:0$^first_layer/StatefulPartitionedCall%^output_layer/StatefulPartitionedCall%^second_layer/StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*>
_input_shapes-
+:         ::::::2J
#first_layer/StatefulPartitionedCall#first_layer/StatefulPartitionedCall2L
$output_layer/StatefulPartitionedCall$output_layer/StatefulPartitionedCall2L
$second_layer/StatefulPartitionedCall$second_layer/StatefulPartitionedCall:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
Л'
ь
 __inference__wrapped_model_85075
first_layer_input;
7sequential_4_first_layer_matmul_readvariableop_resource<
8sequential_4_first_layer_biasadd_readvariableop_resource<
8sequential_4_second_layer_matmul_readvariableop_resource=
9sequential_4_second_layer_biasadd_readvariableop_resource<
8sequential_4_output_layer_matmul_readvariableop_resource=
9sequential_4_output_layer_biasadd_readvariableop_resource
identityИв/sequential_4/first_layer/BiasAdd/ReadVariableOpв.sequential_4/first_layer/MatMul/ReadVariableOpв0sequential_4/output_layer/BiasAdd/ReadVariableOpв/sequential_4/output_layer/MatMul/ReadVariableOpв0sequential_4/second_layer/BiasAdd/ReadVariableOpв/sequential_4/second_layer/MatMul/ReadVariableOp╪
.sequential_4/first_layer/MatMul/ReadVariableOpReadVariableOp7sequential_4_first_layer_matmul_readvariableop_resource*
_output_shapes

:*
dtype020
.sequential_4/first_layer/MatMul/ReadVariableOp╔
sequential_4/first_layer/MatMulMatMulfirst_layer_input6sequential_4/first_layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2!
sequential_4/first_layer/MatMul╫
/sequential_4/first_layer/BiasAdd/ReadVariableOpReadVariableOp8sequential_4_first_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype021
/sequential_4/first_layer/BiasAdd/ReadVariableOpх
 sequential_4/first_layer/BiasAddBiasAdd)sequential_4/first_layer/MatMul:product:07sequential_4/first_layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2"
 sequential_4/first_layer/BiasAddг
sequential_4/first_layer/ReluRelu)sequential_4/first_layer/BiasAdd:output:0*
T0*'
_output_shapes
:         2
sequential_4/first_layer/Relu█
/sequential_4/second_layer/MatMul/ReadVariableOpReadVariableOp8sequential_4_second_layer_matmul_readvariableop_resource*
_output_shapes

:*
dtype021
/sequential_4/second_layer/MatMul/ReadVariableOpц
 sequential_4/second_layer/MatMulMatMul+sequential_4/first_layer/Relu:activations:07sequential_4/second_layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2"
 sequential_4/second_layer/MatMul┌
0sequential_4/second_layer/BiasAdd/ReadVariableOpReadVariableOp9sequential_4_second_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype022
0sequential_4/second_layer/BiasAdd/ReadVariableOpщ
!sequential_4/second_layer/BiasAddBiasAdd*sequential_4/second_layer/MatMul:product:08sequential_4/second_layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2#
!sequential_4/second_layer/BiasAddж
sequential_4/second_layer/ReluRelu*sequential_4/second_layer/BiasAdd:output:0*
T0*'
_output_shapes
:         2 
sequential_4/second_layer/Relu█
/sequential_4/output_layer/MatMul/ReadVariableOpReadVariableOp8sequential_4_output_layer_matmul_readvariableop_resource*
_output_shapes

:*
dtype021
/sequential_4/output_layer/MatMul/ReadVariableOpч
 sequential_4/output_layer/MatMulMatMul,sequential_4/second_layer/Relu:activations:07sequential_4/output_layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2"
 sequential_4/output_layer/MatMul┌
0sequential_4/output_layer/BiasAdd/ReadVariableOpReadVariableOp9sequential_4_output_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype022
0sequential_4/output_layer/BiasAdd/ReadVariableOpщ
!sequential_4/output_layer/BiasAddBiasAdd*sequential_4/output_layer/MatMul:product:08sequential_4/output_layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2#
!sequential_4/output_layer/BiasAddл
IdentityIdentity*sequential_4/output_layer/BiasAdd:output:00^sequential_4/first_layer/BiasAdd/ReadVariableOp/^sequential_4/first_layer/MatMul/ReadVariableOp1^sequential_4/output_layer/BiasAdd/ReadVariableOp0^sequential_4/output_layer/MatMul/ReadVariableOp1^sequential_4/second_layer/BiasAdd/ReadVariableOp0^sequential_4/second_layer/MatMul/ReadVariableOp*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*>
_input_shapes-
+:         ::::::2b
/sequential_4/first_layer/BiasAdd/ReadVariableOp/sequential_4/first_layer/BiasAdd/ReadVariableOp2`
.sequential_4/first_layer/MatMul/ReadVariableOp.sequential_4/first_layer/MatMul/ReadVariableOp2d
0sequential_4/output_layer/BiasAdd/ReadVariableOp0sequential_4/output_layer/BiasAdd/ReadVariableOp2b
/sequential_4/output_layer/MatMul/ReadVariableOp/sequential_4/output_layer/MatMul/ReadVariableOp2d
0sequential_4/second_layer/BiasAdd/ReadVariableOp0sequential_4/second_layer/BiasAdd/ReadVariableOp2b
/sequential_4/second_layer/MatMul/ReadVariableOp/sequential_4/second_layer/MatMul/ReadVariableOp:Z V
'
_output_shapes
:         
+
_user_specified_namefirst_layer_input"▒L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*├
serving_defaultп
O
first_layer_input:
#serving_default_first_layer_input:0         @
output_layer0
StatefulPartitionedCall:0         tensorflow/serving/predict:▓З
в#
layer_with_weights-0
layer-0
layer_with_weights-1
layer-1
layer_with_weights-2
layer-2
	optimizer
	variables
regularization_losses
trainable_variables
	keras_api
	
signatures
L__call__
M_default_save_signature
*N&call_and_return_all_conditional_losses"т 
_tf_keras_sequential├ {"class_name": "Sequential", "name": "sequential_4", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "must_restore_from_config": false, "config": {"name": "sequential_4", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 1]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "first_layer_input"}}, {"class_name": "Dense", "config": {"name": "first_layer", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 1]}, "dtype": "float32", "units": 16, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}, {"class_name": "Dense", "config": {"name": "second_layer", "trainable": true, "dtype": "float32", "units": 16, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}, {"class_name": "Dense", "config": {"name": "output_layer", "trainable": true, "dtype": "float32", "units": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}]}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 1}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 1]}, "is_graph_network": true, "keras_version": "2.4.0", "backend": "tensorflow", "model_config": {"class_name": "Sequential", "config": {"name": "sequential_4", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 1]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "first_layer_input"}}, {"class_name": "Dense", "config": {"name": "first_layer", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 1]}, "dtype": "float32", "units": 16, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}, {"class_name": "Dense", "config": {"name": "second_layer", "trainable": true, "dtype": "float32", "units": 16, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}, {"class_name": "Dense", "config": {"name": "output_layer", "trainable": true, "dtype": "float32", "units": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}]}}, "training_config": {"loss": "mse", "metrics": [[{"class_name": "MeanMetricWrapper", "config": {"name": "mae", "dtype": "float32", "fn": "mean_absolute_error"}}]], "weighted_metrics": null, "loss_weights": null, "optimizer_config": {"class_name": "Adam", "config": {"name": "Adam", "learning_rate": 0.0010000000474974513, "decay": 0.0, "beta_1": 0.8999999761581421, "beta_2": 0.9990000128746033, "epsilon": 1e-07, "amsgrad": false}}}}
ч


kernel
bias
	variables
regularization_losses
trainable_variables
	keras_api
O__call__
*P&call_and_return_all_conditional_losses"┬
_tf_keras_layerи{"class_name": "Dense", "name": "first_layer", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": {"class_name": "__tuple__", "items": [null, 1]}, "stateful": false, "must_restore_from_config": false, "config": {"name": "first_layer", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 1]}, "dtype": "float32", "units": 16, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 1}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 1]}}
·

kernel
bias
	variables
regularization_losses
trainable_variables
	keras_api
Q__call__
*R&call_and_return_all_conditional_losses"╒
_tf_keras_layer╗{"class_name": "Dense", "name": "second_layer", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "second_layer", "trainable": true, "dtype": "float32", "units": 16, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 16}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 16]}}
√

kernel
bias
	variables
regularization_losses
trainable_variables
	keras_api
S__call__
*T&call_and_return_all_conditional_losses"╓
_tf_keras_layer╝{"class_name": "Dense", "name": "output_layer", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "output_layer", "trainable": true, "dtype": "float32", "units": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 16}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 16]}}
┐
iter

beta_1

beta_2
	decay
 learning_rate
m@mAmBmCmDmE
vFvGvHvIvJvK"
	optimizer
J

0
1
2
3
4
5"
trackable_list_wrapper
 "
trackable_list_wrapper
J

0
1
2
3
4
5"
trackable_list_wrapper
╩

!layers
"layer_regularization_losses
	variables
#metrics
regularization_losses
$layer_metrics
trainable_variables
%non_trainable_variables
L__call__
M_default_save_signature
*N&call_and_return_all_conditional_losses
&N"call_and_return_conditional_losses"
_generic_user_object
,
Userving_default"
signature_map
$:"2first_layer/kernel
:2first_layer/bias
.

0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
.

0
1"
trackable_list_wrapper
н

&layers
'layer_regularization_losses
	variables
(metrics
regularization_losses
)layer_metrics
trainable_variables
*non_trainable_variables
O__call__
*P&call_and_return_all_conditional_losses
&P"call_and_return_conditional_losses"
_generic_user_object
%:#2second_layer/kernel
:2second_layer/bias
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
н

+layers
,layer_regularization_losses
	variables
-metrics
regularization_losses
.layer_metrics
trainable_variables
/non_trainable_variables
Q__call__
*R&call_and_return_all_conditional_losses
&R"call_and_return_conditional_losses"
_generic_user_object
%:#2output_layer/kernel
:2output_layer/bias
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
н

0layers
1layer_regularization_losses
	variables
2metrics
regularization_losses
3layer_metrics
trainable_variables
4non_trainable_variables
S__call__
*T&call_and_return_all_conditional_losses
&T"call_and_return_conditional_losses"
_generic_user_object
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
5
0
1
2"
trackable_list_wrapper
 "
trackable_list_wrapper
.
50
61"
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
╗
	7total
	8count
9	variables
:	keras_api"Д
_tf_keras_metricj{"class_name": "Mean", "name": "loss", "dtype": "float32", "config": {"name": "loss", "dtype": "float32"}}
Ї
	;total
	<count
=
_fn_kwargs
>	variables
?	keras_api"н
_tf_keras_metricТ{"class_name": "MeanMetricWrapper", "name": "mae", "dtype": "float32", "config": {"name": "mae", "dtype": "float32", "fn": "mean_absolute_error"}}
:  (2total
:  (2count
.
70
81"
trackable_list_wrapper
-
9	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
.
;0
<1"
trackable_list_wrapper
-
>	variables"
_generic_user_object
):'2Adam/first_layer/kernel/m
#:!2Adam/first_layer/bias/m
*:(2Adam/second_layer/kernel/m
$:"2Adam/second_layer/bias/m
*:(2Adam/output_layer/kernel/m
$:"2Adam/output_layer/bias/m
):'2Adam/first_layer/kernel/v
#:!2Adam/first_layer/bias/v
*:(2Adam/second_layer/kernel/v
$:"2Adam/second_layer/bias/v
*:(2Adam/output_layer/kernel/v
$:"2Adam/output_layer/bias/v
■2√
,__inference_sequential_4_layer_call_fn_85252
,__inference_sequential_4_layer_call_fn_85344
,__inference_sequential_4_layer_call_fn_85216
,__inference_sequential_4_layer_call_fn_85361└
╖▓│
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaultsк 
annotationsк *
 
ш2х
 __inference__wrapped_model_85075└
Л▓З
FullArgSpec
argsЪ 
varargsjargs
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *0в-
+К(
first_layer_input         
ъ2ч
G__inference_sequential_4_layer_call_and_return_conditional_losses_85303
G__inference_sequential_4_layer_call_and_return_conditional_losses_85160
G__inference_sequential_4_layer_call_and_return_conditional_losses_85327
G__inference_sequential_4_layer_call_and_return_conditional_losses_85179└
╖▓│
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaultsк 
annotationsк *
 
╒2╥
+__inference_first_layer_layer_call_fn_85381в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
Ё2э
F__inference_first_layer_layer_call_and_return_conditional_losses_85372в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
╓2╙
,__inference_second_layer_layer_call_fn_85401в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
ё2ю
G__inference_second_layer_layer_call_and_return_conditional_losses_85392в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
╓2╙
,__inference_output_layer_layer_call_fn_85420в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
ё2ю
G__inference_output_layer_layer_call_and_return_conditional_losses_85411в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
╘B╤
#__inference_signature_wrapper_85279first_layer_input"Ф
Н▓Й
FullArgSpec
argsЪ 
varargs
 
varkwjkwargs
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 ж
 __inference__wrapped_model_85075Б
:в7
0в-
+К(
first_layer_input         
к ";к8
6
output_layer&К#
output_layer         ж
F__inference_first_layer_layer_call_and_return_conditional_losses_85372\
/в,
%в"
 К
inputs         
к "%в"
К
0         
Ъ ~
+__inference_first_layer_layer_call_fn_85381O
/в,
%в"
 К
inputs         
к "К         з
G__inference_output_layer_layer_call_and_return_conditional_losses_85411\/в,
%в"
 К
inputs         
к "%в"
К
0         
Ъ 
,__inference_output_layer_layer_call_fn_85420O/в,
%в"
 К
inputs         
к "К         з
G__inference_second_layer_layer_call_and_return_conditional_losses_85392\/в,
%в"
 К
inputs         
к "%в"
К
0         
Ъ 
,__inference_second_layer_layer_call_fn_85401O/в,
%в"
 К
inputs         
к "К         ╛
G__inference_sequential_4_layer_call_and_return_conditional_losses_85160s
Bв?
8в5
+К(
first_layer_input         
p

 
к "%в"
К
0         
Ъ ╛
G__inference_sequential_4_layer_call_and_return_conditional_losses_85179s
Bв?
8в5
+К(
first_layer_input         
p 

 
к "%в"
К
0         
Ъ │
G__inference_sequential_4_layer_call_and_return_conditional_losses_85303h
7в4
-в*
 К
inputs         
p

 
к "%в"
К
0         
Ъ │
G__inference_sequential_4_layer_call_and_return_conditional_losses_85327h
7в4
-в*
 К
inputs         
p 

 
к "%в"
К
0         
Ъ Ц
,__inference_sequential_4_layer_call_fn_85216f
Bв?
8в5
+К(
first_layer_input         
p

 
к "К         Ц
,__inference_sequential_4_layer_call_fn_85252f
Bв?
8в5
+К(
first_layer_input         
p 

 
к "К         Л
,__inference_sequential_4_layer_call_fn_85344[
7в4
-в*
 К
inputs         
p

 
к "К         Л
,__inference_sequential_4_layer_call_fn_85361[
7в4
-в*
 К
inputs         
p 

 
к "К         ╛
#__inference_signature_wrapper_85279Ц
OвL
в 
EкB
@
first_layer_input+К(
first_layer_input         ";к8
6
output_layer&К#
output_layer         