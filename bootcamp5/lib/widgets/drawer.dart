import 'package:bootcamp5/model/task_model.dart';
import 'package:bootcamp5/pages/home_page.dart';
import 'package:bootcamp5/pages/search_page.dart';
import 'package:flutter/material.dart';

class DrawerExample extends StatefulWidget {
  const DrawerExample({super.key});

  @override
  State<DrawerExample> createState() => _DrawerExampleState();
}

class _DrawerExampleState extends State<DrawerExample> {
  int selectedIdx = 0;
  void _onItemTap(int idx) {
    setState(() {
      selectedIdx = idx;
      // Navigator.pop(context);
      switch (idx) {
        case 0:
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                        tasks: List.generate(
                            20,
                            (i) => Task(
                                title: 'To do $i',
                                subtitle: 'subtitle bla bla $i',
                                description: 'bla bla bla $i')),
                      )));
        // case 1:
        //   return SearchPage();
        // case 2:
        //   return Center(
        //     child: Text("Logout Clicked"),
        //   );
        default:
          Center(
            child: Text("Error"),
          );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer Navigation"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text("Drawer")),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                _onItemTap(0);
              },
              selected: selectedIdx == 0,
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text("Search"),
              onTap: () {
                _onItemTap(1);
              },
              selected: selectedIdx == 1,
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                _onItemTap(2);
              },
              selected: selectedIdx == 2,
            ),
          ],
        ),
      ),
      // body: Center(
      //   child: _getDrawerItemWidget(selectedIdx),
      // ),
    );
  }

  Widget _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return HomePage(
          tasks: List.generate(
              20,
              (i) => Task(
                  title: 'To do $i',
                  subtitle: 'subtitle bla bla $i',
                  description: 'bla bla bla $i')),
        );
      case 1:
        return SearchPage();
      case 2:
        return Center(
          child: Text("Logout Clicked"),
        );
      default:
        return Center(
          child: Text("Error"),
        );
    }
  }
}
