import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:local_storag_app/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as dev;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String content = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"), backgroundColor: Colors.pink),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(content, style: TextStyle(fontSize: 30, color: Colors.red)),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                // sharedPreferences.setString("name", 'maha');
                UserModel user = UserModel(1, "Ahmed", 50);
                sharedPreferences.setString(
                  "user",
                  json.encode(user.toString()),
                );
                dev.log(
                  '${sharedPreferences.setString("user", json.encode(user.toString()))}',
                );
              },
              child: Text("SAVE"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                setState(() {
                  content = sharedPreferences.getString("name") ?? "";
                });
                dev.log('  ${sharedPreferences.getString("name")}');
              },
              child: Text("LOAD"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                await sharedPreferences.remove("name");
                dev.log(content);
                setState(() {
                  content = "";
                });
              },
              child: Text("REMOVE"),
            ),
          ],
        ),
      ),
    );
  }
}
