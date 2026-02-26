
import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  const Dropdown({super.key, required this.label, required this.selectedItem, required this.onChange,required this.menuItems,});
  final String label;
  final String selectedItem;
  final List<String> menuItems;
  final void Function(String?) onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelMedium),
          SizedBox(height: 16),
          Container(
            height: 66,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.blue, width: 1),
            ),
            child: Row(
              children: [
                Text(selectedItem, style: Theme.of(context).textTheme.displayMedium),
                Spacer(),
                DropdownButton<String>(
                  underline: SizedBox(),
                  items: menuItems.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: onChange,

                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
