import 'package:flutter/material.dart';
import 'package:sql_application/Assessment/LoginPage.dart';
import 'package:sql_application/Assessment/Student_Model.dart';
import 'package:sql_application/Assessment/Student_Service.dart';

class SIGNUPScreen extends StatefulWidget {
  const SIGNUPScreen({super.key});

  @override
  State<SIGNUPScreen> createState() => _SIGNUPScreenState();
}

class _SIGNUPScreenState extends State<SIGNUPScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController cpasswordcontroller = TextEditingController();
  TextEditingController firstcontroller = TextEditingController();
  TextEditingController lastcontroller = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 161, 91, 241),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              Transform.rotate(angle: 80.9,child: Container(child: Text("E", style: TextStyle(color: Color.fromARGB(255, 255, 230, 5) ,fontWeight: FontWeight.bold, fontSize: 100)))),
              Text("ECROP" , style: TextStyle(color: Color.fromARGB(255, 255, 230, 5) , fontSize: 80)),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 450,
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
                          controller: firstcontroller,
                          decoration: InputDecoration(
                            
                            labelText: "First Name",
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
                          controller: lastcontroller,
                          decoration: InputDecoration(
                            
                            labelText: "Last Name",
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
                      Container(
                        height: 50,
                        width: (MediaQuery.of(context).size.width * 80) /100,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(153, 239, 235, 235),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: TextField(
                          controller: cpasswordcontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.lock)
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                     
                      SizedBox(
                        width:100,
                        child: ElevatedButton(onPressed: () async {
                          String? firstname_v = firstcontroller.text.toString();
                          String? lastname_v = lastcontroller.text.toString();
                          String? email_v = emailcontroller.text.toString();
                          String? password_v = passwordcontroller.text.toString();
                          String? cpassword_v = cpasswordcontroller.text.toString();
                          var studentmodel = Student_Model();
                          if(password_v == cpassword_v)
                          {
                            studentmodel.firstname = firstname_v;
                            studentmodel.lastname = lastname_v;
                            studentmodel.email = email_v;
                            studentmodel.password = password_v;
                          

                            var service = Studentservice();
                            var result = await service.insertService(studentmodel);
                            print(result);

                          
                          
                            Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => LoginPage()));
                          }
                          
                          
                        }, child: Text("SIGNUP" , style: TextStyle(color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          
                          backgroundColor: Color.fromARGB(255, 161, 91, 241),
                        ),
                        ),
                      ),
                      
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