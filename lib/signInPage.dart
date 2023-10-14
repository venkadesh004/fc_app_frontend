import 'package:flutter/material.dart';
import 'package:food_court/dashboard.dart';
import 'package:http/http.dart' as http;
import 'signUpPage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _phoneControllers = new TextEditingController();
  TextEditingController _passwordControllers = new TextEditingController();

  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
  }

  Future<void> getData() async {
    print(_phoneControllers.text);
    print(_passwordControllers.text);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset('assets/images/signin-page-top.png'),
              ),
              Transform.translate(
                offset: const Offset(0, -60),
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Color.fromRGBO(66, 153, 216, 1),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 230,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: Text('Phone Number:')),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '+91 xxxxx xxxxx'),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: Text('Password: ')),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '*****',
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _passwordVisible= !_passwordVisible;
                                        });
                                      },
                                      icon: Icon(
                                        _passwordVisible ?
                                            Icons.visibility : Icons.visibility_off
                                      ),
                                    )),
                                obscureText: !_passwordVisible,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              print(_phoneControllers.text);
                              print(_passwordControllers.text);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage()));
                            },
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Color.fromRGBO(210, 29, 94, 1)),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                          ))
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do you have an account? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color.fromRGBO(66,153,216, 1),
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromRGBO(66,153,216, 1)
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
