import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:todoapp/AppExt.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  var psswdController = TextEditingController();
  late Future<void> _initializeControllerFuture;
  late XFile file;
  late ImagePicker picker;

//  EmailValidator emailValidator=EmailValidator();

  @override
  void initState() {
    super.initState();
    print("started login form");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      picker = ImagePicker();
      if(await getInternetConnection())
        {
          print("Connected");
        }else
          {
            print("DisConnected");
          }
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Form(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: getEditFieldDecoration("email"),
              controller: emailController,
              onChanged: (text) => {
                if (validateEmail(text))
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("hello dost")))
                  }
              },
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: getEditFieldDecoration("password"),
              controller: psswdController,
              onChanged: (text) => {
                if(validatePassword(text))
                  {
                    print("correct password")
                  }else
                    {
                      print("wrong password")
                    }
              },
            ),
            ElevatedButton(onPressed: () => {

            }, child: const Text("Submit")),
            Expanded(
                child: image == null ? Text("null image") : Image.file(image!))
          ],
        )),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await getPhotoFromCamera();
            setState(() {});
          } catch (e) {
            // If an error occurs, log the error to the console.
            print("exception $e");
          }
        },
      ),
    ));
  }

/*void alertDialogCustom() {
     showDialog<void>(context: context,
        builder:(BuildContext context)=>
        AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ));
  }*/

  File? image;

  Future getPhotoFromCamera() async {
    file = (await picker.pickImage(source: ImageSource.camera))!;
    image = File(file.path)!;
  }
}
