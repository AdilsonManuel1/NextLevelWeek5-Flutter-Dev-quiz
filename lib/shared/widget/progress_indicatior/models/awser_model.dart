import 'dart:convert';

class AwserModel {
  final String title;
  final bool isRight;

  AwserModel({
    required this.title,
   this.isRight=false,
  });


  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isRight': isRight,
    };
  }

  factory AwserModel.fromMap(Map<String, dynamic> map) {
    return AwserModel(
      title: map['title'],
      isRight: map['isRight']??false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AwserModel.fromJson(String source) => AwserModel.fromMap(json.decode(source));
}
