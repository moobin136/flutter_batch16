import 'package:flutter_batch16/export.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final bool? centerTitle;
  final Color? backgroundColor;
  final double? elevation;
  final Widget? leading;
  final double? titleSpacing;
  final double btLf = 16;
  final double brRf = 16;
  final bool isBorderSizNone;

  const CustomAppbar({
    super.key,
    this.title,
    this.actions,
    this.centerTitle = true,
    this.backgroundColor = Colors.white,
    this.elevation = 0,
    this.leading,
    this.isBorderSizNone = true,
    this.titleSpacing = 1,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: actions,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      elevation: elevation,
      titleSpacing: titleSpacing,
      leading: leading,
      shape: RoundedRectangleBorder(
        side: isBorderSizNone
            ? BorderSide.none
            : const BorderSide(
                width: 0.01,
                color: Colors.black,
              ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(btLf),
          bottomRight: Radius.circular(brRf),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
