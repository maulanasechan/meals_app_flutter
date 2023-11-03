import 'package:flutter/material.dart';
// import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/widgets/switch_list_custom.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filter_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  // final void Function(String identifier) onSelectScreen;
  // final Map<Filter, bool> selectedFilters;

//   @override
//   ConsumerState<FiltersScreen> createState() {
//     return _FiltersScreenState();
//   }
// }

// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
//   var _glutenFreeFilterSet = false;
//   var _lactoseFreeFilterSet = false;
//   var _vegetarianFilterSet = false;
//   var _veganFilterSet = false;

  // @override
  // void initState() {
  //   super.initState();
  //   final activeFilters = ref.read(filterProviders);
  //   _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
  //   _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
  //   _vegetarianFilterSet = activeFilters[Filter.vegetarian]!;
  //   _veganFilterSet = activeFilters[Filter.vegan]!;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProviders);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: widget.onSelectScreen),
      // body: WillPopScope(
      //   onWillPop: () async {
      //     ref.read(filterProviders.notifier).setAllFilters({
      //       Filter.glutenFree: _glutenFreeFilterSet,
      //       Filter.lactoseFree: _lactoseFreeFilterSet,
      //       Filter.vegetarian: _vegetarianFilterSet,
      //       Filter.vegan: _veganFilterSet,
      //     });
      //     return false;
      //   },
      body: Column(
        children: [
          SwitchListCustom(
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals.',
            switchValue: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProviders.notifier)
                  .setFilters(Filter.glutenFree, isChecked);
            },
          ),
          SwitchListCustom(
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals.',
            switchValue: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProviders.notifier)
                  .setFilters(Filter.lactoseFree, isChecked);
            },
          ),
          SwitchListCustom(
            title: 'Vegetarian-free',
            subtitle: 'Only include vegetarian meals.',
            switchValue: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProviders.notifier)
                  .setFilters(Filter.vegetarian, isChecked);
            },
          ),
          SwitchListCustom(
            title: 'Vegan-free',
            subtitle: 'Only include vegan meals.',
            switchValue: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProviders.notifier)
                  .setFilters(Filter.vegan, isChecked);
            },
          ),
        ],
      ),
      // ),
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