import 'package:flutter/material.dart';
import 'package:food_court/constants.dart';
import 'package:food_court/signInPage.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: ClipRect(
                    child: Icon(
                      Icons.person_rounded,
                      color: Colors.black,
                      size: 200,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Phone Number: ${userNumber}',
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Your Password: ${userPassword}'
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width - 200,
                  child: ElevatedButton(
                    child: Text('LOGOUT', style: TextStyle(color: Color.fromRGBO(210, 29, 94, 1)),),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                    },
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
