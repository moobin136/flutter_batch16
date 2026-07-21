import 'package:flutter_batch16/export.dart';

import '../core/global_widgets/task_card_common.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) => TaskCardCommon(
            color: Colors.green,
            title: 'Title',
            subTitle:
                'Lorium most likely refers to the Latin name for an ancient Etruscan village located 19 km west of Rome, Italy, along the Via Aurelia (near modern-day Castel di Guido). It is historically famous as the place where the Roman Emperor Antoninus Pius was educated and later built a palace',
            dateTime: DateTime.now(),
            status: 'Completed',
          ),
        ),
      ),
    );
  }
}
