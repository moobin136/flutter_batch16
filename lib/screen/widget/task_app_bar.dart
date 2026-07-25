import 'package:flutter_batch16/export.dart';
import 'package:flutter_batch16/routes.dart';

class TaskAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TaskAppBar({
    super.key,
    this.isProfilePage = false,
  });

  final bool? isProfilePage;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // automaticallyImplyActions: false,
      backgroundColor: Colors.green,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: GestureDetector(
        onTap: () {
          if (isProfilePage == false) {
            Navigator.pushNamed(context, AppRoutes.profileScreen);
          } else {
            return;
          }
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTW72AOBufVLUTZtZIa5CDbCJM6UPwpj0TTppQwJyOarA&s=10',
                width: 53,
                height: 53,
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
