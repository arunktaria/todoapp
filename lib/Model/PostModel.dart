
import 'dart:convert';
import 'package:http/http.dart' as http;

class PostModel{
   String title;
   String body;

   PostModel(this.title, this.body);

   factory PostModel.fromJson(Map<String, dynamic> jsondata) {
     return PostModel(jsondata["title"],jsondata["body"]);
   }
}