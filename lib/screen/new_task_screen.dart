import 'package:flutter_batch16/export.dart';
import 'package:flutter_batch16/screen/widget/task_count_card.dart';
import 'package:flutter_batch16/utils/app_colors.dart';

import '../core/global_widgets/task_card_common.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryAppColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
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

  Widget _tasCountBar() {
    return Row(
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
