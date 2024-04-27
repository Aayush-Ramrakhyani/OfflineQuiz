import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sql_application/Assessment/DashBoard.dart';
import 'package:sql_application/Assessment/SIGNUP.dart';
import 'package:sql_application/Assessment/Student_Model.dart';
import 'package:sql_application/Assessment/Student_Service.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  List<Student_Model> StudentList = [];
  var studentservice = Studentservice();
  var StudentModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getRecordFromDB();
  }

  getRecordFromDB() async {
    var AllStudent = await studentservice.getservice();

    AllStudent.forEach((studentobj) {
      
        StudentModel = Student_Model();
        StudentModel.id = studentobj["id"];
        StudentModel.firstname= studentobj["firstname"];
        StudentModel.lastname = studentobj["lastname"];
        StudentModel.email= studentobj["email"];
        StudentModel.password = studentobj["password"];

      setState(() {
        StudentList.add(StudentModel);
      });
      
    });
  }
  
  void verifiy()
  {
    String? emaill = emailcontroller.text.toString();
    String? passwordd = passwordcontroller.text.toString();
    for(int index=0 ; index< StudentList.length ; index++)
    {
      if(emaill == StudentList[index].email)
      {
        print(StudentList[index].email);
        if(passwordd ==  StudentList[index].password)
        {
          emailcontroller.clear();
          passwordcontroller.clear();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashBoardScreen(),));
        
        }
        
      }
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 161, 91, 241),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 130,),
              Transform.rotate(angle: 80.9,child: Container(child: Text("E", style: TextStyle(color: Color.fromARGB(255, 255, 230, 5) ,fontWeight: FontWeight.bold, fontSize: 100)))),
              Text("ECORP" , style: TextStyle(color: Color.fromARGB(255, 255, 230, 5) , fontSize: 80)),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                   
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       SizedBox(height: 20,),
                      Container(
                        height: 50,
                        width: (MediaQuery.of(context).size.width * 80) /100,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(153, 239, 235, 235),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: TextField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                            prefixIcon: Icon(Icons.person_2_rounded)
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 50,
                         width: (MediaQuery.of(context).size.width * 80) /100,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(153, 239, 235, 235),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: TextField(
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.lock)
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: Center(child: Text("Forget Password?" , style: TextStyle(fontSize: 20),))),
                      SizedBox(height: 10),
                      SizedBox(
                        width:100,
                        child: ElevatedButton(onPressed: () {
                          verifiy();
                        }, child: Text("LOGIN" , style: TextStyle(color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          
                          backgroundColor: Color.fromARGB(255, 161, 91, 241),
                        ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => SIGNUPScreen()));
                        },
                        child: Center(child: Text("SIGNUP" , style: TextStyle(fontSize: 15),))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}