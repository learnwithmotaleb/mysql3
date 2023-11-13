import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateProfile_screen extends StatefulWidget {

  final String id;
  final String name;
  final String email;
  final String password;


   UpdateProfile_screen({super.key, required this.id, required this.name,required  this.email, required this.password,});



  @override
  State<UpdateProfile_screen> createState() => _UpdateProfile_screenState();
}

class _UpdateProfile_screenState extends State<UpdateProfile_screen> {
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
          Stack(
            children: [
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
              Positioned(
                  left: 175,
                  top: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.camera_alt),
                    color: Colors.white,
                  ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Name: ${widget.name.toString()}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.edit))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ID: ${widget.id.toString()}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.edit))
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
              IconButton(onPressed: () {}, icon: Icon(Icons.edit))
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
              IconButton(onPressed: () {}, icon: Icon(Icons.edit))
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
              IconButton(onPressed: () {}, icon: Icon(Icons.edit))
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
                onPressed: () {},
                child: Text('Save Profile'),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
