import 'package:flutter_batch16/export.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CmIconTextButton extends StatelessWidget {
  const CmIconTextButton(
      {super.key,
      required this.labelText,
      required this.imagePath,
      this.onTap});

  final String labelText;
  final String imagePath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.black26, width: 0.85),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 24, width: 24, child: SvgPicture.asset(imagePath)),
              const SizedBox(width: 16),
              Text(
                labelText,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
