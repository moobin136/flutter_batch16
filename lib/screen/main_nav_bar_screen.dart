import 'package:flutter_batch16/export.dart';

class MainNavBarScreen extends StatefulWidget {
  const MainNavBarScreen({super.key});

  @override
  State<MainNavBarScreen> createState() => _MainNavBarScreenState();
}

class _MainNavBarScreenState extends State<MainNavBarScreen> {
  int selectedIndex = 0;

  List<Widget> screenList = <Widget>[
    const AllTasks(),
    const TaskHomeScreen(),
    const CancelTaskScreen(),
    const ProfileScreen(),
  ];

  navbarSelectedIndex(int index) {
    selectedIndex = index;
    print(selectedIndex);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskAppBar(
        isProfilePage: (selectedIndex == 3) ? true : false,
        isFirstPage: (selectedIndex == 0) ? true : false,
      ),
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
          label: 'All Tasks',
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
          icon: Icon(Icons.person_4_outlined),
          label: 'Profile',
        ),
      ],
    );
  }
}
