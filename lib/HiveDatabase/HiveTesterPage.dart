import 'package:flutter/material.dart';
import 'package:todoapp/AppExt.dart';

class HiveTesterPage extends StatefulWidget {
  const HiveTesterPage({Key? key}) : super(key: key);

  @override
  State<HiveTesterPage> createState() => _HiveTesterPageState();
}

class _HiveTesterPageState extends State<HiveTesterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(child: Container(width: double.infinity,height: 50,child: Container(decoration: getBoxDecorationRoundedOnlytop(20, Colors.brown),child:  Row(children: [
        Expanded(child: Container(decoration: getBoxDecorationRoundedOnlyTopLeft(20, Colors.amber),margin: EdgeInsets.all(7),height:double.infinity,width:double.infinity ,child: Text("Save",style: TextStyle(color: Colors.black),),alignment: Alignment.center,)),
        Expanded(child: Container(color: Colors.amber,margin: EdgeInsets.all(7),height:double.infinity,width:double.infinity ,child: Text("Delete",style: TextStyle(color: Colors.black),),alignment: Alignment.center)),
        Expanded(child: Container(decoration: getBoxDecorationRoundedOnlyTopRight(20, Colors.amber),margin: EdgeInsets.all(7),height:double.infinity,width:double.infinity ,child: Text("Modify",style: TextStyle(color: Colors.black),),alignment: Alignment.center,)),
      ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      ),
      )
        ,),
      body: Container(
        child: Container(width: double.infinity,height: double.infinity,
        child: Column(children: [
          TextField(decoration: getEditFieldDecoration("username"),),
          SizedBox(height: 20,),
          TextField(decoration: getEditFieldDecoration("email"),),
          SizedBox(height: 20,),
          TextField(decoration: getEditFieldDecoration("Password"),),
        ],mainAxisAlignment: MainAxisAlignment.center,
        ),
        ),
      margin: EdgeInsets.all(50),),
    );
  }
}
