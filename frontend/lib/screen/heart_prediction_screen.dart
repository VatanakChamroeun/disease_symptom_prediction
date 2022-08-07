import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:frontend/api/api.dart';
import 'package:frontend/main.dart';
import 'package:frontend/model/predict_model.dart';
import 'package:frontend/screen/team_member_screen.dart';
import 'package:frontend/widget/dropdown_input_widget.dart';
import 'package:frontend/widget/error_snackbar_widget.dart';
import 'package:frontend/widget/loading_widget.dart';
import 'package:frontend/widget/text_input_widget.dart';

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
  DropdownEditingController<String> restecgController = DropdownEditingController();
  TextEditingController thalachController = TextEditingController();
  DropdownEditingController<String> exangController = DropdownEditingController();
  TextEditingController oldpeakController = TextEditingController();
  TextEditingController slopeController = TextEditingController();
  DropdownEditingController<String> caController = DropdownEditingController();
  DropdownEditingController<String> thalController = DropdownEditingController();

  late String? age = ageController.text;
  late String? sex = sexController.value;
  late String? cp = cpController.value;
  late String? trestbps = trestbpsController.text;
  late String? chol = cholController.text;
  late String? fbs = fbsController.value;
  late String? restecg = restecgController.value;
  late String? thalach = thalachController.text;
  late String? exang = exangController.value;
  late String? oldpeak = oldpeakController.text;
  late String? slope = slopeController.text;
  late String? ca = caController.value;
  late String? thal = thalController.value;

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
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildInputSymptom(context),
            buildPredictButton(context),
            TeamMemberScreen(),
          ],
        ),
      ),
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
    return TextInputWidget(
      title: 'Age',
      controller: ageController,
    );
  }

  Widget buildGenderInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Gender',
      controller: sexController,
      dropdownData: const ['Male', 'Female'],
    );
  }

  Widget buildCpInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Chest pain type',
      controller: cpController,
      dropdownData: const ['Pain 0%', 'Pain 25%', 'Pain 50%', 'Pain 75%'],
    );
  }

  Widget buildTrestbpsInputBox(BuildContext context) {
    return TextInputWidget(
      title: 'Resting blood pressure',
      controller: trestbpsController,
    );
  }

  Widget buildCholInputBox(BuildContext context) {
    return TextInputWidget(
      title: 'Serum cholestoral in mg/dl',
      controller: cholController,
    );
  }

  Widget buildFbsInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Fasting blood sugar > 120 mg/dl',
      controller: fbsController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildRestecgInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Resting electrocardiographic results',
      controller: restecgController,
      dropdownData: const ['Normal', 'Having ST-T', 'Hypertrophy'],
    );
  }

  Widget buildThalachInputBox(BuildContext context) {
    return TextInputWidget(
      title: 'Maximum heart rate achieved',
      controller: thalachController,
    );
  }

  Widget buildExangInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Exercise induced angina',
      controller: exangController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildOldpeakInputBox(BuildContext context) {
    return TextInputWidget(
      title: 'ST depression induced by exercise relative to rest',
      controller: oldpeakController,
    );
  }

  Widget buildSlopeInputBox(BuildContext context) {
    return TextInputWidget(
      title: 'The slope of the peak exercise ST segment',
      controller: slopeController,
    );
  }

  Widget buildCaInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Number of major vessels colored by flourosopy',
      controller: caController,
      dropdownData: const ['0', '1', '2', '3'],
    );
  }

  Widget buildThalInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Thalassemia',
      controller: thalController,
      dropdownData: const ['Normal', 'Fixed defect', 'Reversable defect'],
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
              ScaffoldMessenger.of(context).showSnackBar(errorSnackbar);
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
            showResult();
          },
          child: const Text('Predict Heart Attack'),
        ),
      ),
    );
  }

  Future<PredictModel> postRequest() async {
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

  void showResult() {
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
            return const LoadingWidget();
          },
        );
      },
    );
  }
}
