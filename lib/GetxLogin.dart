import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:todoapp/AppExt.dart';
import 'package:todoapp/LoginEventController.dart';
import 'package:todoapp/SharedPreferenceHelper.dart';

class GetxLogin extends StatefulWidget {
  const GetxLogin({Key? key}) : super(key: key);

  @override
  State<GetxLogin> createState() => _GetxLoginState();
}

class _GetxLoginState extends State<GetxLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isDataCorrect=false;
  bool email = false;
  String? storedEmail;
  bool password = false;

  var myKey=GlobalKey<ScaffoldState>();

  final getController = Get.put(LoginEventController());


  @override
  Widget build(BuildContext context) {
    print("build ");
    return SafeArea(child:
      Scaffold(key: myKey,
      drawer: getDrawer(),
        appBar: AppBar(title: Text("Login"),leading: Container(),),
        body: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            children: <Widget>[
              TextField(
                  onChanged: (text) => {getController.validateEmailGetx(text)},
                  controller: emailController,
                  decoration: getEditFieldDecoration("Email")),
              ConstrainedBox(
                  constraints: const BoxConstraints.expand(
                      width: double.infinity, height: 10)),
              TextField(
                onChanged: (text) => {
                  getController.validatePasswordGetx(text),
                emailtxt=text,
                },
                obscureText: true,
                autocorrect: false,
                decoration: getEditFieldDecoration("Password"),
                controller: passwordController,
              ),
              Obx((){
                email = getController.email.value;
                password = getController.psswd.value;
                isDataCorrect=email && password;
                Text("first email ${getController.emailSharedPref.value.toString()}");
                if (email && password){
                  return Text("Logged In");
                }
                else{
                  getEmailValue();
                  print("email is in obx $storedEmail");
                  return Text("email first ${storedEmail.toString()}");
                }
                print("email direct " + getController.email.value.toString());
                print("email is $email");
                return Container();
              }
                  // emailtxt = getController.email.value.toString();
                  ),
              ElevatedButton(
                onPressed: () => {
                  myKey.currentState?.openDrawer(),
                  if(isDataCorrect)
                    {
                      showMessage("Logged In",context),
                     //insertUserData()
                    }else{
                    showMessage("Wrong credentials",context)
                  },
                  print("on button press"),
                  getController.insertUserData(emailtxt),
                  getEmailValue()
                 // getEmailValue()
                 // getController.email.value.toString(),
                  //setEmailText(),
                },
                child: const Text("Login"),
              )
            ],
          ),
        )));
  }

  Widget getDrawer()
  {

    return Drawer(child: Column(children: [
      ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network("https://cdni.autocarindia.com/utils/imageresizer.ashx?n=https://cms.haymarketindia.net/model/uploads/modelimages/Hyundai-Aura-230120231337.jpg&w=350&h=251&q=90&c=1"),),
      Text("Car Bazar",style: TextStyle(fontSize: 20),),
      Expanded(child:
      SizedBox(width: double.infinity,height: double.maxFinite,child:
      Container(color: Colors.blueGrey,alignment: Alignment.topLeft,padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
        child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: const [
          Text("Sell buy ",style: TextStyle(fontSize: 20,color: Colors.white,)),
          SizedBox(height: 20,),
          Text("Exchange ",style: TextStyle(fontSize: 20,color: Colors.white)),
          SizedBox(height: 20,),
          Text("Setting ",style: TextStyle(fontSize: 20,color: Colors.white)),
          SizedBox(height: 20,),
          Text("Login",style: TextStyle(fontSize: 20,color: Colors.green)),
          SizedBox(height: 20,),
          Text("Logout",style: TextStyle(fontSize: 20,color: Colors.red)),
        ],)
        ,)
      ),
      )],
    ),
    );
  }

  void getEmailValue() async
  {
    var e= await getController.getUserEmail();
    print("email is ${e}");
    storedEmail=e.toString();
    Text(storedEmail.toString());
  }

  InputDecoration getEditFieldDecoration(String hint) {
    return InputDecoration(hintText: hint, border: getEditFieldBorder());
  }

  OutlineInputBorder getEditFieldBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(width: 5.1),
        gapPadding: 10.0);
  }
}
