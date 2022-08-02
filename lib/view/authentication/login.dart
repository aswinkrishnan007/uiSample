import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/utils/constants.dart';
import 'package:sample/view/homescreen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50,),
          logInButton(context),
        ],
      ),
    );
    
  }
  
  Container logInButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 35, right: 35),
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            side: BorderSide(
                color: Colorconstants.color0075FF,
                width: 2,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(20),
          )),
        ),
        child: Text(
          "Log in",
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            fontStyle: FontStyle.normal,
          ),
          textScaleFactor: 1,
        ),
      ),
    );
  }
}