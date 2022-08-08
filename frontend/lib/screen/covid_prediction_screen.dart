import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:frontend/api/api.dart';
import 'package:frontend/main.dart';
import 'package:frontend/model/predict_model.dart';
import 'package:frontend/screen/team_member_screen.dart';
import 'package:frontend/widget/dropdown_input_widget.dart';
import 'package:frontend/widget/error_snackbar_widget.dart';
import 'package:frontend/widget/loading_widget.dart';

class CovidPredictionScreen extends StatefulWidget {
  const CovidPredictionScreen({Key? key}) : super(key: key);

  @override
  State<CovidPredictionScreen> createState() => _CovidPredictionScreenState();
}

class _CovidPredictionScreenState extends State<CovidPredictionScreen> {
  DropdownEditingController<String> breathingProblemController =
      DropdownEditingController();
  DropdownEditingController<String> feverController =
      DropdownEditingController();
  DropdownEditingController<String> dryCoughController =
      DropdownEditingController();
  DropdownEditingController<String> soreThroatController =
      DropdownEditingController();
  DropdownEditingController<String> runningNoseController =
      DropdownEditingController();
  DropdownEditingController<String> asthmaController =
      DropdownEditingController();
  DropdownEditingController<String> chronicLungDiseaseController =
      DropdownEditingController();
  DropdownEditingController<String> headacheController =
      DropdownEditingController();
  DropdownEditingController<String> heartDiseaseController =
      DropdownEditingController();
  DropdownEditingController<String> diabetesController =
      DropdownEditingController();
  DropdownEditingController<String> hyperTensionController =
      DropdownEditingController();
  DropdownEditingController<String> fatigueController =
      DropdownEditingController();
  DropdownEditingController<String> gastrointestinalController =
      DropdownEditingController();
  DropdownEditingController<String> abroadTravelController =
      DropdownEditingController();
  DropdownEditingController<String> contactWithCovidPatientController =
      DropdownEditingController();
  DropdownEditingController<String> attendedLargeGatheringController =
      DropdownEditingController();
  DropdownEditingController<String> visitedPublicExposedPlacesController =
      DropdownEditingController();
  DropdownEditingController<String>
      familyWorkingInPublicExposedPlacesController =
      DropdownEditingController();
  DropdownEditingController<String> wearingMasksController =
      DropdownEditingController();
  DropdownEditingController<String> sanitizationFromMarketController =
      DropdownEditingController();

