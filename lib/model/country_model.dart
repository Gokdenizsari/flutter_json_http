// To parse this JSON data, do
//
//     final country = countryFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Country countryFromMap(String str) => Country.fromMap(json.decode(str));

String countryToMap(Country data) => json.encode(data.toMap());

class Country {
    Country({
        required this.countryName,
        required this.countryCapital,
        required this.yearOfFoundation,
        required this.president,
    });

    final String countryName;
    final String countryCapital;
    final int yearOfFoundation;
    final String president;

    factory Country.fromMap(Map<String, dynamic> json) => Country(
        countryName: json["Country_Name"],
        countryCapital: json["Country_Capital"],
        yearOfFoundation: json["Year_of_Foundation"],
        president: json["President"],
    );

    Map<String, dynamic> toMap() => {
        "Country_Name": countryName,
        "Country_Capital": countryCapital,
        "Year_of_Foundation": yearOfFoundation,
        "President": president,
    };
}
