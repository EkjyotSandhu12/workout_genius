import 'package:flutter/material.dart';

class DotsVertical extends StatelessWidget {
  DotsVertical({
    super.key,
    this.width= 2.3,
    this.height= 15,
    this.gap= 4,
    this.count = 3,
  });

  double height;
  double width;
  double gap;
  int count;

  Decoration decoration = BoxDecoration(
    borderRadius: BorderRadius.circular(40),
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          count,
          (index) {
            return Column(
              children: [
                Container(

                  decoration: decoration,
                  height: height,
                  width: width,
                ),
                if (index < count-1)
                   SizedBox(
                    height: gap,
                  )
              ],
            );
          },
        )
      ],
    );
  }
}
