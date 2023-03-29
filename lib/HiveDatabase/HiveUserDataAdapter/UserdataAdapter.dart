
import 'package:hive/hive.dart';

import '../UserDataModel/UserDataModelHive.dart';

class UserdataAdapter extends TypeAdapter<UserDataModelHive>{
  @override
  UserDataModelHive read(BinaryReader reader) {

    throw UnimplementedError();
  }

  @override
  int get typeId => throw UnimplementedError();

  @override
  void write(BinaryWriter writer, UserDataModelHive obj) {

  }


}