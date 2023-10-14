import 'package:flutter/material.dart';
import 'package:food_court/dashboard.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({super.key});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                child: ClipRect(child: Image.asset('assets/images/success-gif.gif')),
              ),
              Container(
                child: Text(
                  "Your Payment was Successfull!",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text("Your Order is 12345", style: TextStyle(
                  fontSize: 16
                ),),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: Text("Done", style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(210, 29, 94, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
