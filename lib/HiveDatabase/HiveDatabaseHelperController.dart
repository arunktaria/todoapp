

import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'HiveUserDataAdapter/UserdataAdapter.dart';
import 'UserDataModel/UserDataModelHive.dart';

class HiveDatabaseHelperController extends GetxController{

  static HiveDatabaseHelperController? instance=HiveDatabaseHelperController.initialize();
  
  BoxCollection? boxCollection;
  CollectionBox<dynamic>? userCollectionBox;

  factory HiveDatabaseHelperController()
  {
    return instance!;
  }

  HiveDatabaseHelperController.initialize()
  {
    print("initiaze singltone");
    setupDatabase();
  }

  setupDatabase() async
  {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    var dirPath="";
    new Directory(appDocDirectory.path+'/'+'dir').create(recursive: true).then((Directory directory) {
      print('Path of New Dir: '+directory.path);
      dirPath=directory.path;
      print("setupDatabase dir $dirPath");
      initializeDatabaseDir(dirPath);
    });


    print("initialize");
  }

  initializeDatabaseDir(String dirPath)async
  {
    boxCollection=await BoxCollection.open("db_todo", {'user'},path: dirPath);
    Hive.registerAdapter(UserDataModelHiveAdapter());
    userCollectionBox=await boxCollection?.openBox("user");
  }

  insertUsername(String value) async
  {
    await userCollectionBox?.put('username',value);
    print("insertUsername");
    getUsername();
  }

  getUsername()async{
    var txt=await userCollectionBox?.get("user");
    print("email is from database $txt");
    return txt;
  }

  insertUserData(UserDataModelHive ob)async
  {
    var hive=await Hive.openBox("user");
    hive.add(ob);
    print("object inserted  obb ${ob.userName} ob");
  }

  getUserData()async
  {
    print("getUserdata");
    return await userCollectionBox?.get("user");
  }

  deleteUserName(){
    userCollectionBox?.clear();
  }

}