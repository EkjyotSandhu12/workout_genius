import 'package:flutter/material.dart';
import 'TextWithForwardArrowWidget.dart';

class ExerciseSessionTile extends StatelessWidget {
  const ExerciseSessionTile({
    super.key,
    required this.sessionName,
    required this.sessionTotalDuration,
  });

  final String sessionName;
  final String sessionTotalDuration;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin:  EdgeInsets.all(12),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(sessionName,),
              Opacity(
                opacity: .5,
                child: TextWithForwardArrowWidget(text:' Strings.startSession'),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            sessionTotalDuration,
          )
        ],
      ),
    );
  }
}
