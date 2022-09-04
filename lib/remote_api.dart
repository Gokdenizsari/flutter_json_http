import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animasyon/model/todos,-model.dart';

class RemoteApi extends StatefulWidget {
  RemoteApi({Key? key}) : super(key: key);

  @override
  State<RemoteApi> createState() => _RemoteApiState();
}

class _RemoteApiState extends State<RemoteApi> {
  Future<List<TodosModel>> _getTodosList() async {
    try {
      var response =
          await Dio().get("https://jsonplaceholder.typicode.com/todos");

      if (response.statusCode == 200) {
        response.data;
      }
      return [];
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote Api with Dio"),
      ),
      body: Center(),
    );
  }
}
