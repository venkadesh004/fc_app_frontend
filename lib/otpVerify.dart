import 'package:flutter/material.dart';
import 'package:food_court/dashboard.dart';

class OtpVerify extends StatefulWidget {
  const OtpVerify({super.key});

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  TextEditingController _controller = new TextEditingController();

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
                    margin: EdgeInsets.only(top: 50),
                    child: Text('Enter the OTP Send to your number', style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    ),)
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width * 0.5,
                    child: TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        fillColor: Color.fromRGBO(0, 0, 0, 0.2)
                      ),
                      keyboardType: TextInputType.number,
                    ),
                ),
                Container(
                  width: 200,
                  height: 50,
                  margin: EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      print(_controller.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage()));
                    },
                    child: Container(
                      child: Text("Verify!"),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(210, 29, 94, 1)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
