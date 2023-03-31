import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todoapp/AppExt.dart';
import 'package:todoapp/HiveDatabase/HiveDatabaseHelperController.dart';
import 'package:todoapp/HiveDatabase/UserDataModel/UserDataModelHive.dart';

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

          child: Row(children: [
            Container(child:
            Expanded(child: InkWell(onTap: (){
              print("inkwell pressed");
              getUserData();
            },child: Container(
              decoration: getBoxDecorationRounded(10, Colors.blue),
              margin: EdgeInsets.all(7),
              height: double.infinity,
              width: double.infinity,
              child: Text("Save", style: TextStyle(color: Colors.white),),
              alignment: Alignment.center,)
            )
      )
              ,)
            ,
            Expanded(child: InkWell(onTap: (){
              hiveController?.deleteUserName();
            },child:  Container(
                decoration: getBoxDecorationRounded(10, Colors.red),
                margin: EdgeInsets.all(7),
                height: double.infinity,
                width: double.infinity,
                child: Text("Delete", style: TextStyle(color: Colors.white),),
                alignment: Alignment.center)
              ,)
            ),
            Expanded(child: Container(
              decoration: getBoxDecorationRounded(10, Colors.amber),
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

            Container(decoration: getBoxDecorationRounded(10, Colors.teal),child:
            Material(
              color: Colors.transparent,
              child:
            InkWell(child: SizedBox(height: 50,
              width: double.infinity,
              child: Container(
                alignment: Alignment.center,
                child: Text("Submit",style: TextStyle(color: Colors.white),),
                ),),
              onTap: () {
                print("email $mEmail username $mUsername password $mPassword");
                //saveDataToHive();
                saveUserData();
              },)
              ,),

            )

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

  saveUserData()
  {
    var ob=UserDataModelHive()
    ..userName=mUsername!
    ..password=mPassword!;
    hiveController?.insertUserData(ob);
    print("save   ${ob.userName}");
  }

  getUserData()async
  {
    if(hiveController!=null){
      print("hivve con not null");
    }else{
      print("hivve null hivve");
    }
    var ob=await hiveController?.getUserData();
    print("userData $ob");
    showToast("hive object $ob");
  }


  getUsername() async
  {
    var uname = await hiveController?.getUsername();
    print("username is $uname");
  }

}


