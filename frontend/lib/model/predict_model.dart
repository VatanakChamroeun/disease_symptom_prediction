class PredictModel {
  String? message;
  List<String>? precaution;
  bool? hasDiabetes;

  PredictModel({this.message, this.precaution, this.hasDiabetes});

  PredictModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    precaution = json['precaution'].cast<String>();
    hasDiabetes = json['has_diabetes'];
  }
}
