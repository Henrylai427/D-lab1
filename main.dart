import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _value = null;
  List<String> _values = new List<String>();
  final TextEditingController _acontroller = TextEditingController();
  final TextEditingController _bcontroller = TextEditingController();
  final TextEditingController _ccontroller = TextEditingController();
  final TextEditingController _dcontroller = TextEditingController();
  double a = 0.0, b = 0.0, c = 0.0, d = 0.0, e = 0.0, f = 0.0, result = 0.0;

  void initState() {
    _values.addAll(["+", "-", "*", "/"]);
    _value = _values.elementAt(0);
  }

  @override
  Widget build(BuildContext context) {
    var padding = Padding;
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fraction Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 40, 80, 0),
                    child: TextField(
                       decoration: InputDecoration(
                       hintText: "Numerator 1",
                       contentPadding: EdgeInsets.all(10),
                       border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),    
                       ),        
                       keyboardType: TextInputType.numberWithOptions(),         
                      controller: _acontroller,
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(70, 40, 30, 0),

                    child: TextField(
                      decoration: InputDecoration(
                       hintText: "Numerator 2",
                       contentPadding: EdgeInsets.all(10),
                       border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                       ),
                       keyboardType: TextInputType.numberWithOptions(), 
                      controller: _ccontroller,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text('_______________'),
                ),
                Padding(
                  padding: EdgeInsets.zero,
                  child: Text("Operator:"),
                ),
                Padding(
                    padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Padding(
                      padding: new EdgeInsets.all(5),
                      child: new DropdownButton(
                        value: _value,
                        items: _values.map((String value) {
                          return new DropdownMenuItem(
                            value: value,
                            child: new Row(
                              children: <Widget>[
                                new Text('$value'),
                                
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (String value) {
                          _onChanged(value);
                        },
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                  child: Text('________________'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 80, 0),
                    child: TextField(
                      decoration: InputDecoration(
                       hintText: "Denominator 1",
                       contentPadding: EdgeInsets.all(10),
                       border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                       ),
                       keyboardType: TextInputType.numberWithOptions(), 
                      controller: _bcontroller,
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(70, 10, 30, 0),
                    child: TextField(
                      decoration: InputDecoration(
                       hintText: "Denominator 2",
                       contentPadding: EdgeInsets.all(10),
                       border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                       ),
                       keyboardType: TextInputType.numberWithOptions(), 
                      controller: _dcontroller,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                  child: new MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),),),
                        color: Colors.redAccent, 
                        child: Text("Calculate", 
                    ),
                    onPressed: _onPress,
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 50, 20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      color: Colors.yellowAccent,
                    child: Text("Reset",  
                      ),
                    
                    onPressed: _reset,
                  ),
                 ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Text(
                    "Result:",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Text(
                    "$e",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Text(
                    "______________",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: Text(
                    "$f",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onPress() {
    setState(() {
      a = double.parse(_acontroller.text);
      b = double.parse(_bcontroller.text);
      c = double.parse(_ccontroller.text);
      d = double.parse(_dcontroller.text);
      if (_value == '+') {
        if (b==d) {
          e= a + c;
          f= b;
        } else {
          a= a * d;
          c= c * b;
          b= b * d;
          e= a + c;
          f= b;
        }
      }
      else if (_value == '-'){
        if (b==d) {
          e= a - c;
          f= b;
        } else {
          a= a * d;
          c= c * b;
          b= b * d;
          e= a - c;
          f= b;
        }
      }
      else if (_value == '*'){
        e = a * c;
        f = b * d;
      }
      else if (_value == '/'){
        e = a * d;
        f = b * c;
      }
      simplestform();
    });
  }

  double gcd(double a, double b) {
    if (a == 0) {
      return b;
    } else {
      return gcd(b % a, a);
    }
  }

  void simplestform() {
    double commonFactor = gcd(e, f);
    e = e / commonFactor;
    f = f / commonFactor;
  }

  void _onChanged(String value) {
    setState(() {
      _value = value;
    });
  }
   void _reset(){
    setState(() {
      _acontroller.text = "";
      _bcontroller.text = "";
      _ccontroller.text = "";
      _dcontroller.text = "";
      e = 0.0;
      f = 0.0;
    });
}
}