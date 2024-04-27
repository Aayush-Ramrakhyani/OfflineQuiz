import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sql_application/Assessment/QuestionModel.dart';
import 'package:sql_application/Assessment/Question_Service.dart';

class QuizPlayScreen extends StatefulWidget {
  const QuizPlayScreen({super.key});

  @override
  State<QuizPlayScreen> createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends State<QuizPlayScreen> {


  int? elementt;
  List randomm = [];
  int index = 0;

 
  List<Question_Model> QuestionList = [];
  var Question_Service = QuestionService();
  var QuestionModell;
  String? answer;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getRecordFromDB();
    Random _random = new Random();
    print(randomm);
    setState(() {
      
      elementt = randomm[_random.nextInt(randomm.length)];
      
    });
    
    
  }

  getRecordFromDB() async {
    var AllStudent = await Question_Service.getservice();

    AllStudent.forEach((studentobj) {
      
        QuestionModell = Question_Model();
        QuestionModell.id = studentobj["id"];
        QuestionModell.question= studentobj["question"];
        QuestionModell.option1 = studentobj["option1"];
        QuestionModell.option2= studentobj["option2"];
        QuestionModell.option3 = studentobj["option3"];
        QuestionModell.option4= studentobj["option4"];
        QuestionModell.answer = studentobj["answer"];
      setState(() {
        randomm.add(index);
        index = index + 1;
        print(randomm);
        QuestionList.add(QuestionModell);
      });
      
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 161, 91, 241),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 161, 91, 241),
      ),
      body: 
          Container(
                height: 300,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.transparent
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Card(
                    child: Column(
                      children: [
                        Text("${QuestionList[elementt!].question}" , style: TextStyle(color: Colors.black)),
                        RadioListTile(
                          title: Text('${QuestionList[elementt!].option1}'),
                          value: '${QuestionList[elementt!].option1}',
                          groupValue: answer,
                          onChanged: (value) {
                            setState(() {
                              answer = value;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('${QuestionList[elementt!].option2}'),
                          value: '${QuestionList[elementt!].option2}',
                          groupValue: answer,
                          onChanged: (value) {
                            setState(() {
                              answer = value;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('${QuestionList[elementt!].option3}'),
                          value: '${QuestionList[elementt!].option3}',
                          groupValue: answer,
                          onChanged: (value) {
                            setState(() {
                              answer = value;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('${QuestionList[elementt!].option4}'),
                          value: '${QuestionList[elementt!].option4}',
                          groupValue: answer,
                          onChanged: (value) {
                            setState(() {
                               answer = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
 
    );
  }
}