import 'package:flutter/material.dart';

class DotsVertical extends StatelessWidget {
  DotsVertical({
    super.key,
    this.height = 24,
    this.width = 4.5,
    this.count = 3,
    this.gap = 6,
  });

  double height;
  double width;
  double gap;
  int count;

  Decoration decoration = BoxDecoration(
    borderRadius: BorderRadius.circular(12),
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
