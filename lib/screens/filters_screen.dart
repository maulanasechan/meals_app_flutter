import 'package:flutter/material.dart';
// import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/widgets/switch_list_custom.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.selectedFilters});

  // final void Function(String identifier) onSelectScreen;
  final Map<Filter, bool> selectedFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.selectedFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.selectedFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.selectedFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.selectedFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: widget.onSelectScreen),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListCustom(
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals.',
              switchValue: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
            ),
            SwitchListCustom(
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals.',
              switchValue: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
            ),
            SwitchListCustom(
              title: 'Vegetarian-free',
              subtitle: 'Only include vegetarian meals.',
              switchValue: _vegetarianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
            ),
            SwitchListCustom(
              title: 'Vegan-free',
              subtitle: 'Only include vegan meals.',
              switchValue: _veganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// SwitchListTile(
//             value: _glutenFreeFilterSet,
//             onChanged: (isChecked) {
//               setState(() {
//                 _glutenFreeFilterSet = isChecked;
//               });
//             },
//             title: Text(
//               'Gluten-free',
//               style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground,
//                   ),
//             ),
//             subtitle: Text(
//               'Only include gluten-free meals.',
//               style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground,
//                   ),
//             ),
//             activeColor: Theme.of(context).colorScheme.tertiary,
//             contentPadding: const EdgeInsets.only(left: 34, right: 22),
//           ),