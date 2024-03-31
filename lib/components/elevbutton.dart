import 'package:flutter/material.dart';

class Elevbutton extends StatelessWidget {
  const Elevbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ElevatedButton with AlertDialog'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Confirmation'),
                  content: Text('Are you sure you want to proceed?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Perform the action here
                        Navigator.of(context).pop();
                      },
                      child: Text('Confirm'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Show Confirmation Dialog'),
        ),
      ),
    );
  }
}