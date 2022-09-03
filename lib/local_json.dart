import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animasyon/model/country_model.dart';

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
      body: FutureBuilder<List<Country>>(
        future: countryJysonRead(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Country> countryList = snapshot.data!;

            return ListView.builder(
              itemCount: countryList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(countryList[index].countryName),
                  subtitle: Text(countryList[index].countryCapital),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center();
        }),
      ),
    );
  }

  Future<List<Country>> countryJysonRead() async {
    /*var */
    String readString = await DefaultAssetBundle.of(context)
        .loadString("assets/daya/country.jyson");
    var jsonObject = jsonDecode(readString);
    /* debugPrint(readString);
   
    // (jsonObject as List).map((e) => debugPrint(e.toString()));
    
    //debugPrint(jsonObject.toString());
    
    List countryList = jsonObject;
   
    debugPrint(countryList[0]["President"][0].toString());*/

    List<Country> allcountry = (jsonObject as List)
        .map((countryMap) => Country.fromMap(countryMap))
        .toList();

    //debugPrint(allcountry[0].president);

    debugPrint(allcountry.length.toString());

    return allcountry;
  }
}
