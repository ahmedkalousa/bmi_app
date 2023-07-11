import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  late String text1;
  late Color color;
  late String bmiRange;
  late String desc;
  final int a;

  ResultPage({super.key, required this.a});
  @override
  Widget build(BuildContext context) {
    if (a > 18.5 && a < 25) {
      text1 = "Normal";
      color = Colors.green;
      bmiRange = "18.5 - 25 kg/m2";
      desc = "You have a normal body weight. Good job!";
    } else if (a < 18.5) {
      text1 = "Underweight";
      color = Colors.red;
      bmiRange = "15 - 18.5 kg/m2";
      desc = "You are underweight. Try to take better care of yourself!";
    } else if (a > 25) {
      text1 = "Overweight";
      color = Colors.red;
      bmiRange = "25 - 40 kg/m2";
      desc = "You are overweight. Try to take better care of yourself!";
    }
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.list,
          size: 40,
        ),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Text(
            "Your Result",
            style: TextStyle(fontSize: 48),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(36),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$text1",
                      style: TextStyle(fontSize: 30, color: color),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "$a",
                      style: TextStyle(
                        fontSize: 78,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Text(
                      "Normal BMI range:",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "$bmiRange",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "$desc",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 42,
                    ),
                    Container(
                      color: const Color.fromARGB(255, 52, 51, 51),
                      child: Text(
                        "SAVE RESULT",
                        style: TextStyle(fontSize: 20),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 56, vertical: 24),
                    )
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  "RE-CALCULATE YOUR BMI",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
