import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sql_application/Assessment/QuestionModel.dart';
import 'package:sql_application/Assessment/Question_Service.dart';
import 'package:sql_application/Assessment/QuestionsPage.dart';

class AddQuestionsPage extends StatefulWidget {
  const AddQuestionsPage({super.key});

  @override
  State<AddQuestionsPage> createState() => _AddQuestionsPageState();
}

class _AddQuestionsPageState extends State<AddQuestionsPage> {

  TextEditingController questioncontroller = TextEditingController();
  TextEditingController option1controller = TextEditingController();
  TextEditingController option2controller = TextEditingController();
  TextEditingController option3controller = TextEditingController();
  TextEditingController option4controller = TextEditingController();
  TextEditingController answercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 161, 91, 241),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 161, 91, 241),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              child: TextField(
                maxLines: 3,
                controller: questioncontroller,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  labelText: "Questions"
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              color: Colors.white,
              child: TextField(
                 controller: option1controller,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  labelText: "Qption 1"
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              color: Colors.white,
              child: TextField(
                 controller: option2controller,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  labelText: "Qption 2"
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              color: Colors.white,
              child: TextField(
                 controller: option3controller,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  labelText: "Qption 3"
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              color: Colors.white,
              child: TextField(
                 controller: option4controller,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  labelText: "Qption 4"
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              color: Colors.white,
              child: TextField(
                 controller: answercontroller,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  labelText: "Answer"
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () async {
                  String? question_v = questioncontroller.text.toString();
                  String? option1_v = option1controller.text.toString();
                  String? option2_v = option2controller.text.toString();
                  String? option3_v = option3controller.text.toString();
                  String? option4_v = option4controller.text.toString();
                  String? answer_v = answercontroller.text.toString();
                  var questionmodel = Question_Model();

                  questionmodel.question = question_v;
                  questionmodel.option1 = option1_v;
                  questionmodel.option2= option2_v;
                  questionmodel.option3= option3_v;
                  questionmodel.option4= option4_v;
                  questionmodel.answer= answer_v;
                          

                  var service = QuestionService();
                  var result = await service.insertService(questionmodel);
                  print(result);

                  questioncontroller.clear();
                  option1controller.clear();
                  option2controller.clear();
                  option3controller.clear();
                  option4controller.clear();
                  answercontroller.clear();

                }, child: Text("Upload")),
                ElevatedButton(onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionsPage(),));
                }, child: Text("Done"))
              ],
            )
          ],
        ),
      ),
    );
  }
}