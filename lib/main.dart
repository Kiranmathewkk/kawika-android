import 'dart:convert';
import 'dart:developer';

import './home.dart';
import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
import 'package:http/http.dart'as http;
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  static const String _title = '';
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
 
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
 
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}
 
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Forgot Password',),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                    login(nameController.text,passwordController.text);

                    
                    
                    // Navigator.push(context,MaterialPageRoute(builder: (_)=>const HomeScreen()));
                  },
                )
            ),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                     'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }

  login(String username,String password)async{
   // String url="http://192.168.1.5:3000/login"; "email": "eve.holt@reqres.in",
   // "password": "cityslicka"
    String url="https://reqres.in/api/login";
    var data={
      "email":username,
      "password":password,
    };
  
    // Response response= await Dio().post(url,data:  data);
    print("-----------------------------------");
  
    //Response response= await Dio().post(url,data:FormData.fromMap(data));
    try{
       http.Response response=  await http.post(Uri.parse(url),body: data);
       print(response.body);

       if(response.statusCode==200){

        
         Navigator.push(context,MaterialPageRoute(builder: (_)=>const HomeScreen()));
         return true;
      }else{
        return false;
      }

    }catch (e){
        print(e);
        print("try catch==========");
    }
    // http.Response response=  await http.post(Uri.parse(url),body: data);
    print("dgfdgfdgkj+++++++++++++++++++++++++++++++++++++++");
    //  log(response.body.toString());
    
  }  
}