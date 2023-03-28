
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class UserDataModelHive extends HiveObject{

  @HiveType(typeId: 0)
  String? userName;

  @HiveType(typeId: 1)
  String? password;


}