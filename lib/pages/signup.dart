import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _textControllername = TextEditingController();
  TextEditingController _textControlleremail = TextEditingController();
  TextEditingController _textControllerpassword = TextEditingController();
  TextEditingController _textControllerage = TextEditingController();
  TextEditingController _textControllernumber = TextEditingController();
  bool isSwitched = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final passwordValidator = MultiValidator([
    MinLengthValidator(8, errorText: 'Password must be at least 8 characters'),
    PatternValidator(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
        errorText: 'Password must contain both letters and numbers')
  ]);

  final _formKey = GlobalKey<FormState>();
  final emailValidator =
      EmailValidator(errorText: 'enter a valid email adress');
  void sendMessegename(String messege) {
    print(messege);
    _textControllername.clear();
  }

  void sendMessegeemail(String messege) {
    print(messege);
    _textControlleremail.clear();
  }

  void sendMessegepassword(String messege) {
    print(messege);
    _textControllerpassword.clear();
  }

  void sendMessegeage(String messege) {
    print(messege);
    _textControllerage.clear();
  }

  void sendMessegenumber(String messege) {
    print(messege);
    _textControllernumber.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        toolbarHeight: 115,
        title: ClipOval(
          child: Container(
            color: Colors.white,
            child: SizedBox(
              child: Image.asset(
                'images/sarc.png',
                height: 100,
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Getting Started",
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Create an account to continue!",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text('  *' , style: TextStyle(color: Colors.red , fontSize: 20),),
                      SizedBox(
                        height: 33,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: TextFormField(
                    controller: _textControllername,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter your name",
                        prefixIcon: const Icon(Icons.account_circle_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text('  *' , style: TextStyle(color: Colors.red , fontSize: 20),),
                      SizedBox(
                        height: 33,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: TextFormField(
                      controller: _textControlleremail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Example@email.com",
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      validator: emailValidator),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text('  *' , style: TextStyle(color: Colors.red , fontSize: 20),),
                      SizedBox(
                        height: 33,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: TextFormField(
                    controller: _textControllerpassword,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter your passowrd",
                        prefixIcon: const Icon(Icons.lock_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: passwordValidator,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Age",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text('  *' , style: TextStyle(color: Colors.red , fontSize: 20),),
                      SizedBox(
                        height: 33,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: TextFormField(
                    controller: _textControllerage,
                    keyboardType: TextInputType.emailAddress,
                    readOnly: true,
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        DateTime selectedDate = picked;
                        _textControllerage.text = selectedDate
                            .toIso8601String()
                            .split('T')[0]; // عرض التاريخ المحدد بدون وقت
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'enter your birthday',
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.calendar_month_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Number",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text('  *' , style: TextStyle(color: Colors.red , fontSize: 20),),
                      SizedBox(
                        height: 33,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: TextFormField(
                    controller: _textControllernumber,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter your phonenumber",
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        }),
                    const Text(
                      "Remember Me",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 15),
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 243, 1, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size(335, 60),
                        ),
                        onPressed: () {
                          if (_textControllername.text.isNotEmpty &&
                              _textControlleremail.text.isNotEmpty &&
                              _textControllerpassword.text.isNotEmpty &&
                              _textControllerage.text.isNotEmpty &&
                              _textControllernumber.text.isNotEmpty &&
                              _formKey.currentState!.validate()) {
                            sendMessegename(_textControllername.text);
                            sendMessegeemail(_textControlleremail.text);
                            sendMessegepassword(_textControllerpassword.text);
                            sendMessegeage(_textControllerage.text);
                            sendMessegenumber(_textControllernumber.text);
                            Navigator.pushNamed(context, '/MyCheckBox');
                          } else {
                            Fluttertoast.showToast(
                                msg: 'All fields are required ',
                                textColor: Colors.red);
                          }
                          // Navigator.pushNamed(context, '/MyCheckBox');
                        },
                        child: const Row(
                          children: [
                            Text(
                              "Create Account",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22, left: 70),
                  child: Row(
                    children: [
                      Text("Already have an account? ",
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[500])),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(" Sign In",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF004ACB))),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 30.0, top: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15.0, left: 15.0),
                        child: Text(
                          "Or Continue With",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/AppleOrGoggle');
                          },
                          child: Container(
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.grey)),
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "images/google.png",
                                      height: 27,
                                      width: 27,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "Google",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/AppleOrGoggle');
                        },
                        child: Container(
                            width: 130,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.apple,
                                    size: 30,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Apple",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: const Drawer(
          // child: ListView(
          //   children: [
          //     ListTile(
          //       title: Text('عنصر القائمة 1'),
          //       // يمكنك هنا تعريف التصرف الذي يحدث عند النقر على عنصر القائمة
          //     ),
          //     ListTile(
          //       title: Text('عنصر القائمة 2'),
          //       // يمكنك هنا تعريف التصرف الذي يحدث عند النقر على عنصر القائمة
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
