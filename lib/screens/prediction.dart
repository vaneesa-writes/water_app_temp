import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utilities/get_prediction.dart';
import '../utilities/sliderObjects.dart';

class Prediction extends StatefulWidget {
  const Prediction({Key? key}) : super(key: key);

  @override
  State<Prediction> createState() => _PredictionState();
}

final _auth = FirebaseAuth.instance;

class _PredictionState extends State<Prediction> {
  getResult() async {
    final String userID = await askPrediction();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: askPrediction(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (!snapshot.hasData)
            return Container(
              child: SpinKitFadingCircle(
                color: Colors.greenAccent,
                size: 100.0,
              ),
            ); // still loading
          // alternatively use snapshot.connectionState != ConnectionState.done
          final String? result = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Can I Drink',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25.0),
              ),
              centerTitle: true,
              backgroundColor: Colors.indigo,
              //Color(0xff05B068),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.logout_rounded),
                  tooltip: 'Logout',
                  onPressed: () {
                    _auth.signOut();
                    Navigator.pushNamed(context, 'login');
                  },
                ),
              ],
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/predict.jpg'), fit: BoxFit.cover),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'The water in your area is ',
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                    Text(
                      result!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 60,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(30, 3, 3, 30),
                        // width: MediaQuery.of(context).size.width,
                        // height: 60,
                        color: Colors.black87,
                        child: Center(
                          child: Text(
                            "Save",
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onTap: () async {
                        FirebaseFirestore.instance
                            .collection("predictions")
                            .add({
                          "ph": sliderList[0].value,
                          "Hardness": sliderList[1].value,
                          "Solids": sliderList[2].value,
                          "Chloramines": sliderList[3].value,
                          "Sulfate": sliderList[4].value,
                          "Conductivity": sliderList[5].value,
                          "Organic_carbon": sliderList[6].value,
                          "Trihalomethanes": sliderList[7].value,
                          "Turbidity": sliderList[8].value,
                          "Prediction": result.toString()
                        }).then((value) {
                          Navigator.pushNamed(context, 'home_screen');
                        }).catchError((error) =>
                                print("Failed to add new Node due to $error"));
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
