import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/AppExt.dart';
import 'package:todoapp/HiveDatabase/HiveDatabaseHelperController.dart';

class HiveTesterPage extends StatefulWidget {
  const HiveTesterPage({Key? key}) : super(key: key);

  @override
  State<HiveTesterPage> createState() => _HiveTesterPageState();
}

String? mUsername;
String? mEmail;
String? mPassword;

class _HiveTesterPageState extends State<HiveTesterPage> {

  HiveDatabaseHelperController? hiveController = HiveDatabaseHelperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(child: Container(width: double.infinity,
        height: 50,
        child: Container(
          decoration: getBoxDecorationRoundedOnlytop(20, Colors.brown),
          child: Row(children: [
            Container(child:
            Expanded(child: InkWell(onTap: (){
              getUsername();
            },child: Container(
              decoration: getBoxDecorationRoundedOnlyTopLeft(20, Colors.amber),
              margin: EdgeInsets.all(7),
              height: double.infinity,
              width: double.infinity,
              child: Text("Save", style: TextStyle(color: Colors.black),),
              alignment: Alignment.center,)
            )
      )
              ,)
            ,
            Expanded(child: InkWell(onTap: (){
              hiveController?.deleteUserName();
            },child:  Container(color: Colors.amber,
                margin: EdgeInsets.all(7),
                height: double.infinity,
                width: double.infinity,
                child: Text("Delete", style: TextStyle(color: Colors.black),),
                alignment: Alignment.center)
              ,)
            ),
            Expanded(child: Container(
              decoration: getBoxDecorationRoundedOnlyTopRight(20, Colors.amber),
              margin: EdgeInsets.all(7),
              height: double.infinity,
              width: double.infinity,
              child: Text("Modify", style: TextStyle(color: Colors.black),),
              alignment: Alignment.center,)),

          ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ),
      )
        ,),
      body: Container(
        child: Container(width: double.infinity, height: double.infinity,
          child: Column(children: [
            TextField(decoration: getEditFieldDecoration("username"),
              onChanged: (username) {
                mUsername = username;
              },),
            SizedBox(height: 20,),
            TextField(
              decoration: getEditFieldDecoration("email"), onChanged: (email) {
              mEmail = email;
            },),
            SizedBox(height: 20,),
            TextField(decoration: getEditFieldDecoration("Password"),
              onChanged: (password) {
                mPassword = password;
              },), SizedBox(height: 20,),
            InkWell(child: SizedBox(height: 50,
              width: double.infinity,
              child: Container(
                decoration: getBoxDecorationRounded(50, Colors.brown),),),
              onTap: () {
                print("email $mEmail username $mUsername password $mPassword");
                saveDataToHive();
              },)
            ,
          ], mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        margin: EdgeInsets.all(50),),
    );
  }

  saveDataToHive() {
    print("saving data to hive");
    if (hiveController != null) {
      print("hive not null savedatatohive");
    } else {
      print("hive null savedatatohive");
    }

    hiveController?.insertUsername(mUsername!);
  }

  getUsername() async
  {
    var uname = await hiveController?.getUsername();
    print("username is $uname");
  }

}


