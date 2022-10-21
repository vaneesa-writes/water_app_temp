import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../utilities/sliderObjects.dart';

final _auth = FirebaseAuth.instance;

class AfterLogin extends StatefulWidget {
  const AfterLogin({Key? key}) : super(key: key);

  @override
  State<AfterLogin> createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: SleekCircularSlider(
                  min: sliderList[currIndex].sliderMinValue,
                  max: sliderList[currIndex].sliderMaxValue,
                  appearance: CircularSliderAppearance(
                      size: 200,
                      customWidths: CustomSliderWidths(
                        trackWidth: 5,
                        progressBarWidth: 9,
                      )),
                  initialValue: sliderList[currIndex].sliderInitialValue,
                  onChangeEnd: (double endValue) {
                    sliderList[currIndex].value = endValue;
                  },
                  innerWidget: (double value) {
                    // use your custom widget inside the slider (gets a slider value from the callback)
                    return Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          value.toStringAsFixed(2),
                          style: TextStyle(fontSize: 30.0),
                        ),
                      ],
                    ));
                  },
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: currIndex != 0,
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        IconData(0xee84,
                            fontFamily: 'MaterialIcons',
                            matchTextDirection: true),
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          if (currIndex > 0) currIndex--;
                        });
                      },
                    ),
                    Text('   Prev  '),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  sliderList[currIndex].diaplyText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    fontSize: 30.0,
                    color: Colors.black87,
                  ),
                ),
              ),
              Column(
                children: [
                  Visibility(
                    visible: true,
                    child: IconButton(
                        icon: const Icon(
                          IconData(0xee8c,
                              fontFamily: 'MaterialIcons',
                              matchTextDirection: true),
                          size: 30,
                        ),
                        onPressed: () {
                          if (currIndex == 8) {
                            Navigator.pushNamed(context, 'review_inputs');
                          } else {
                            setState(() {
                              currIndex++;
                            });
                          }
                        }),
                  ),
                  Text('   Next  '),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
