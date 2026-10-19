import 'package:flutter_batch16/export.dart';

class CustomText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final bool? softWrap;
  final TextOverflow? overflow;
  final Color? selectionColor;
  final TextAlign? textAlign;
  final Color? color;
  final double? fSiz;
  final FontWeight? fontWeight;
  final Color? bgColor;
  final TextDirection? textDirection;
  final TextScaler? textScaler;

  const CustomText({
    super.key,
    required this.text,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.selectionColor,
    this.textAlign,
    this.color = Colors.black,
    this.fSiz = 16,
    this.fontWeight = FontWeight.w400,
    this.bgColor = Colors.black12,
    this.textDirection = TextDirection.ltr,
    this.textScaler,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textDirection: textDirection,
      textScaler: textScaler,
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      softWrap: softWrap,
      // selectionColor: Colors.blueGrey,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        
        fontSize: fSiz,
        fontWeight: fontWeight,
        // backgroundColor: bgColor,
      ),
    );
  }
}
