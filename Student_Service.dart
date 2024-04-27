import 'package:sql_application/Assessment/Student_Model.dart';
import 'package:sql_application/Assessment/Student_Repository.dart';


class Studentservice {
  late Repository _repository;
  Studentservice() {
    _repository = Repository();
  }

  insertService(Student_Model studentModel) {
    return _repository.insertData("Student", studentModel.Studentmodel());
  }

  getservice() {
    return _repository.getdata("Student");
  }

  getspecificservice(Student_Model student) {
    return _repository.getspecificdata("Student", student.Studentmodel());
  }

  updateservice(Student_Model student) {
    return _repository.updatedata("Student", student.Studentmodel());
  }

  deleteservice(int? id) {
    return _repository.deletedata("Student", id);
  }
}
