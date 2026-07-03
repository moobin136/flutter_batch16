import 'package:flutter_batch16/export.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        isBorderSizNone: false,
      ),
      body: Column(
        children: [
          Spacer(),
          Center(
            child: CustomText(
              text:
                  'flaksjdfljasldjflk;ajsdlk;fjlk;asdjflkjaslk;djflk;asjdlfkjalskdjfl;kasjdlkfjlasdjfljasdlkfjlasjdfljasldfjlasjdlfjalsdjfajsdofjo;asjdfojo',
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
