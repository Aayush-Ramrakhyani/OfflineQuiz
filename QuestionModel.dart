class Question_Model {
  int? id;
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  String? answer;

  QuestionModell() {
    var mapping = Map<String, dynamic>();
    mapping["id"] = id ?? null;
    mapping["question"] = question;
    mapping["option1"] = option1;
    mapping["option2"] = option2;
    mapping["option3"] = option3;
    mapping["option4"] = option4;
    mapping["answer"] = answer;
    return mapping;
  }
}
