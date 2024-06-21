
import 'package:flutter/material.dart';

class TextProf extends StatelessWidget {
  final String? dd;
  const TextProf({super.key , required this.dd,});

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
         Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        dd!,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const Text('  *' , style: TextStyle(color: Color.fromARGB(255, 234, 27, 34) , fontSize: 20),),
                      const SizedBox(
                        height: 33,
                      ),
                    ],
                  ),
                ),
      ]
    );
  }
}