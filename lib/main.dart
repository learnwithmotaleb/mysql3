import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'InsertData.dart';
import 'UpdateProfile.dart';
import 'View_Profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://learnwithmotaleb.com/userdata/connection.php'));

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MySQL'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  View_Profile(
                    id: "${data[index]['id']}",
                    name: "${data[index]['Name']}",
                    email: "${data[index]['Email']}",
                    password: "${data[index]['Password']}",



                  )
              )
              );
            },
            title: Text(data[index]['Name']),
            subtitle: Text(data[index]['Email']),
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Center(
                child: Icon(Icons.person),
              ),
            ),
            trailing: TextButton(
              onPressed: (){},
              child: Text(data[index]['id']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>InsertRecord()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
