part of 'todo_cubit.dart';

@immutable
abstract class TodoState extends Equatable {}

class TodoInitial extends TodoState {
  @override
  // TODO: implement props
  List<String?> get props => ["initial"];

}

class Success extends TodoState {
  Success(this.list);
  List<PostModel> list;
  @override
  // TODO: implement props
  List<Object?> get props => list;

}

class Error extends TodoState {
  Error(this.str);
  String str;
  @override
  // TODO: implement props
  List<String?> get props => [str];
}

class Failed extends TodoState {
  Failed(this.str);
  String str;
  @override
  // TODO: implement props
  List<String?> get props => [str];
}
