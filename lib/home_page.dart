import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();

  var nameFromPref = "";

  @override
  void initState() {
    super.initState();
    getValueFromPref();
  }

  getValueFromPref() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nameFromPref = prefs.getString('name') ?? "Default name";
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Text('Welcome, $nameFromPref'),
          TextField(
            controller: nameController,
          ),
          ElevatedButton(onPressed: () async{
            ///set data in pref

            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("name", nameController.text.toString());


          }, child: Text('Save'))
        ],
      ),
    );
  }
}
