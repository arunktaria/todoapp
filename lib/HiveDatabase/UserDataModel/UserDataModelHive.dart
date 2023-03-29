
import 'package:hive/hive.dart';
part 'UserDataModelHive.g.dart';


@HiveType(typeId: 0)
class UserDataModelHive extends HiveObject{

  @HiveField(0)
  String? userName;

  @HiveField(1)
  String? password;

}
