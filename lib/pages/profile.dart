import 'package:flutter/material.dart';
import 'package:modern/components/navbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;
  bool isEditing1 = false;
  bool isEditing2 = false;
  bool isEditing3 = false;
  bool isEditing4 = false;
  bool isEditing5 = false;
  bool isEditing6 = false;
  bool isEditing7 = false;
  bool isEditing8 = false;
  bool isEditing9 = false;
  bool isEditing10 = false;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  TextEditingController textEditingController5 = TextEditingController();
  TextEditingController textEditingController6 = TextEditingController();
  TextEditingController textEditingController7 = TextEditingController();
  TextEditingController textEditingController8 = TextEditingController();
  TextEditingController textEditingController9 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
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
      body: Form(
  child: SingleChildScrollView(
    child: Column(
      children: [
        const Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "First name",
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
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 200,
                    child: TextFormField(
                      
                      controller: textEditingController,
                      enabled: isEditing,
                      decoration: InputDecoration(border: InputBorder.none,  hintText: 'Name', prefixIcon: const Icon(Icons.perm_identity),),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(isEditing ? Icons.save : Icons.edit),
                  onPressed: () {
                    setState(() {
                      if (isEditing) {
                        // Save button pressed
                        // Perform save operation here
                      }
                      isEditing = !isEditing;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        const Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Last name",
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
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 200,
                    child: TextFormField(
                      controller: textEditingController1,
                      enabled: isEditing1,
                      decoration: InputDecoration(border: InputBorder.none,  hintText: '', prefixIcon: const Icon(Icons.perm_identity),),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(isEditing1 ? Icons.save : Icons.edit),
                  onPressed: () {
                    setState(() {
                      if (isEditing1) {
                        // Save button pressed
                        // Perform save operation here
                      }
                      isEditing1 = !isEditing1;
                    });
                  },
                ),
              ],
            ),
          ),
          
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
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 200,
                    child: TextFormField(
                      controller: textEditingController2,
                      enabled: isEditing2,
                      decoration: InputDecoration(border: InputBorder.none,  hintText: '09....', prefixIcon: const Icon(Icons.phone),),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(isEditing2 ? Icons.save : Icons.edit),
                  onPressed: () {
                    setState(() {
                      if (isEditing2) {
                        // Save button pressed
                        // Perform save operation here
                      }
                      isEditing2 = !isEditing2;
                    });
                  },
                ),
              ],
            ),
          ),
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
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 200,
                    child: TextFormField(
                      controller: textEditingController3,
                      enabled: isEditing3,
                      decoration: InputDecoration(border: InputBorder.none,  hintText: 'Example@hmail.com', prefixIcon: const Icon(Icons.email),),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(isEditing3 ? Icons.save : Icons.edit),
                  onPressed: () {
                    setState(() {
                      if (isEditing3) {
                        // Save button pressed
                        // Perform save operation here
                      }
                      isEditing3 = !isEditing3;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        const Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Middle name",
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
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 200,
                    child: TextFormField(
                      controller: textEditingController4,
                      enabled: isEditing4,
                      decoration: InputDecoration(border: InputBorder.none,  hintText: 'dad name', prefixIcon: const Icon(Icons.perm_identity),),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(isEditing4 ? Icons.save : Icons.edit),
                  onPressed: () {
                    setState(() {
                      if (isEditing4) {
                        // Save button pressed
                        // Perform save operation here
                      }
                      isEditing4 = !isEditing4;
                    });
                  },
                ),
              ],
            ),
          ),
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
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 200,
                    child: TextFormField(
                      controller: textEditingController5,
                      enabled: isEditing5,
                      decoration: InputDecoration(border: InputBorder.none,  hintText: '22', prefixIcon: const Icon(Icons.date_range),),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(isEditing5 ? Icons.save : Icons.edit),
                  onPressed: () {
                    setState(() {
                      if (isEditing5) {
                        // Save button pressed
                        // Perform save operation here
                      }
                      isEditing5 = !isEditing5;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        const Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Adress",
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
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 200,
                    child: TextFormField(
                      controller: textEditingController6,
                      enabled: isEditing6,
                      decoration: InputDecoration(border: InputBorder.none,  hintText: 'Syria-damascus', prefixIcon: const Icon(Icons.location_city),),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(isEditing6 ? Icons.save : Icons.edit),
                  onPressed: () {
                    setState(() {
                      if (isEditing6) {
                        // Save button pressed
                        // Perform save operation here
                      }
                      isEditing6 = !isEditing6;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        const Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Your ID number",
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
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 200,
                    child: TextFormField(
                      controller: textEditingController7,
                      enabled: isEditing7,
                      decoration: InputDecoration(border: InputBorder.none,  hintText: '04015342323', prefixIcon: const Icon(Icons.numbers_rounded),),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(isEditing7 ? Icons.save : Icons.edit),
                  onPressed: () {
                    setState(() {
                      if (isEditing7) {
                        // Save button pressed
                        // Perform save operation here
                      }
                      isEditing7 = !isEditing7;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        const Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "One of your relative number",
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
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 200,
                    child: TextFormField(
                      controller: textEditingController8,
                      enabled: isEditing8,
                      decoration: InputDecoration(border: InputBorder.none,  hintText: '09......', prefixIcon: const Icon(Icons.phone),),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(isEditing8 ? Icons.save : Icons.edit),
                  onPressed: () {
                    setState(() {
                      if (isEditing8) {
                        // Save button pressed
                        // Perform save operation here
                      }
                      isEditing8 = !isEditing8;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
),

      
    );
  }
}