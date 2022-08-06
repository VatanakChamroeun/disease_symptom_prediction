import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:frontend/api/api.dart';
import 'package:frontend/main.dart';
import 'package:frontend/model/predict_model.dart';
import 'package:frontend/severity_list.dart';
import 'package:frontend/screen/team_member_screen.dart';

class DiseasePredictionScreen extends StatefulWidget {
  const DiseasePredictionScreen({Key? key}) : super(key: key);

  @override
  State<DiseasePredictionScreen> createState() => _DiseasePredictionScreenState();
}

class _DiseasePredictionScreenState extends State<DiseasePredictionScreen> {
  int? symptomLength = 5;
  List<DropdownEditingController<String>?> symptomController = [
    DropdownEditingController<String>(),
    DropdownEditingController<String>(),
    DropdownEditingController<String>(),
    DropdownEditingController<String>(),
    DropdownEditingController<String>(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Disease Symptom Prediction'),
        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: () {
              App.of(context)?.toggleTheme();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // buildAddSymptomButton(context),
            buildInputSymptom(context),
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
        setState(() {
          symptomController.clear();
        });
      },
      child: const Text('Clear Data'),
    );
  }

  Widget buildInputSymptom(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(symptomLength!, (index) {
        return Container(
          padding: const EdgeInsets.only(bottom: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Symptom ${index + 1}"),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      controller: symptomController[index],
                      options: severity,
                      decoration: InputDecoration(
                        // filled: true,
                        // fillColor: Colors.white.withOpacity(0.4),
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.arrow_drop_down),
                        label: Text(
                          'Symptom ${index + 1}',
                        ),
                      ),
                      dropdownHeight: 150,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
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

            showResult();
          },
          child: const Text('Predict'),
        ),
      ),
    );
  }

  Future<PredictModel> postRequest() async {
    return await Api.post(
      '/api/predict',
      {
        "Symptom_1": symptomController[0]?.value,
        "Symptom_2": symptomController[1]?.value,
        "Symptom_3": symptomController[2]?.value,
        "Symptom_4": symptomController[3]?.value,
        "Symptom_5": symptomController[4]?.value,
      },
    );
  }

  Future getRequest() async {
    print('hello');
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
                    Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        'Precaution',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(snapshot.data!.precaution!.length, (index) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            '• ${snapshot.data!.precaution![index]}',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        );
                      }),
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
