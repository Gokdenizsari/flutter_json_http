import 'dart:convert';

import 'package:flutter/material.dart';

class LocalJson extends StatefulWidget {
  const LocalJson({Key? key}) : super(key: key);

  @override
  State<LocalJson> createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Jyson")),
      body: Center(),
    );
  }

  countryJysonRead() async {
    /*var */ String readString = await DefaultAssetBundle.of(context)
        .loadString("assets/daya/country.jyson");
    var jsonObject = jsonDecode(readString);
    debugPrint(readString);
    // (jsonObject as List).map((e) => debugPrint(e.toString()));
    //debugPrint(jsonObject.toString());
    List countryList = jsonObject;
    debugPrint(countryList[0]["President"][0].toString());
  }
}