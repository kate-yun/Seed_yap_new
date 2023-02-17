import 'dart:convert';

Goal goalFromJson(String str) => Goal.fromMap(json.decode(str));
String goalToJson(Goal data) => json.encode(data.toMap());

/* 대충 저장되는 정보 (String)
  {"objective":"나는 목표입니다.","isDone":false,"startDate":1674911270715,"endDate":1674911270715}
*/
class Goal {
  String objective; //목표
  DateTime startDate; // 목표 입력 시작 날짜
  DateTime? endDate; //목표 달성 날짜
  Goal({
    required this.objective,
    required this.startDate,
    this.endDate,
  });
  factory Goal.fromMap(Map<String, dynamic> json) => Goal(
        objective: json["objective"],
        startDate: DateTime.fromMillisecondsSinceEpoch(json["startDate"]),
        endDate: json["endDate"] != null
            ? DateTime.fromMillisecondsSinceEpoch(json["endDate"])
            : null,
      );
  Map<String, dynamic> toMap() => {
        "objective": objective,
        "startDate": startDate.millisecondsSinceEpoch,
        "endDate": endDate?.millisecondsSinceEpoch,
      };
}
