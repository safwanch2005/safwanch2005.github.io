import 'package:flutter/material.dart';
import 'package:sample_test/screens/home/home.dart';
import 'package:sample_test/screens/transactions/add%20and%20edit/is_editmode.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Home.selectedIndexNotifier,
      builder: (BuildContext context, int updatedIndex, Widget? _) {
        return BottomNavigationBar(
          currentIndex: updatedIndex,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: (newIndex) {
            Home.selectedIndexNotifier.value = newIndex;
          },
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded),
              label: 'chart',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'translations',
            ),
            BottomNavigationBarItem(
              icon: IsEditingMode.instance.isEditmode
                  ? const Icon(Icons.edit)
                  : const Icon(Icons.add),
              label: IsEditingMode.instance.isEditmode ? 'Edit' : 'Add',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'category',
            ),
          ],
        );
      },
    );
  }
}
