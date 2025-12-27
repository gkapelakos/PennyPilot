import 'package:flutter/material.dart';
import 'package:pennypilot/src/helpers/icon_helper.dart';

class IconPicker extends StatelessWidget {
  final Function(String) onIconSelected;

  const IconPicker({super.key, required this.onIconSelected});

  @override
  Widget build(BuildContext context) {
    final iconMap = IconHelper.iconMap;
    final iconNames = iconMap.keys.toList();

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
      ),
      itemCount: iconNames.length,
      itemBuilder: (context, index) {
        final iconName = iconNames[index];
        final iconData = iconMap[iconName];
        return IconButton(
          icon: Icon(iconData),
          onPressed: () => onIconSelected(iconName),
        );
      },
    );
  }
}
