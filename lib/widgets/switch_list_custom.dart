import 'package:flutter/material.dart';

class SwitchListCustom extends StatelessWidget {
  const SwitchListCustom(
      {super.key,
      required this.switchValue,
      required this.onChanged,
      required this.title,
      required this.subtitle});

  final bool switchValue;
  final String title;
  final String subtitle;

  // final ValueChanged<bool> onChanged;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: switchValue,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
