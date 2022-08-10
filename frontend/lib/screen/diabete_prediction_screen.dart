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

class DiabetePredictionScreen extends StatefulWidget {
  const DiabetePredictionScreen({Key? key}) : super(key: key);

  @override
  State<DiabetePredictionScreen> createState() =>
      _DiabetePredictionScreenState();
}

class _DiabetePredictionScreenState extends State<DiabetePredictionScreen> {
  TextEditingController pregnanciesController = TextEditingController();
  TextEditingController glucoseController = TextEditingController();
  TextEditingController bloodPressureController = TextEditingController();
  TextEditingController skinThicknessController = TextEditingController();
  TextEditingController insulinController = TextEditingController();
  TextEditingController bmiController = TextEditingController();
  TextEditingController diabetesPredigreeController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  late String? age = ageController.text;
  late String? pregnancies = pregnanciesController.text;
  late String? glucose = glucoseController.text;
  late String? bloodPressure = bloodPressureController.text;
  late String? skinThickness = skinThicknessController.text;
  late String? insulin = insulinController.text;
  late String? bmi = bmiController.text;
  late String? diabetesPredigree = diabetesPredigreeController.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Diabete Attack Prediction'),
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
        buildPregnanciesInputBox(context),
        buildGlucoseInputBox(context),
        buildBloodPressureInputBox(context),
        buildSkinThicknessInputBox(context),
        buildInsulinInputBox(context),
        buildBmiInputBox(context),
        buildDiabetesPredigeeInputBox(context)
      ],
    );
  }

  Widget buildAgeInputBox(BuildContext context) {
    return TextInputWidget(
      title: 'Age',
      controller: ageController,
    );
  }

  Widget buildPregnanciesInputBox(BuildContext context) {
    return TextInputWidget(
      title: 'Pregnancies',
      controller: pregnanciesController,
    );
  }

  Widget buildGlucoseInputBox(BuildContext context) {
    return TextInputWidget(
      title: 'GLocose',
      controller: glucoseController,
    );
  }

  Widget buildBloodPressureInputBox(BuildContext context) {
    return TextInputWidget(
      title: 'Blood Pressure',
      controller: bloodPressureController,
    );
  }

  Widget buildInsulinInputBox(BuildContext context) {
    return TextInputWidget(
      title: 'Insulin',
      controller: insulinController,
    );
  }

  Widget buildSkinThicknessInputBox(BuildContext context) {
    return TextInputWidget(
      title: 'Skin Thickness',
      controller: skinThicknessController,
    );
  }

  Widget buildBmiInputBox(BuildContext context) {
    return TextInputWidget(
      title: 'BMI',
      controller: bmiController,
    );
  }

  Widget buildDiabetesPredigeeInputBox(BuildContext context) {
    return TextInputWidget(
      title: 'Diabetes Predigree',
      controller: diabetesPredigreeController,
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
                pregnancies != "" &&
                glucose != "" &&
                bloodPressure != "" &&
                skinThickness != "" &&
                insulin != "" &&
                bmi != "" &&
                diabetesPredigree != "") {
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
    var data = {
      "Age": age,
      "Pregnancies": pregnancies,
      "Glucose": glucose,
      "BloodPressure": bloodPressure,
      "SkinThickness": skinThickness,
      "Insulin": insulin,
      "BMI": bmi,
      "DiabetesPedigreeFunction": diabetesPredigree,
    };

    return await Api.postDiabte('/api/predict', data);
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
