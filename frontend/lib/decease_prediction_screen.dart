import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:frontend/api.dart';
import 'package:frontend/severity_list.dart';
import 'package:frontend/team_member_screen.dart';

class DeceasePredictionScreen extends StatefulWidget {
  const DeceasePredictionScreen({Key? key}) : super(key: key);

  @override
  State<DeceasePredictionScreen> createState() => _DeceasePredictionScreenState();
}

class _DeceasePredictionScreenState extends State<DeceasePredictionScreen> {
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildAddSymptomButton(context),
            buildInputSymptom(context),
            buildPredictButton(context),
            TeamMemberScreen(),
          ],
        ),
      ),
    );
  }

  Widget buildAddSymptomButton(BuildContext context) {
    return Container();
  }

  Widget buildInputSymptom(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(symptomLength!, (index) {
        return Container(
          padding: const EdgeInsets.only(bottom: 20, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Symptom ${index + 1}"),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextDropdownFormField(
                      controller: symptomController[index],
                      options: severity,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.arrow_drop_down),
                        label: Text('Symptom ${index + 1}'),
                      ),
                      dropdownHeight: 120,
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
    return FutureBuilder(
      builder: (context, snapshot) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: 100,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ElevatedButton(
              onPressed: () async {
                // await postRequest();

                // showResult(content: "Hello");
              },
              child: const Text('Predict'),
            ),
          ),
        );
      },
    );
  }

  postRequest() async {
    await Api.post(
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

  showResult({required String? content}) {
    Widget okButton = TextButton(
      child: const Text("CLOSE"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Predict Result", textAlign: TextAlign.center),
          content: Text(
            content!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            okButton,
          ],
        );
      },
    );
  }
}
