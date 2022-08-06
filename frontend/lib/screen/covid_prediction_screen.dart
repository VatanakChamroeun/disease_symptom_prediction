import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:frontend/api/api.dart';
import 'package:frontend/main.dart';
import 'package:frontend/model/predict_model.dart';
import 'package:frontend/severity_list.dart';
import 'package:frontend/screen/team_member_screen.dart';

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
            // buildAddSymptomButton(context),
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
        buildBreathingProblemInputBox(context),
      ],
    );
  }

  Widget buildBreathingProblemInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Breathing Problem"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: breathingProblemController,
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

  Widget buildFeverInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Fever"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: feverController,
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

  Widget buildDryCoughInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Dry Cough"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: dryCoughController,
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

  Widget buildSoreThroatInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Sore Throat"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: soreThroatController,
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

  Widget buildRunningNoseInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Running Nose"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: runningNoseController,
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

  Widget buildAsthmaInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Asthma"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: asthmaController,
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

  Widget buildChronicInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Chronic Lung Disease"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: chronicLungDiseaseController,
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

  Widget buildHeadacheInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Headache"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: headacheController,
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

  Widget buildHeartDiseaseInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Heart Disease"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: heartDiseaseController,
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

  Widget buildDiabetesInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Diabetes"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: diabetesController,
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

  Widget buildHyperTensionInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Hyper Tension"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: hyperTensionController,
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

  Widget buildFatigueInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Fatigue"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: fatigueController,
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

  Widget buildGastrointestinalInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Gastrointestinal"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: gastrointestinalController,
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

  Widget buildAbroadTravelInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Travel Abroad"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: abroadTravelController,
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

  Widget buildContactWithPatientInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Contact with Covid 19 Patient"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: contactWithCovidPatientController,
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

  Widget buildAttendLargeGatheringInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Attended Large Gathering"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: attendedLargeGatheringController,
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

  Widget buildVisitPublicExposedPlacesInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Visit Public Exposed Places"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: visitedPublicExposedPlacesController,
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

  Widget buildFamilyWorkingInPublicInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Family working in Public Exposed Places"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: familyWorkingInPublicExposedPlacesController,
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

  Widget buildWearingMaskInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Wearing Mask"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: wearingMasksController,
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

  Widget buildSaitizationFromMarketInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                children: const [
                  Text("Sanitization From Market"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      options: const ['Yes', 'No'],
                      controller: sanitizationFromMarketController,
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
            var breathProblem = breathingProblemController.value;
            var fever = feverController.value;
            var dryCough = dryCoughController.value;
            var soreThroat = soreThroatController.value;
            var runningNose = runningNoseController.value;
            var asthma = asthmaController.value;
            var chronicLungDisease = chronicLungDiseaseController.value;
            var headache = headacheController.value;
            var heartDisease = heartDiseaseController.value;
            var diabetes = diabetesController.value;
            var hyperTension = hyperTensionController.value;
            var fatigue = fatigueController.value;
            var gastrointestinal = gastrointestinalController.value;
            var abroadTravel = abroadTravelController.value;
            var contactWithCovidPatient =
                contactWithCovidPatientController.value;
            var attendedLargeGathering = attendedLargeGatheringController.value;
            var visitedPublicExposedPlaces =
                visitedPublicExposedPlacesController.value;
            var familyWorkingInPublicExposedPlaces =
                familyWorkingInPublicExposedPlacesController.value;
            var wearingMasks = wearingMasksController.value;
            var sanitizationFromMarket = sanitizationFromMarketController.value;
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
          child: const Text('Predict Covid 19'),
        ),
      ),
    );
  }

  Future<PredictModel> postRequest() async {
    var breathProblem = breathingProblemController.value;
    var fever = feverController.value;
    var dryCough = dryCoughController.value;
    var soreThroat = soreThroatController.value;
    var runningNose = runningNoseController.value;
    var asthma = asthmaController.value;
    var chronicLungDisease = chronicLungDiseaseController.value;
    var headache = headacheController.value;
    var heartDisease = heartDiseaseController.value;
    var diabetes = diabetesController.value;
    var hyperTension = hyperTensionController.value;
    var fatigue = fatigueController.value;
    var gastrointestinal = gastrointestinalController.value;
    var abroadTravel = abroadTravelController.value;
    var contactWithCovidPatient = contactWithCovidPatientController.value;
    var attendedLargeGathering = attendedLargeGatheringController.value;
    var visitedPublicExposedPlaces = visitedPublicExposedPlacesController.value;
    var familyWorkingInPublicExposedPlaces =
        familyWorkingInPublicExposedPlacesController.value;
    var wearingMasks = wearingMasksController.value;
    var sanitizationFromMarket = sanitizationFromMarketController.value;
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
