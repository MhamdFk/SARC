import 'package:flutter/material.dart';
import 'package:modern/components/my_custome_scaffold.dart';
import 'package:modern/components/my_welcome_buttons.dart';
import 'package:modern/pages/login.dart';
import 'package:modern/pages/signup.dart';
class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Customewelcome(
      
      child: Column(
        textBaseline: TextBaseline.alphabetic,
        children: [
          Flexible(
            flex: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0
                ),
                  child: Center(
                child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                      TextSpan(
                          text: 'أهلا بك في تطبيق الهلال الأحمر العربي السوري\n',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                          )),
                          TextSpan(
                            text:
                             '',
                            style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            )
                          )
                        ],
                      ),
                    ),
              ))),
               Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    children: [
                      Expanded(child: Welcomebutton(
                        buttontext: 'Sign in',
                        onTap: login(),
                        color: Colors.transparent,
                        textcolor: Colors.white,
                      )),
                      const Expanded(child: Welcomebutton(
                        buttontext: 'Sign up',
                        onTap: SignUp(),
                        color: Colors.white,
                        textcolor: Colors.red,
                      ))
                  ]),
                ),
              )
        ],
      ),
    );
  }
}
