import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_genius/common/components/app_widgets/buttons.dart';
import 'package:workout_genius/modules/session_exection/bloc/session_execution_bloc.dart';
import '../../common/common_dtos/session/session_dto.dart';
import '../../common/components/custom_widgets/rounded_circular_progress_indicator.dart';
import '../../common/theme/app_colors.dart';

class SessionExecutionScreen extends StatelessWidget {
  const SessionExecutionScreen({super.key, required this.session});

  final SessionDto session;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SessionExecutionBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Session Execution'),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BtnElevated(
                  onTap: () {
                    context
                        .read<SessionExecutionBloc>()
                        .add(SessionExecutionStarted());
                  },
                  buttonText: 'Play',
                  btnProperties: BtnProperties(
                    size: const Size(100, 50),
                    backgroundColor: Colors.green,
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
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
            body: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  height: 200,
                  width: 200,
                  child: RoundedCircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    strokeWidth: 20,
                    strokeColor: AppColors().getPrimaryColor,
                    value: .1,
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
