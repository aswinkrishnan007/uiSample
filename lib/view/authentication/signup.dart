import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/utils/constants.dart';
import 'package:sample/view/authentication/login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {

  //textcontrollers
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  
  //checking errors
  bool _passwordVisible = false;
  bool _cnfrmPassword = false;
  bool namevalidate = false;
  bool emailvalidate = false;
  bool passwordvalidate = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 100),
            createAccount(),
            textField(
                name, "name", namevalidate ? 'name field is required' : null),
            textField(email, "email",
                emailvalidate ? 'email field is required' : null),
            passwordTextField("password", password, true),
            const SizedBox(height: 20),
            passwordTextField("Confirm Password", confirmPassword, false),
            const SizedBox(height: 20),
            signUpButton(context),
            const SizedBox(height: 20),
            dividerLine(context),
            const SizedBox(height: 20),
            logInButton(context),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Padding createAccount() {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: SizedBox(
        child: Text(
          "Create Account",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 30,
              color: Colorconstants.color1A059D),
          textScaleFactor: 1,
        ),
      ),
    );
  }

  Container textField(
      TextEditingController controller, String? labelText, String? errorText) {
    return Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person_outlined),
            labelText: labelText,
            errorText: errorText,
          ),
        ));
  }

  Container passwordTextField(
      String label, TextEditingController? controller, bool password) {
    return Container(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: TextField(
          controller: controller,
          obscureText: password ? !_passwordVisible : !_cnfrmPassword,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.linear_scale_rounded,),
              labelText: label,
              errorText: passwordvalidate ? 'please check the password' : null,
              suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    (password ? _passwordVisible : _cnfrmPassword)
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colorconstants.color1A059D,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      password
                          ? _passwordVisible = !_passwordVisible
                          : _cnfrmPassword = !_cnfrmPassword;
                    });
                  }))),
    );
  }

  Padding fogotPassword(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Text(
          "Forgot password ?",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 16,
              color: Colorconstants.color0075FF),
          textAlign: TextAlign.end,
          textScaleFactor: 1,
        ),
      ),
    );
  }

  Container signUpButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 35, right: 35),
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: () async {
          setState(() {
            namevalidate = false;
            emailvalidate = false;
            passwordvalidate = false;
          });

          if (name.text.isEmpty) {
            setState(() {
              namevalidate = true;
            });
          } else if (email.text.isEmpty) {
            setState(() {
              emailvalidate = true;
            });
          } else if ((password.text == confirmPassword.text) &&
              password.text.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          } else {
            setState(() {
              passwordvalidate = true;
            });
          }
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colorconstants.color1A059D)),
        child: Text(
          "Sign Up",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            fontStyle: FontStyle.normal,
          ),
          textScaleFactor: 1,
        ),
      ),
    );
  }

  Container dividerLine(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: Row(
        children: [
          Container(
              width: MediaQuery.of(context).size.width / 2 - 60,
              height: 1,
              color: Colorconstants.color817F7F),
          SizedBox(
              width: 40,
              child: Center(
                  child: Text(
                "or",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Colorconstants.color817F7F),
                textAlign: TextAlign.end,
                textScaleFactor: 1,
              ))),
          Container(
              width: MediaQuery.of(context).size.width / 2 - 60,
              height: 1,
              color: Colorconstants.color817F7F),
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
            MaterialPageRoute(builder: (context) => const LoginScreen()),
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
            color: Colorconstants.colorBAD8FF,
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
