import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:modern/Services/fire_store.dart';
import 'package:modern/Services/notification_service.dart';
import 'package:modern/components/disese_dialog.dart';
import 'package:modern/components/navbar.dart';
import 'package:http/http.dart' as http;

class MultiSelect extends StatefulWidget {
  final List<String> items;

  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  //this variable holds the selected items
  final List<String> _selectedItems = [];

  // this function will triggered when checkbox or not
  void _itemChange(String itemValue, bool isSlected) {
    setState(() {
      if (isSlected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context, <String>[]);
  }

  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('اختر الأمراض'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('إلغاء'),
        ),
        TextButton(
          onPressed: _submit,
          child: const Text('تأكيد'),
        ),
      ],
    );
  }
}

class MyCheckBox extends StatefulWidget {
  const MyCheckBox({Key? key}) : super(key: key);

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  final TextEditingController caseController = TextEditingController();
  String status = '';
  List<String> selected = [];
  int messageCount = 0;

  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    final List<String> items = [
      'أمراض القلب والدورة الدموية',
      'امراض الجهاز العصبي',
      'أمراض الدم',
      'أمراض الغدد',
      'أمراض العظام',
      'أمراض العيون',
      'أمراض الجهاز الحركي',
      'أمراض الأنف والأذن والحنجرة',
      'أمراض الجهاز التنفسي',
    ];

    final List<String> results = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiSelect(items: items);
        });

    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    } else {
      _selectedItems = [];
    }
  }

//firestore accses
  final firestoreDatabase database = firestoreDatabase();
  final FireStoreService fireStoreService = FireStoreService();
  NotificationServices notificationServices = NotificationServices();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseinit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.getDeviceToken().then((value) {
      print('device token');
      print(value);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage) {
      setState(() {
        messageCount++;
      });
    });
  }

  void postRequest() {
    if (selected.isNotEmpty && status.isNotEmpty) {
      List message = selected;
      String message2 = status;
      database.addrequests(message, message2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  NavBar(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 234, 27, 34),
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
        actions: <Widget>[
          Badge(
            badgeContent: Text(
              '$messageCount',
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(
              icon: Icon(Icons.notifications),
              color: Colors.white,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _showMultiSelect,
                    child: const Text('يرجى تحديد الامراض الموجودة لديك')),
                const Divider(
                  height: 30,
                ),
                Wrap(
                  children:
                      _selectedItems.map((e) => Chip(label: Text(e))).toList(),
                ),
                const Divider(
                  thickness: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                'تأكيد',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Text(
                                    'يرجى تحديد ما الحالة و شرح أكثر عن الوضع',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      final List<String>? selectedDiseases =
                                          await showDialog(
                                        context: context,
                                        builder: (context) =>
                                            DiseaseSelectionDialog(),
                                      );
                                      if (selectedDiseases != null) {
                                        print(
                                            'Selected diseases: $selectedDiseases');
                                        selected = selectedDiseases;
                                      }
                                    },
                                    child: const Text(
                                      'اضغط هنا لتحديد الحالة',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: TextFormField(
                                      controller: caseController,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: "يرجى كتابة الحالة",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      onChanged: (value) {
                                        status = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('الغاء'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    
                                    // Perform the action here with userInput
                                    notificationServices
                                        .getDeviceToken()
                                        .then((value) async {
                                      //get the token
                                      String? deviceToken =
                                          await notificationServices
                                              .getDeviceToken();
                                      var data = {
                                        'to': deviceToken,
                                        'priority': 'high',
                                        'notification': {
                                          'title': selected.toString(),
                                          'body': status,
                                        }
                                      };
                                      await http.post(
                                          Uri.parse(
                                              'https://fcm.googleapis.com/fcm/send'),
                                          body: jsonEncode(data),
                                          headers: {
                                            'Content-Type':
                                                'application/json; charset=UTF-8',
                                            'Authorization':
                                                'key=AAAAOdDw6YM:APA91bHqy06Cx42yG444mUKfBEDY2NluPkjhZY_TRWO2XSZ8j9z61JhFTQ5v4_TrkYKof9pGu5G1f9atPczlvkaKF8MlcOP_IkCBIXTkhfiZWHgZkrlA0IMYET8AFH3vTTguj8Qw2ENH'
                                          });
                                    });
                                    postRequest();
                                    Navigator.pushNamed(context, '/maps');
                                  },
                                  child: Text('تأكيد'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text('اضغط هنا لطلب سيارة اسعاف '),
                    ),
                    const Divider(
                      height: 30,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Badge extends StatelessWidget {
  final Widget badgeContent;
  final Widget child;

  Badge({required this.badgeContent, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          right: 5,
          top: 0,
          child: badgeContent,
        ),
      ],
    );
  }
}
