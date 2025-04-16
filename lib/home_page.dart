import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:local_storag_app/cache_helper.dart';
import 'package:local_storag_app/user.dart';
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
                UserModel user = UserModel(1, "Ahmed", 50);

                CacheHelper.setUser(user);
                print('DONE');
              },
              child: Text("SAVE"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                content =
                    CacheHelper.getString('name') ?? "You do not Enter Value";
                UserModel? user = CacheHelper.getUser();

                if (user == null) {
                  content = "No User Data";
                } else {
                  content = user.name;
                }
                // String? encodeUser = CacheHelper.getString('user');

                // if (encodeUser == null) {
                //   content = "No User Data";
                // } else {
                //   // Map<String, dynamic> userMap = json.decode(encodeUser);
                //   UserModel user = UserModel.fromJson(json.decode(encodeUser));
                //   content = user.name;
                // }
                setState(() {});
              },
              child: Text("LOAD"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                // SharedPreferences sharedPreferences =
                //     await SharedPreferences.getInstance();
                CacheHelper.removeAt("user");
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
