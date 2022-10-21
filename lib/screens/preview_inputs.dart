import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/reusablecomponents.dart';
import '../utilities/sliderObjects.dart';

final _auth = FirebaseAuth.instance;

class PreviewInputs extends StatelessWidget {
  const PreviewInputs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Can I Drink',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25.0),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF6D86A6),
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
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/preview.jpg'), fit: BoxFit.cover)),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  ReusableContainer(
                      displayText: sliderList[0].diaplyText,
                      value: sliderList[0].value),
                  ReusableContainer(
                      displayText: sliderList[1].diaplyText,
                      value: sliderList[1].value),
                  ReusableContainer(
                      displayText: sliderList[2].diaplyText,
                      value: sliderList[2].value),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  ReusableContainer(
                      displayText: sliderList[3].diaplyText,
                      value: sliderList[3].value),
                  ReusableContainer(
                      displayText: sliderList[4].diaplyText,
                      value: sliderList[5].value),
                  ReusableContainer(
                      displayText: sliderList[5].diaplyText,
                      value: sliderList[5].value),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  ReusableContainer(
                      displayText: sliderList[6].diaplyText,
                      value: sliderList[6].value),
                  ReusableContainer(
                      displayText: sliderList[7].diaplyText,
                      value: sliderList[7].value),
                  ReusableContainer(
                      displayText: sliderList[8].diaplyText,
                      value: sliderList[8].value),
                ],
              ),
            ),
            GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: Color(0xFF556573),
                child: Center(
                  child: Text(
                    "Predict",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'predict');
              },
            )
          ],
        ),
      ),
    );
  }
}
