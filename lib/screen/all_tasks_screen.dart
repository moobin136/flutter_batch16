import 'package:flutter_batch16/export.dart';


class AllTasks extends StatefulWidget {
  const AllTasks({super.key});

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFloatingActionButton(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _tasCountBar(),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) => TaskCardCommon(
                  color: AppColors.newTaskColor,
                  title: 'Title',
                  subTitle:
                      'Lorium most likely refers to the Latin name for an ancient Etruscan village located 19 km west of Rome, Italy, along the Via Aurelia (near modern-day Castel di Guido). It is historically famous as the place where the Roman Emperor Antoninus Pius was educated and later built a palace',
                  dateTime: DateTime.now(),
                  status: 'New',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primaryAppColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.addTaskScreen);
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  Widget _tasCountBar() {
    return const Row(
      children: [
        TaskCountCard(
          tasName: 'Completed',
          tasCount: 08,
        ),
        SizedBox(width: 8),
        TaskCountCard(
          tasName: 'New',
          tasCount: 18,
        ),
        SizedBox(width: 8),
        TaskCountCard(
          tasName: 'Progress',
          tasCount: 22,
        ),
        SizedBox(width: 8),
        TaskCountCard(
          tasName: 'Completed',
          tasCount: 10,
        ),
        SizedBox(width: 8),
      ],
    );
  }
}
