import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CurrencyConverter(),
  ));
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {

  //final _formKey = GlobalKey<FormState>();
  String error, text;
  double conversionResult = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Currency Converter'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/bg_image.jpg'),
                radius: 120,
              ),
            ),
            Divider(
              height: 80,
              color: Colors.grey[600],
              indent: 55,
              endIndent: 55,
            ),
            Form(
              //key: _formKey,
              child: Center(
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    ),
                    textAlign: TextAlign.center,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.white24
                      ),
                      hintText: 'Enter the amount to convert',
                      errorText: error,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10)
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.all(Radius.circular(10)
                        ),
                      ),
                      prefixIcon: Icon(Icons.attach_money,
                      color: Colors.white),
                    ),
                    onChanged: (String value) {
                      text = value;
                    },
                    validator: (value) {
                      if(value.isEmpty) {
                        return 'Please enter the amount in euro!';
                      }
                      return null;
                    },
                  ),
            ),
            ),
            SizedBox(height: 50),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.redAccent),
              ),
              padding: EdgeInsets.fromLTRB(35, 20, 35, 20),
              onPressed: () {
                if(int.parse(text) < 0 || text.isEmpty) {
                  setState(() {
                    error = 'You spent all your salary, huh?';
                  });
                } else {
                  setState(() {
                    error = null;
                    conversionResult = (int.parse(text) * 4.86) as double;
                  });
                }
              },
              child: Text('Convert!',
                style: TextStyle(
                    color: Colors.white,
                  fontSize: 20,
                ),
              ),
              color: Colors.redAccent,
            ),
            SizedBox(height: 50),
            Text('$conversionResult RON',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),)
          ],
        ),
      ),
    );
  }
}

