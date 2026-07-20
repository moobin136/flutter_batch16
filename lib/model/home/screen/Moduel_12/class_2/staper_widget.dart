import 'package:flutter/material.dart';
import 'package:flutter_batch16/core/global_widgets/cm_text.dart';
import 'package:flutter_batch16/model/home/screen/Moduel_12/class_3/moduel_12_cls_3.dart';
import 'package:flutter_batch16/model/home/screen/Module_13/module_13_class_one.dart';

import 'package:flutter_batch16/model/home/screen/Module_13/module_13_class_tow.dart';
import 'package:flutter_batch16/routes.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Moduel 12 Class 2',
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const CustomText(text: 'Spaper'),
          Stepper(
            stepIconBuilder: (stepIndex, stepState) => const Text('***'),
            connectorColor: WidgetStateProperty.all(Colors.blue),
            currentStep: 2,
            steps: const [
              Step(title: Text('data'), content: Text('data')),
              Step(title: Text('data'), content: Text('data')),
              Step(title: Text('data'), content: Text('data')),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Module12CLS3(),
                ),
              );
            },
            child: const CustomText(text: 'Module 12 Class 3'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Module13ClassOne(),
                ),
              );
            },
            child: const CustomText(text: 'Module 13 Class 1'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Module13ClassTow(),
                ),
              );
            },
            child: const CustomText(text: 'Module 13 Class 2'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.module13ClassThree);
            },
            child: const CustomText(text: 'Module 13 Class 3'),
          ),
        ],
      ),
    );
  }
}
