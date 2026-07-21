import 'package:flutter_batch16/export.dart';

class CustomBGSVG extends StatelessWidget {
  const CustomBGSVG({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        SvgPicture.asset(
          AssetsPath.bgSVG,
          fit: BoxFit.cover,
          height: size.height,
          width: double.maxFinite,
        ),
        child,
      ],
    );
  }
}
