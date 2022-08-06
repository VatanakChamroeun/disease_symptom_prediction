import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:frontend/api/api.dart';
import 'package:frontend/main.dart';
import 'package:frontend/model/predict_model.dart';
import 'package:frontend/severity_list.dart';
import 'package:frontend/screen/team_member_screen.dart';

class HeartPredictionScreen extends StatefulWidget {
  const HeartPredictionScreen({Key? key}) : super(key: key);

  @override
  State<HeartPredictionScreen> createState() => _HeartPredictionScreenState();
}

class _HeartPredictionScreenState extends State<HeartPredictionScreen> {
  TextEditingController ageController = TextEditingController();
  DropdownEditingController<String> sexController = DropdownEditingController();
  DropdownEditingController<String> cpController = DropdownEditingController();
  TextEditingController trestbpsController = TextEditingController();
  TextEditingController cholController = TextEditingController();
  DropdownEditingController<String> fbsController = DropdownEditingController();
  DropdownEditingController<String> restecgController =
      DropdownEditingController();
  TextEditingController thalachController = TextEditingController();
  DropdownEditingController<String> exangController =
      DropdownEditingController();
  TextEditingController oldpeakController = TextEditingController();
  TextEditingController slopeController = TextEditingController();
  DropdownEditingController<String> caController = DropdownEditingController();
  DropdownEditingController<String> thalController =
      DropdownEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Heart Attack Prediction'),
        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: () {
              App.of(context)?.toggleTheme();
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildInputSymptom(context),
            // buildAddSymptomButton(context),
            buildPredictButton(context),
            TeamMemberScreen(),
          ],
        ),
      ),
    );
  }

  Widget buildAddSymptomButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {});
      },
      child: const Text('Clear Data'),
    );
  }

  Widget buildInputSymptom(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildAgeInputBox(context),
        buildGenderInputBox(context),
        buildCpInputBox(context),
        buildTrestbpsInputBox(context),
        buildCholInputBox(context),
        buildFbsInputBox(context),
        buildRestecgInputBox(context),
        buildThalachInputBox(context),
        buildExangInputBox(context),
        buildOldpeakInputBox(context),
        buildSlopeInputBox(context),
        buildCaInputBox(context),
        buildThalInputBox(context),
      ],
    );
  }

  Widget buildAgeInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Age"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildGenderInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Gender"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Male', 'Female'],
                      controller: sexController,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCpInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Chest pain type"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const [
                        'Pain 0%',
                        'Pain 25%',
                        'Pain 50%',
                        'Pain 75%'
                      ],
                      controller: cpController,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTrestbpsInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Resting blood pressure"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: trestbpsController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCholInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Serum cholestoral in mg/dl"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: cholController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildFbsInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Fasting blood sugar > 120 mg/dl"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: fbsController,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildRestecgInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Resting electrocardiographic results"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Normal', 'Having ST-T', 'Hypertrophy'],
                      controller: restecgController,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildThalachInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Maximum heart rate achieved"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: thalachController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildExangInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Exercise induced angina"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: exangController,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildOldpeakInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("ST depression induced by exercise relative to rest"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: oldpeakController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSlopeInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("The slope of the peak exercise ST segment"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: slopeController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCaInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Number of major vessels colored by flourosopy"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['0', '1', '2', '3'],
                      controller: caController,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildThalInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Thalassemia"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const [
                        'Normal',
                        'Fixed defect',
                        'Reversable defect'
                      ],
                      controller: thalController,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPredictButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ElevatedButton(
          onPressed: () async {
            // await Api.get('severity');
            // showResult();
            var age = ageController.text;
            var sex = sexController.value;
            var cp = cpController.value;
            var trestbps = trestbpsController.text;
            var chol = cholController.text;
            var fbs = fbsController.value;
            var restecg = restecgController.value;
            var thalach = thalachController.text;
            var exang = exangController.value;
            var oldpeak = oldpeakController.text;
            var slope = slopeController.text;
            var ca = caController.value;
            var thal = thalController.value;
            if (age != "" &&
                sex != null &&
                cp != null &&
                trestbps != "" &&
                chol != "" &&
                fbs != null &&
                restecg != null &&
                thalach != "" &&
                exang != null &&
                oldpeak != "" &&
                slope != "" &&
                ca != null &&
                thal != "") {
              showResult();
            } else {
              const snackBar = SnackBar(
                content: Text("Please input all the value."),
                backgroundColor: Colors.redAccent,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: const Text('Predict'),
        ),
      ),
    );
  }

  Widget buildPredictHeartDiseaseButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ElevatedButton(
          onPressed: () async {
            // await Api.get('severity');

            showResult();
          },
          child: const Text('Predict Heart Attack'),
        ),
      ),
    );
  }

  Future<PredictModel> postRequest() async {
    var age = ageController.text;
    var sex = sexController.value;
    var cp = cpController.value;
    var trestbps = trestbpsController.text;
    var chol = cholController.text;
    var fbs = fbsController.value;
    var restecg = restecgController.value;
    var thalach = thalachController.text;
    var exang = exangController.value;
    var oldpeak = oldpeakController.text;
    var slope = slopeController.text;
    var ca = caController.value;
    var thal = thalController.value;
    int cpValue = 0;
    if (cp == "Pain 75%") {
      cpValue = 3;
    } else if (cp == "Pain 50%") {
      cpValue = 2;
    } else if (cp == "Pain 25%") {
      cpValue = 1;
    } else {
      cpValue = 0;
    }
    int restecgValue = 0;
    if (restecg == "Normal") {
      restecgValue = 0;
    } else if (restecg == "Having ST-T") {
      restecgValue = 1;
    } else if (restecg == "Hypertrophy") {
      restecgValue = 2;
    }
    int thalValue = 0;
    if (thal == "Normal") {
      thalValue = 1;
    } else if (thal == "Fixed defect") {
      thalValue = 2;
    } else if (thal == "Reversable defect") {
      thalValue = 3;
    }
    var data = {
      "age": age,
      "sex": sex == "Male" ? 0 : 1,
      "cp": cpValue,
      "trestbps": trestbps,
      "chol": chol,
      "fbs": fbs == "Yes" ? 1 : 0,
      "restecg": restecgValue,
      "thalach": thalach,
      "exang": exang == "Yes" ? 1 : 0,
      "oldpeak": oldpeak,
      "slope": slope,
      "ca": ca,
      "thal": thalValue
    };
    return await Api.postHeartDisease('/api/predict', data);
  }

  Future getRequest() async {
    return await Api.get('/api/severity');
  }

  void showResult({String? content}) {
    Widget okButton = TextButton(
      child: const Text("CLOSE"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FutureBuilder<PredictModel>(
          future: postRequest(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return AlertDialog(
                title: Text(
                  "Predict Result",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data!.message!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                actions: [
                  okButton,
                ],
              );
            }
            return buildLoading();
          },
        );
      },
    );
  }

  Widget buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
