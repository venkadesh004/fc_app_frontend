import 'package:flutter/material.dart';
import 'package:food_court/signInPage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration:
              const BoxDecoration(color: Color.fromRGBO(210, 29, 94, 1)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(top: 150),
                    child: Image.asset('assets/images/screen-1-icon.png')),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset('assets/images/screen-1-logo.png')),
                Container(
                  width: 200,
                  height: 50,
                  margin: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage()));
                    },
                    child: Container(
                      child: Text("Get Started!"),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(210, 29, 94, 1)),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height - 630),
                    child: Image.asset('assets/images/screen-1-burger.png'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
