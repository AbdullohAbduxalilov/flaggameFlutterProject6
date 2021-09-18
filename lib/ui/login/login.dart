import 'package:flutter/material.dart';
import 'package:oyintopoyini/ui/home/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();

  Color? _color;

  TextEditingController _usernameController = TextEditingController();

  List<DropdownMenuItem<Color>> _listOfDropdownc = [
    DropdownMenuItem(
      child: Row(
        children: [
          Icon(Icons.circle, color: Colors.amber.shade900),
          SizedBox(
            width: 20.0,
          ),
          Text("amber"),
        ],
      ),
      value: Colors.amber.shade900,
    ),
    DropdownMenuItem(
      child: Row(
        children: [
          Icon(Icons.circle, color: Colors.indigo.shade900),
          SizedBox(
            width: 20.0,
          ),
          Text("indigo"),
        ],
      ),
      value: Colors.indigo.shade900,
    ),
    DropdownMenuItem(
      child: Row(
        children: [
          Icon(Icons.circle, color: Colors.green.shade900),
          SizedBox(
            width: 20.0,
          ),
          Text("green"),
        ],
      ),
      value: Colors.green.shade900,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            "Flag game",
            style: TextStyle(
              color: Colors.indigo,
              fontSize: 24.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: _formListElementlar(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _formListElementlar() {
    return [
      CircleAvatar(
        radius: 140.0,
        backgroundImage: NetworkImage(
            "https://is3-ssl.mzstatic.com/image/thumb/Purple3/v4/95/73/dc/9573dc59-73e7-61e3-0f18-b13b71c22188/pr_source.png/1200x630wa.png"),
      ),
      SizedBox(
        height: 50.0,
      ),
      TextFormField(
        controller: _usernameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Username Shu Yerda kiriting...",
          labelText: "Username",
        ),
        validator: (String? v) {
          if (v!.length < 4) {
            return "Username Kam Kirtildi !!!";
          }
        },
      ),
      SizedBox(height: 30.0),
      DropdownButtonHideUnderline(
        child: DropdownButton<Color>(
          value: _color,
          hint: Text("Rang Tanlang"),
          items: _listOfDropdownc,
          onChanged: (v) {
            setState(() {
              _color = v;
            });
          },
        ),
      ),
      SizedBox(height: 30.0),
      ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.play_arrow),
            Text("Start Game"),
          ],
        ),
        onPressed: () {
          if (_formKey.currentState!.validate() && _color != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                  color: _color,
                  username: _usernameController.text,
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Hamma Fieldni Tekshiring Iltimos !",
                ),
              ),
            );
          }
        },
      ),
    ];
  }
}
