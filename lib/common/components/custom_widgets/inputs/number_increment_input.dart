import 'package:flutter/material.dart';

import '../../app_widgets/buttons.dart';

class NumberIncrementController extends ChangeNotifier {
  int currentNumber = 1;

  NumberIncrementController({int? count}){
    currentNumber = count??1;
  }

  updateCurrentNumber(int updatedNumber) {
    currentNumber = updatedNumber;

    notifyListeners();
  }
}

class NumberIncrementInput extends StatefulWidget {
  const NumberIncrementInput(
      {super.key,
      required this.controller,
      required this.title,
      required this.axis});

  final Axis axis;
  final NumberIncrementController controller;
  final String title;

  @override
  State<NumberIncrementInput> createState() => _NumberIncrementInputState();
}

class _NumberIncrementInputState extends State<NumberIncrementInput> {
  updateControllerNumber(int newNumber) {
    if (newNumber < 1) {
      newNumber = 1;
    } else if (newNumber > 99) {
      newNumber = 99;
    }

    setState(() {
      widget.controller.updateCurrentNumber(newNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(12),
            boxShadow: [
            ],
            border: Border.all(
            ),
          ),
          child: Wrap(
            direction: widget.axis,
            textDirection: widget.axis == Axis.horizontal
                ? TextDirection.rtl
                : TextDirection.ltr,
            children: [
              RotatedBox(
                quarterTurns: widget.axis == Axis.horizontal ? 2 : 1,
                child: BtnIcon(
                    onTap: () {
                      int newNumber = widget.controller.currentNumber + 1;
                      updateControllerNumber(newNumber);
                    },
                    icon: const Icon(Icons.arrow_back_ios_sharp, size: 22)),
              ),
              SizedBox(
                height: widget.axis == Axis.horizontal ? 0 : 4,
                width: widget.axis == Axis.horizontal ? 4 : 0,
              ),
              CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "${widget.controller.currentNumber}",
                  )),
              SizedBox(
                height: widget.axis == Axis.horizontal ? 0 : 4,
                width: widget.axis == Axis.horizontal ? 4 : 0,
              ),
              RotatedBox(
                quarterTurns: widget.axis == Axis.horizontal ? 2 : 1,
                child: BtnIcon(
                  onTap: () {
                    int newNumber = widget.controller.currentNumber - 1;
                    updateControllerNumber(newNumber);
                  },
                  icon: const Icon(Icons.arrow_forward_ios_sharp, size: 22),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
