import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  final List<String> items;
  const DropDown({Key? key, required this.items}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    String? selectedItem = widget.items.first;
    return Container(
        width: 140,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: DropdownButtonFormField<String>(
          items: widget.items.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(
              () {
                selectedItem = newValue;
              },
            );
          },
          value: selectedItem,
          decoration: const InputDecoration(
              label: Text("Type"),
              prefixIcon: Icon(Icons.type_specimen_outlined)),
        ));
  }
}
