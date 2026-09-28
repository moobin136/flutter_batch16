import 'package:flutter_batch16/export.dart';

class MainNavBarScreen extends StatefulWidget {
  const MainNavBarScreen({super.key});

  @override
  State<MainNavBarScreen> createState() => _MainNavBarScreenState();
}

class _MainNavBarScreenState extends State<MainNavBarScreen> {
  int selectedIndex = 0;

  List<Widget> screenList = <Widget>[
    const NewTaskScreen(),
    const CompletedTaskScreen(),
    const CancelTaskScreen(),
    const ProgressTaskScreen()
  ];

  navbarSelectedIndex(int index) {
    selectedIndex = index;
    print(selectedIndex);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TaskAppBar(),
      bottomNavigationBar: buildNavigationBar(),
      body: screenList[selectedIndex],
    );
  }

  Widget buildNavigationBar() {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: navbarSelectedIndex,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.comment),
          label: 'New',
        ),
        NavigationDestination(
          icon: Icon(Icons.done_all),
          label: 'Complete',
        ),
        NavigationDestination(
          icon: Icon(Icons.delete_outline),
          label: 'Cancel',
        ),
        NavigationDestination(
          icon: Icon(Icons.hourglass_bottom),
          label: 'Progress',
        ),
      ],
    );
  }
}
