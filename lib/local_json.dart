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
  countryJysonRead() {
    DefaultAssetBundle.of(context).loadString("assets/daya/country.jyson");
  }
}
