import 'package:flutter_batch16/export.dart';
import 'package:flutter_batch16/routes.dart';

class TaskAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TaskAppBar({
    super.key,
    this.isProfilePage = false,
    this.isFirstPage = false,
  });

  final bool? isProfilePage;
  final bool? isFirstPage;

  @override
  Widget build(BuildContext context) {
    return AppBar(

      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
      ),
      backgroundColor: Colors.green,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Text(
        isProfilePage! ? 'Profile' : 'All Task',
        style: const TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        isFirstPage!
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              )
            : Container(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
