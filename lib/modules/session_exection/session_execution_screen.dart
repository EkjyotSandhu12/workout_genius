import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:workout_genius/common/components/app_widgets/buttons.dart';
import '../../common/common_dtos/session/session_dto.dart';

@RoutePage()
class SessionExecutionScreen extends StatelessWidget {
  const SessionExecutionScreen({super.key, required this.session});

  final SessionDto session;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session Execution'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BtnElevated(
            onTap: () {},
            buttonText: 'Play',
            btnProperties: BtnProperties(
                size: const Size(100, 50), backgroundColor: Colors.green),
          ),
          const SizedBox(width: 24,),
          BtnElevated(
            onTap: () {},
            buttonText: 'Stop',
            btnProperties: BtnProperties(
              backgroundColor: Colors.red,
              size: const Size(100, 50),
            ),
          ),
        ],
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),

    );
  }
}
