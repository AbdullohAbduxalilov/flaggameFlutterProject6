import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:oyintopoyini/models/questions.dart';

class HomePage extends StatefulWidget {
  Color? color;
  String? username;

  HomePage({this.color, this.username});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  int togri = 0;
  int notogri = 0;
  int randomSavol = Random().nextInt(5);
  int? randomSavol2;

  @override
  Widget build(BuildContext context) {
    print(randomSavol);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          alignment: Alignment.center,
          height: 20.0,
          child: CircleAvatar(
            backgroundColor: widget.color,
            child: Icon(Icons.question_answer_sharp, color: Colors.white),
          ),
        ),
        title: Text(
          "Username: ${widget.username}",
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
        backgroundColor: Colors.indigoAccent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10.0),
            Text(
              "Find the Country of this flag",
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Container(
              height: 150.0,
              width: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    "${Questions.questions[randomSavol].toString()}",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              height: 400.0,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemBuilder: (context, i) {
                  randomSavol2 = randomSavol;
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: widget.color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    child: Text(
                      Questions.answers[randomSavol][i],
                      style: TextStyle(fontSize: 24.0),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () async {
                      print("Bosilgan: $i");
                      if (i == Questions.answers[randomSavol][4]) {
                        togri += 1;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 250.0,
                              width: 300.0,
                              child: AlertDialog(
                                title: Column(
                                  children: [
                                    Icon(Icons.check),
                                    SizedBox(height: 40.0),
                                    Text(
                                      "Tabriklaymiz Togri Javob !!",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 24.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                        if (index < 4) {
                          await Future.delayed(Duration(milliseconds: 500))
                              .then((value) => Navigator.pop(context));
                        } else {
                          await Future.delayed(Duration(seconds: 1))
                              .then((value) => Navigator.pop(context));
                        }
                        randomSavol = Random().nextInt(5);
                        randomSavol == randomSavol2
                            ? randomSavol = Random().nextInt(5)
                            : randomSavol;
                        setState(() {});
                      } else {
                        notogri += 1;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 250.0,
                              width: 300.0,
                              child: AlertDialog(
                                title: Column(
                                  children: [
                                    Icon(Icons.sms_failed),
                                    SizedBox(height: 40.0),
                                    Text(
                                      "Afsuski Notogri Javob !!",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 24.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                        if (index < 4) {
                          await Future.delayed(Duration(milliseconds: 500))
                              .then((value) => Navigator.pop(context));
                        } else {
                          await Future.delayed(Duration(seconds: 1))
                              .then((value) => Navigator.pop(context));
                        }
                        randomSavol = Random().nextInt(5);
                        randomSavol == randomSavol2
                            ? randomSavol = Random().nextInt(5)
                            : randomSavol;
                        setState(() {});
                      }
                      if (index < 4) {
                        setState(() {
                          index += 1;
                        });
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            randomSavol = Random().nextInt(5);
                            return AlertDialog(
                              title: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Togri: $togri. ",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 24.0,
                                        ),
                                      ),
                                      Text(
                                        "Notogri: $notogri",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 24.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    child: Text("Replay"),
                                    onPressed: () {
                                      setState(() {
                                        togri = 0;
                                        notogri = 0;
                                      });
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              ),
                            );
                          },
                        );
                        index = 0;
                        randomSavol = Random().nextInt(5);
                        setState(() {});
                      }
                    },
                  );
                },
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
