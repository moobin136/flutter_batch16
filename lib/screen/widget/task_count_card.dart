import 'package:flutter_batch16/export.dart';

class TaskCountCard extends StatelessWidget {
  const TaskCountCard({
    super.key,
    required this.tasName,
    required this.tasCount,
  });

  final String tasName;
  final int tasCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white70,
      ),
      child: SizedBox(
        width: 76,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: tasCount.toString(),
                fontWeight: FontWeight.w600,
                fSiz: 20,

              ),
              const SizedBox(height: 8),
              FittedBox(
                child: CustomText(
                  text: tasName,
                  fSiz: 16,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
