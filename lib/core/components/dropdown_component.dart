import 'package:flutter/material.dart';
import 'package:royal_home/core/utils/text_style.dart';

class DropdownComponent extends StatelessWidget {
   DropdownComponent({
    super.key,
    required this.hintText,
    required this.items,
    this.selectedValue,
    required this.onChanged,
  });

  final String hintText;
  final List<String> items;
  String? selectedValue;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
        border: Border.all(color: Colors.grey), // Border color
      ),
      child: DropdownButton<String>(
        elevation: 0,
        underline: const SizedBox.shrink(),
        icon: const Icon(Icons.arrow_drop_down),
        isExpanded: true,
        dropdownColor: Colors.white,
        value: selectedValue,
        hint: const Text('Select a category'),
        onChanged: (String? newValue) {
            selectedValue = newValue ?? 'Electronics';
      
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: AppText.nunitoBold11,
            ),
          );
        }).toList(),
      ),
    );
  }
}
