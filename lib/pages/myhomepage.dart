// import 'package:flutter/material.dart';
// import 'package:modern/components/navbar.dart';

// class MultiSelect extends StatefulWidget {
//   final List<String> items;
//   const MultiSelect({Key? key, required this.items}) : super(key: key);

//   @override
//   State<MultiSelect> createState() => _MultiSelectState();
// }

// class _MultiSelectState extends State<MultiSelect> {
//   //this variable holds the selected items
//   final List<String> _selectedItems = [];

//   // this function will triggered when checkbox or not
//   void _itemChange(String itemValue, bool isSlected) {
//     setState(() {
//       if (isSlected) {
//         _selectedItems.add(itemValue);
//       } else {
//         _selectedItems.remove(itemValue);
//       }
//     });
//   }

//   void _cancel() {
//     Navigator.pop(context);
//   }

//   void _submit() {
//     Navigator.pop(context, _selectedItems);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('اختر الأمراض'),
//       content: SingleChildScrollView(
//         child: ListBody(
//           children: widget.items
//               .map((item) => CheckboxListTile(
//                     value: _selectedItems.contains(item),
//                     title: Text(item),
//                     controlAffinity: ListTileControlAffinity.leading,
//                     onChanged: (isChecked) => _itemChange(item, isChecked!),
//                   ))
//               .toList(),
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: _cancel,
//           child: const Text('إلغاء'),
//         ),
//         TextButton(
//           onPressed: _submit,
//           child: const Text('تأكيد'),
//         ),
//       ],
//     );
//   }
// }

// class MyCheckBox extends StatefulWidget {
//   const MyCheckBox({Key? key}) : super(key: key);

//   @override
//   State<MyCheckBox> createState() => _MyCheckBoxState();
// }

// class _MyCheckBoxState extends State<MyCheckBox> {
//   List<String> _selectedItems = [];

//   void _showMultiSelect() async {
//     final List<String> items = [
//       'أمراض القلب والدورة الدموية',
//       'امراض الجهاز العصبي',
//       'أمراض الدم',
//       'أمراض الغدد',
//       'أمراض العظام',
//       'أمراض العيون',
//       'أمراض الجهاز الحركي',
//       'أمراض الأنف والأذن والحنجرة',
//       'أمراض الجهاز التنفسي',
//     ];

//     final List<String> results = await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return MultiSelect(items: items);
//         });

//     if (results != null) {
//       setState(() {
//         _selectedItems = results;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ElevatedButton(
//                 onPressed: _showMultiSelect,
//                 child: const Text('يرجى تحديد الامراض الموجودة لديك')),
//             const Divider(
//               height: 30,
//             ),
//             Wrap(
//               children:
//                   _selectedItems.map((e) => Chip(label: Text(e))).toList(),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const NavBar(),
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         toolbarHeight: 115,
//         // leading: Padding(
//         //   padding: const EdgeInsets.symmetric(vertical: 40),
//         //   // child: IconButton(

//         //   //   onPressed: () {},
//         //   //   icon: const Icon(Icons.menu),
//         //   //   iconSize: 33,
//         //   //   alignment: Alignment.topCenter,
//         //   // ),
//         // ),
//         title: ClipOval(
//           child: Container(
//             color: Colors.white,
//             child: SizedBox(
//               child: Image.asset(
//                 'images/sarc.png',
//                 height: 100,
//               ),
//             ),
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const SizedBox(
//               height: 25,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 50.0, left: 10.0),
//               child: Row(
//                 children: <Widget>[
//                   IconButton(
//                     icon: const Icon(Icons.add),
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/MyCheckBox');
//                     },
//                     iconSize: 30,
//                   ),
//                   const Text(
//                     'يرجى ادخال اذا كنت تعاني من امراض',
//                     style: TextStyle(fontSize: 25),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 25,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 50.0, left: 10.0),
//                   child: Row(
//                     children: <Widget>[
//                       IconButton(
//                         icon: const Icon(Icons.car_crash),
//                         onPressed: () {
//                           showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return AlertDialog(
//                                 title: Text('Confirmation'),
//                                 content:
//                                     Text('Are you sure you want to proceed?'),
//                                 actions: <Widget>[
//                                   TextButton(
//                                     onPressed: () {
//                                       Navigator.of(context).pop();
//                                     },
//                                     child: Text('Cancel'),
//                                   ),
//                                   ElevatedButton(
//                                     onPressed: () {
//                                       // Perform the action here
//                                       Navigator.pushNamed(context, '/maps');
//                                     },
//                                     child: Text('Confirm'),
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         },
//                         iconSize: 30,
//                       ),
//                       const Text(
//                         'اضغط هنا لطلب سيارة اسعاف',
//                         style: TextStyle(fontSize: 25),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ]),
//     );
//   }
// }
