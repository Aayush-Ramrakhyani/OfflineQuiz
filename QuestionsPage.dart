import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sql_application/Assessment/AddQuestions.dart';
import 'package:sql_application/Assessment/QuestionModel.dart';
import 'package:sql_application/Assessment/Question_Service.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {

   List<Question_Model> QuestionList = [];
  var questionservice = QuestionService();
  var QuestionModel1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getRecordFromDB();
  }

  getRecordFromDB() async {
    var AllQuestions = await questionservice.getservice();

    AllQuestions.forEach((questionobj) {
      
        QuestionModel1 = Question_Model();
        QuestionModel1.id = questionobj["id"];
        QuestionModel1.question= questionobj["question"];
        QuestionModel1.option1 = questionobj["option1"];
        QuestionModel1.option2= questionobj["option2"];
        QuestionModel1.option3= questionobj["option3"];
        QuestionModel1.option4= questionobj["option4"];
        QuestionModel1.answer= questionobj["answer"];

      setState(() {
        QuestionList.add(QuestionModel1);
      });
      
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 161, 91, 241),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 161, 91, 241),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: QuestionList.length,
        itemBuilder: (context, index) {
          return Container(
            child: ExpansionTile(  
              leading: Text("${QuestionList[index].id}. " , style: TextStyle(fontSize: 20),),
              title: Text("${QuestionList[index].question}", style: TextStyle(fontSize: 15)),
              children: [
                Text("${QuestionList[index].answer}", style: TextStyle(fontSize: 15))
              ], 
            ),
          );
      },),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddQuestionsPage(),));
      },child: Icon(Icons.add_box),
      backgroundColor: Colors.white,
      ),
    );
  }
}