  late String? breathProblem = breathingProblemController.value;
  late String? fever = feverController.value;
  late String? dryCough = dryCoughController.value;
  late String? soreThroat = soreThroatController.value;
  late String? runningNose = runningNoseController.value;
  late String? asthma = asthmaController.value;
  late String? chronicLungDisease = chronicLungDiseaseController.value;
  late String? headache = headacheController.value;
  late String? heartDisease = heartDiseaseController.value;
  late String? diabetes = diabetesController.value;
  late String? hyperTension = hyperTensionController.value;
  late String? fatigue = fatigueController.value;
  late String? gastrointestinal = gastrointestinalController.value;
  late String? abroadTravel = abroadTravelController.value;
  late String? contactWithCovidPatient =
      contactWithCovidPatientController.value;
  late String? attendedLargeGathering = attendedLargeGatheringController.value;
  late String? visitedPublicExposedPlaces =
      visitedPublicExposedPlacesController.value;
  late String? familyWorkingInPublicExposedPlaces =
      familyWorkingInPublicExposedPlacesController.value;
  late String? wearingMasks = wearingMasksController.value;
  late String? sanitizationFromMarket = sanitizationFromMarketController.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Covid 19 Prediction'),
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
            buildBreathingProblemInputBox(context),
            buildFeverInputBox(context),
            buildDryCoughInputBox(context),
            buildSoreThroatInputBox(context),
            buildRunningNoseInputBox(context),
            buildAsthmaInputBox(context),
            buildChronicInputBox(context),
            buildHeadacheInputBox(context),
            buildHeartDiseaseInputBox(context),
            buildDiabetesInputBox(context),
            buildHyperTensionInputBox(context),
            buildFatigueInputBox(context),
            buildGastrointestinalInputBox(context),
            buildAbroadTravelInputBox(context),
            buildContactWithPatientInputBox(context),
            buildAttendLargeGatheringInputBox(context),
            buildVisitPublicExposedPlacesInputBox(context),
            buildFamilyWorkingInPublicInputBox(context),
            buildWearingMaskInputBox(context),
            buildSaitizationFromMarketInputBox(context),
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
        buildBreathingProblemInputBox(context),
      ],
    );
  }

  Widget buildBreathingProblemInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Breathing Problem',
      controller: breathingProblemController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildFeverInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Fever',
      controller: feverController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildDryCoughInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Dry Cough',
      controller: dryCoughController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildSoreThroatInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Sore Throat',
      controller: soreThroatController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildRunningNoseInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Running Nose',
      controller: runningNoseController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildAsthmaInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Asthma',
      controller: asthmaController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildChronicInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Chronic Lung Disease',
      controller: chronicLungDiseaseController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildHeadacheInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Headache',
      controller: headacheController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildHeartDiseaseInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Heart Disease',
      controller: heartDiseaseController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildDiabetesInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Diabetes',
      controller: diabetesController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildHyperTensionInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Hyper Tension',
      controller: hyperTensionController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildFatigueInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Fatigue',
      controller: fatigueController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildGastrointestinalInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Gastrointestinal',
      controller: gastrointestinalController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildAbroadTravelInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Travel Abroad',
      controller: abroadTravelController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildContactWithPatientInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Contact with Covid 19 Patient',
      controller: contactWithCovidPatientController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildAttendLargeGatheringInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Attended Large Gathering',
      controller: attendedLargeGatheringController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildVisitPublicExposedPlacesInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Visit Public Exposed Places',
      controller: visitedPublicExposedPlacesController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildFamilyWorkingInPublicInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Family working in Public Exposed Places',
      controller: familyWorkingInPublicExposedPlacesController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildWearingMaskInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Wearing Mask',
      controller: wearingMasksController,
      dropdownData: const ['Yes', 'No'],
    );
  }

  Widget buildSaitizationFromMarketInputBox(BuildContext context) {
    return DropdownInputWidget(
      title: 'Sanitization From Market',
      controller: sanitizationFromMarketController,
      dropdownData: const ['Yes', 'No'],
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

            if (breathProblem != null &&
                fever != null &&
                dryCough != null &&
                soreThroat != null &&
                runningNose != null &&
                asthma != null &&
                chronicLungDisease != null &&
                headache != null &&
                heartDisease != null &&
                diabetes != null &&
                hyperTension != null &&
                fatigue != null &&
                gastrointestinal != null &&
                abroadTravel != null &&
                contactWithCovidPatient != null &&
                attendedLargeGathering != null &&
                visitedPublicExposedPlaces != null &&
                familyWorkingInPublicExposedPlaces != null &&
                wearingMasks != null &&
                sanitizationFromMarket != null) {
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
          child: const Text('Predict Covid 19'),
        ),
      ),
    );
  }

  Future<PredictModel> postRequest() async {
    var data = {
      "Breathing Problem": breathProblem == 'Yes' ? 1 : 0,
      "Fever": fever == 'Yes' ? 1 : 0,
      "Dry Cough": dryCough == 'Yes' ? 1 : 0,
      "Sore throat": soreThroat == 'Yes' ? 1 : 0,
      "Running Nose": runningNose == 'Yes' ? 1 : 0,
      "Asthma": asthma == 'Yes' ? 1 : 0,
      "Chronic Lung Disease": chronicLungDisease == 'Yes' ? 1 : 0,
      "Headache": headache == 'Yes' ? 1 : 0,
      "Heart Disease": heartDisease == 'Yes' ? 1 : 0,
      "Diabetes": diabetes == 'Yes' ? 1 : 0,
      "Hyper Tension": hyperTension == 'Yes' ? 1 : 0,
      "Fatigue ": fatigue == 'Yes' ? 1 : 0,
      "Gastrointestinal ": gastrointestinal == 'Yes' ? 1 : 0,
      "Abroad travel": abroadTravel == 'Yes' ? 1 : 0,
      "Contact with COVID Patient": contactWithCovidPatient == 'Yes' ? 1 : 0,
      "Attended Large Gathering": attendedLargeGathering == 'Yes' ? 1 : 0,
      "Visited Public Exposed Places":
          visitedPublicExposedPlaces == 'Yes' ? 1 : 0,
      "Family working in Public Exposed Places":
          familyWorkingInPublicExposedPlaces == 'Yes' ? 1 : 0,
      "Wearing Masks": wearingMasks == 'Yes' ? 1 : 0,
      "Sanitization from Market": sanitizationFromMarket == 'Yes' ? 1 : 0,
    };
    return await Api.postCovid('/api/predict', data);
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
            return const LoadingWidget();
          },
        );
      },
    );
  }
}
