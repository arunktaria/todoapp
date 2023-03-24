import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todoapp/Model/PostModel.dart';
import 'package:todoapp/cubit/todo_cubit.dart';

class Repo{

  Future<List<PostModel>?> getPosts() async {
    var client = http.Client();
    var response = await client.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
     List<PostModel> list=[];
    if(response.statusCode==200)
      {
        print("in repo ${response.body}");
        var map=json.decode(response.body);
        //var map=Map.from(map);

        var tlist=List.from(map);
        tlist.forEach((element) {
          list.add(PostModel.fromJson(element));
        });
        return list;
      }else
        {
          return null;
        }
    return list;
  }



}