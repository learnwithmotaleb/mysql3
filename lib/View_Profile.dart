import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysql3/main.dart';

import 'UpdateProfile.dart';

class View_Profile extends StatefulWidget {

  final String id;
  final String name;
  final String email;
  final String password;


  View_Profile({super.key, required this.id, required this.name,required this.email, required this.password, });



  @override
  State<View_Profile> createState() => View_ProfileState();
}

class View_ProfileState extends State<View_Profile> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.name.toString()}"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    child: ClipRRect(
                      child: Icon(Icons.person),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ID: ${widget.id.toString()}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name: ${widget.name.toString()}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "E-mail: ${widget.email.toString()}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Password: ${widget.password.toString()}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          UpdateProfile_screen(
                            id: widget.id,
                            name: widget.name,
                            email: widget.email,
                            password: widget.password,


                          )

                      ));
                    },
                    child: Text('Update Profile'),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
