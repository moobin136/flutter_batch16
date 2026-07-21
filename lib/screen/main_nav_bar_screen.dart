import 'package:flutter_batch16/export.dart';
import 'package:flutter_batch16/screen/cancel_task_screen.dart';
import 'package:flutter_batch16/screen/completed_task_screen.dart';
import 'package:flutter_batch16/screen/new_task_screen.dart';
import 'package:flutter_batch16/screen/progress_task_screen.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(26),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTW72AOBufVLUTZtZIa5CDbCJM6UPwpj0TTppQwJyOarA&s=10',
                width: 55,
                height: 55,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Md Mozahedul Islam Mobin',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'moobinislam3@gmaoil.com',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: navbarSelectedIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.comment), label: 'New'),
          NavigationDestination(icon: Icon(Icons.done_all), label: 'Complete'),
          NavigationDestination(
              icon: Icon(Icons.delete_outline), label: 'Cancel'),
          NavigationDestination(
              icon: Icon(Icons.hourglass_bottom), label: 'Progress'),
        ],
      ),
      body: screenList[selectedIndex],
    );
  }
}
