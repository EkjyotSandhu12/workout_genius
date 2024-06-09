import 'package:flutter/material.dart';
class AnimatedSingleWidgetDropDown extends StatefulWidget {
  const AnimatedSingleWidgetDropDown({
    super.key,
    required this.widget,
    required this.title,
    required this.height,
  });

  final double height;
  final Widget widget;
  final String title;

  @override
  State<AnimatedSingleWidgetDropDown> createState() =>
      _AnimatedSingleWidgetDropDownState();
}

class _AnimatedSingleWidgetDropDownState
    extends State<AnimatedSingleWidgetDropDown> {
  bool isOpened = false;

  GlobalKey titleKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Material(
          key: titleKey,
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {

            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(
                    width: 10,
                  ),
                  AnimatedRotation(
                    turns: isOpened ? 0.5 : 0,
                    duration: const Duration(milliseconds: 400),
                    child: Icon(
                      Icons.arrow_drop_down_circle,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        /* if (isOpened)*/

        AnimatedContainer(
          height: isOpened ? widget.height : 0,
          duration: const Duration(milliseconds: 200),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 100),
            child: isOpened
                ? Container(
              padding: EdgeInsets.only(
                  top: 20),
              key: const ValueKey(2),
              child: widget.widget,)
                : const SizedBox(key: ValueKey(1)),
          ),
        ),
      ],
    );
  }
}
