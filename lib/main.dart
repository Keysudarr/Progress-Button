import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  int _state = 0;
  Animation _animation;
  AnimationController _controller;
  GlobalKey _globalKey = GlobalKey();
  double _width = double.maxFinite;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login to app",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )
                ],
              ),
              Container(
                alignment: Alignment.center,
                margin:
                    EdgeInsets.only(top: 50, bottom: 40, left: 20, right: 20),
                color: Colors.white,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: "Username",
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.deepPurpleAccent,
                      )),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20),
                color: Colors.white,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.deepPurpleAccent,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          print("Show passwrod");
                        },
                        icon: Icon(Icons.visibility, color: Colors.blue),
                      )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  print("LOGİN");
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 12),
                  child: Container(
                    key: _globalKey,
                    height: 48,
                    width: _width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blueGrey, Colors.lightBlueAccent],
                          end: Alignment.centerLeft,
                          begin: Alignment.centerRight),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: RaisedButton(
                        animationDuration: Duration(milliseconds: 1000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: setUpButtonChild(),
                        onPressed: () {
                          setState(() {
                            if (_state == 0) {
                              animateButton();
                            }
                          });
                        },
                        color: Colors.transparent),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () {
                        print("Sing Up");
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ))
                ],
              ),
              TextButton(
                  onPressed: () {
                    print("Forgot Password");
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
              InkWell(
                onTap: () {
                  print("Sign in with Google");
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 12),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFFFF8C3B), Color(0xFFFF6365)],
                            end: Alignment.centerLeft,
                            begin: Alignment.centerRight),
                        image: DecorationImage(
                            alignment: Alignment.centerLeft,
                            image: AssetImage("assets/google.jpg")),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    alignment: Alignment.center,
                    child: Text(
                      "Sign in with Google",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print("Sign in with Facebook");
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 12),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.indigo, Colors.lightBlueAccent],
                            end: Alignment.centerLeft,
                            begin: Alignment.centerRight),
                        image: DecorationImage(
                            alignment: Alignment.centerLeft,
                            image: AssetImage("assets/facebook.jpg")),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    alignment: Alignment.center,
                    child: Text(
                      "Sign in with Facebook",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print("Sign in with Apple");
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 12),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black, Colors.blueGrey],
                            end: Alignment.centerLeft,
                            begin: Alignment.centerRight),
                        image: DecorationImage(
                            alignment: Alignment.centerLeft,
                            image: AssetImage("assets/apple.png")),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    alignment: Alignment.center,
                    child: Text(
                      "Sign in with Apple",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  setUpButtonChild() {
    if (_state == 0) {
      return Text(
        "LOGİN",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20,
        ),
      );
    } else if (_state == 1) {
      return SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          value: null,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Text(
        "Login Successful",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20,
        ),
      );
    }
  }

  void animateButton() {
    double initialWidth = _globalKey.currentContext.size.width;

    _controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    _animation = Tween(begin: 0.0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {
          _width = initialWidth - ((initialWidth - _width) * _animation.value);
        });
      });
    _controller.forward();

    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 2;
      });
    });
  }
}
