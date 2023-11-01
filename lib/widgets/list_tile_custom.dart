import 'package:flutter/material.dart';

class ListTileCustom extends StatelessWidget {
  const ListTileCustom(
      {super.key,
      required this.iconCustom,
      required this.title,
      required this.onSelectScreen});

  final String title;
  final IconData iconCustom;
  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconCustom,
        size: 26,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 24,
            ),
      ),
      onTap: () {
        onSelectScreen(title);
      },
    );
  }
}
