import 'dart:math';
import 'package:bmi_app/Widgets/My_Fab.dart';
import 'package:bmi_app/Widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'ResultPage.dart';

class InputPage extends StatefulWidget {
  const InputPage({
    super.key,
    text1,
    color,
    result,
    bmiRange,
    desc,
  });

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = Colors.grey;
  Color femaleColor = Colors.grey;
  bool Selected = true;
  double height = 150;
  double weight = 60;
  int age = 20;

  void restart() {
    setState(() {
      weight = 60;
      height = 150;
      maleColor = Colors.grey;
      femaleColor = Colors.grey;
      Selected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: MyCard(
                  color: maleColor,
                  onTap: () {
                    if (Selected) {
                      setState(() {
                        maleColor = Colors.grey[700]!;
                        Selected = false;
                      });
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.male,
                        size: 60,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Male")
                    ],
                  ),
                )),
                Expanded(
                    child: MyCard(
                  color: femaleColor,
                  onTap: () {
                    if (Selected) {
                      setState(() {
                        femaleColor = Colors.grey[700]!;
                        Selected = false;
                      });
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.female,
                        size: 60,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Female")
                    ],
                  ),
                )),
              ],
            ),
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "${height.round()}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 54),
                          ),
                          Text(
                            "cm",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      Slider(
                          value: height,
                          max: 200,
                          min: 80,
                          divisions: 200,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          }),
                    ],
                  )),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT"),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "$weight",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MyFab(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: Icons.add),
                            MyFab(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: Icons.minimize)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age"),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "$age",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MyFab(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: Icons.add),
                            MyFab(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: Icons.minimize)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                double result = weight / pow(height / 100, 2);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      a: result.round(),
                    ),
                  ),
                );
                restart();
              },
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    "Calculate",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
