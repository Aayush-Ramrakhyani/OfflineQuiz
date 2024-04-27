import 'package:sql_application/Assessment/QuestionModel.dart';
import 'package:sql_application/Assessment/Question_Repository.dart';

class QuestionService {
  late Repository _repository;
  QuestionService() {
    _repository = Repository();
  }

  insertService(Question_Model QuestionModel) {
    return _repository.insertData("Questions", QuestionModel.QuestionModell());
  }

  getservice() {
    return _repository.getdata("Questions");
  }

  getspecificservice(Question_Model QuestionModel) {
    return _repository.getspecificdata("Questions", QuestionModel.QuestionModell());
  }

  updateservice(Question_Model QuestionModel) {
    return _repository.updatedata("Questions", QuestionModel.QuestionModell());
  }

  deleteservice(int? id) {
    return _repository.deletedata("Questions", id);
  }
}
