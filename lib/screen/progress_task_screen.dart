import 'package:flutter_batch16/export.dart';
import 'package:flutter_batch16/utils/app_colors.dart';

import '../core/global_widgets/task_card_common.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
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
          color: AppColors.progressTaskColor,
          title: 'Progress',
          subTitle:
              'Lorium most likely refers to the Latin name for an ancient Etruscan village located 19 km west of Rome, Italy, along the Via Aurelia (near modern-day Castel di Guido). It is historically famous as the place where the Roman Emperor Antoninus Pius was educated and later built a palace',
          dateTime: DateTime.now(),
          status: 'Progress',
        ),
      ),
    ));
  }
}
