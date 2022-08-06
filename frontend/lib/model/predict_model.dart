class PredictModel {
  String? message;
  List<String>? precaution;
  bool? hasDiabetes;
  bool? hasHeartDisease;
  bool? hasTuberCulosis;

  PredictModel({this.message, this.precaution, this.hasDiabetes, this.hasHeartDisease});

  PredictModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    precaution = json['precaution'].cast<String>();
    hasDiabetes = json['has_diabetes'];
    hasHeartDisease = json['has_heart_disease'];
    hasTuberCulosis = json['has_tuberculosis'];
  }
}
