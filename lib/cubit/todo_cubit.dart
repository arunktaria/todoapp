import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todoapp/Model/PostModel.dart';

import '../Repository/PostRepository.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {


   TodoCubit() : super(TodoInitial()){
     print("cubit object created");
  }

  Future<void> getList() async {
    var repo = Repo();
    var data = await repo.getPosts();

    try{
      if(data!=null){
        emit(Success(data!));
      }else
        {
          emit(Failed(state.props.first.toString()));
        }
    }catch(e){
      print("cubit error $e");
      emit(Error(state.props.first.toString()));
    }

  }

}