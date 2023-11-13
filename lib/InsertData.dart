import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class InsertRecord extends StatefulWidget {
  const InsertRecord({super.key});

  @override
  State<InsertRecord> createState() => _InsertRecordState();
}

class _InsertRecordState extends State<InsertRecord> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> sentdataintable ()async{

    String name = nameController.text.toString();
    String email = emailController.text.toString();
    String password = passwordController.text.toString();

    final response = await http.get(Uri.parse("https://www.learnwithmotaleb.com/connection.php?name=$name&email=$email&password=$password"));

  }

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String? isValueDate(String? value){
    if(value?.trim().isNotEmpty ?? false){
      return null;
    }
    return 'Please enter some value!';
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Insert'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    validator: isValueDate ,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                        hintText: "Enter Your Name: ",
                        labelText: 'Name'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: isValueDate,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                        hintText: "Enter Your E-mail: ",
                        labelText: 'E-Mail'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    validator: isValueDate,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                        hintText: "Enter password",
                        labelText: 'Password'
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(onPressed: (){
                      if(_key.currentState!.validate()){
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context)=>AlertDialog(
                          title: Text('Data Insert Success'),
                          content: Text("Thank you"),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MyHomePage()), (route) => false);

                            }, child: Text('Yes'))
                          ],
                        ));
                        sentdataintable();
                      }else{
                        showDialog(context: context, builder: (context)=>AlertDialog(
                          title: Text('Empty data'),
                          content: Text("Please Try agin!"),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: Text('Cancle'))
                          ],
                        ));
                      }



                    }, child: Center(child: Text('Data Insert',style: TextStyle(
                      fontSize: 20,

                    ),))),
                  ),
                )
              ],
            ),
          )
      ),

    );
  }
}
