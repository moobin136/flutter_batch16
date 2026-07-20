import 'package:flutter/material.dart';
import 'package:flutter_batch16/core/global_widgets/cm_text.dart';

class Module12CLS3 extends StatefulWidget {
  const Module12CLS3({super.key});

  @override
  State<Module12CLS3> createState() => _Module12CLS3State();
}

class _Module12CLS3State extends State<Module12CLS3> {
  double panDx = 0;
  double panDy = 0;

  double hDx = 0;

  double vDy = 0;

  double scale = 1.0;
  double baseScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Module 12 Class 3',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const CustomText(text: 'Drag & Pan'),
            GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  panDx += details.delta.dx;
                  panDy += details.delta.dy;
                });
              },
              child: Transform.translate(
                offset: Offset(panDx, panDy),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                  child: const Center(
                    child: CustomText(
                      text: 'Drag and pan',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const CustomText(text: 'Horizontal'),
            GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  hDx += details.delta.dx;
                });
              },
              child: Transform.translate(
                offset: Offset(hDx, 0),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                  child: const Center(
                    child: CustomText(
                      text: 'Horizontal',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const CustomText(text: 'Vertical'),
            GestureDetector(
              onVerticalDragUpdate: (details) {
                setState(() {
                  vDy += details.delta.dy;
                });
              },
              child: Transform.translate(
                offset: Offset(0, vDy),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                  child: const Center(
                    child: CustomText(
                      text: 'Vertical',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const CustomText(text: 'Zoom'),
            GestureDetector(
              onScaleStart: (details) {
                baseScale = scale;
              },
              onScaleUpdate: (details) {
                setState(() {
                  // details.scale গুণ করতে হয়, যোগ নয়।
                  // clamp দিয়ে আমরা জুমের সাইজ ০.৫ থেকে ৫.০ এর মধ্যে সীমাবদ্ধ রাখলাম
                  // scale = (baseScale * details.scale).clamp(0.5, 5.0);
                  scale += details.scale;
                  scale = scale.clamp(0.5, 5.0);
                });
              },
              child: Transform.scale(
                scale: scale,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.black87,
                  child: const Center(
                    child: CustomText(
                      text: 'Zoom Me',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
