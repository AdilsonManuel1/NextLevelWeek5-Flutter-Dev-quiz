import 'dart:convert';

import 'package:devquiz/shared/widget/progress_indicatior/models/awser_model.dart';

class QuestionModel {
  final String title;
  final List<AwserModel>awsers;

  QuestionModel({required this.title, required this.awsers}): assert(
    awsers.length ==4,
  );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'awnsers': awsers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      awsers: List<AwserModel>.from(
        map['awnsers']?.map((x)=> AwserModel.fromMap(x))
      ),
      
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(json.decode(source));
}
