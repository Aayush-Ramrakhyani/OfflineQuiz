class Student_Model {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? password;

  Studentmodel() {
    var mapping = Map<String, dynamic>();
    mapping["id"] = id ?? null;
    mapping["firstname"] = firstname;
    mapping["lastname"] = lastname;
    mapping["email"] = email;
    mapping["password"] = password;
    return mapping;
  }
}
