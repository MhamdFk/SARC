import 'package:flutter/material.dart';

class DiseaseSelectionDialog extends StatefulWidget {
  @override
  _DiseaseSelectionDialogState createState() => _DiseaseSelectionDialogState();
}

class _DiseaseSelectionDialogState extends State<DiseaseSelectionDialog> {
  List<String> selectedDiseases = [];
  List<String> diseases = [
    'اغماء',
    'مشاكل تنفسية',
    'جلطة',
    'توقف عضلة الفلب',
    'نزيف',
    'جرح',
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Diseases'),
      content: SingleChildScrollView(
        child: Column(
          children: diseases.map((disease) {
            return CheckboxListTile(
              title: Text(disease),
              value: selectedDiseases.contains(disease),
              onChanged: (value) {
                setState(() {
                  if (value != null && value) {
                    selectedDiseases.add(disease);
                  } else {
                    selectedDiseases.remove(disease);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, <String>[]); // تحديد النوع هنا
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, selectedDiseases);
          },
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}