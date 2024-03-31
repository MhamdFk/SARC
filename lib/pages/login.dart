// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print
// ignore: prefer_const_literals_to_create_immutables
// ignore: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modern/components/My_TextField.dart';
import 'package:modern/components/my_button.dart';
import 'package:modern/components/square_tile.dart';
import 'package:modern/rest/rest_api.dart';

class login extends StatelessWidget {
  login({super.key});

// text editing controllers
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

//sign user in method
  void doLogin(String email, String password) async {
    var res = await userLogin(email.trim(), password.trim());
    print(res.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),

                  //logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/sarc.png',
                        height: 250,
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  //welcomeback , you've been missed out!
                  Text(
                    'welcome back you\'ve been missed!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //username text field
                  MyTextField(
                    controller: usernamecontroller,
                    hintText: 'username',
                    obscureText: false,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //password text field
                  MyTextField(
                    controller: passwordcontroller,
                    hintText: 'password',
                    obscureText: true,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //forgot password ?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'forget password?',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  //sign in button
                  MyButton(
                    ontap: () {
                      if (usernamecontroller.text.isNotEmpty &&
                          passwordcontroller.text.isNotEmpty) {
                          doLogin(
                            usernamecontroller.text, passwordcontroller.text);
                        
                        Navigator.pushNamed(context, '/MyCheckBox');
                      } else{
                        Fluttertoast.showToast(
                            msg: 'All fields are required ',
                            textColor: Colors.red);
                      }
                    },
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  //or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 5,
                            color: Colors.red[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'or continue with',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 5,
                            color: Colors.red[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //email , number  sign in buttons
                  const SizedBox(
                    height: 10,
                    width: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SquareTile(imagepath: 'images/sarc.png'),
                      SizedBox(
                        width: 15,
                        height: 10,
                      ),
                      SquareTile(imagepath: 'images/google.png')
                    ],
                  ),
                  //not a member register now
                  const SizedBox(
                    height: 50,
                  ),
                  //not a member register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'not a member?',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        width: 58,
                      ),
                      Text("Don't have an account? ",
                          style: TextStyle(fontSize: 14, color: Colors.black)),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/SignUp');
                        },
                        child: Text(" Sign Up",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF004ACB))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
