import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:water_quality_app/utilities/sliderObjects.dart';

GetPrediction getPredictionFromJson(String str) =>
    GetPrediction.fromJson(json.decode(str));

String getPredictionToJson(GetPrediction data) => json.encode(data.toJson());

class GetPrediction {
  GetPrediction({
    required this.potability,
    required this.result,
  });

  int potability;
  String result;

  factory GetPrediction.fromJson(Map<String, dynamic> json) => GetPrediction(
        potability: json["potability"],
        result: json["Result"],
      );

  Map<String, dynamic> toJson() => {
        "potability": potability,
        "Result": result,
      };
}

Future<String> askPrediction() async {
  final response = await http.post(
    Uri.parse('https://water-quality-fast-api.herokuapp.com/predict'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, double>{
      "ph": sliderList[0].value,
      "Hardness": sliderList[1].value,
      "Solids": sliderList[2].value,
      "Chloramines": sliderList[3].value,
      "Sulfate": sliderList[4].value,
      "Conductivity": sliderList[5].value,
      "Organic_carbon": sliderList[6].value,
      "Trihalomethanes": sliderList[7].value,
      "Turbidity": sliderList[8].value
    }),
  );

  if (response.statusCode == 200) {
    return GetPrediction.fromJson(jsonDecode(response.body)).result;
  } else {
    log('Request failed with status: ${response.statusCode}.');
    throw Exception('Failed to fetch');
  }
}
