import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animasyon/model/todos_model.dart';

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
      List<TodosModel> _todosList = [];
      if (response.statusCode == 200) {
        var _todosList =
            (response.data as List).map((e) => TodosModel.fromMap(e)).toList();
      }
      return _todosList;
    } on DioError catch (e) {
      debugPrint(e.toString());
      return Future.error(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote Api with Dio"),
      ),
      body: Center(
        child: FutureBuilder<List<TodosModel>>(
          future: _getTodosList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.toString());
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else
              return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
