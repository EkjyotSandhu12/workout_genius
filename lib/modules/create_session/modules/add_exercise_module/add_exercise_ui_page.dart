import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_genius/common/components/app_widgets/buttons.dart';
import 'package:workout_genius/common/components/custom_widgets/inputs/number_text_input_with_incr_dcr.dart';
import 'package:workout_genius/modules/create_session/modules/add_exercise_module/widgets/reps_per_set_increment_input.dart';
import '../../../../../../common/theme/text_styles.dart';
import '../../../../common/app_values/app_strings.dart';
import '../../../../common/common_dtos/session/session_dto.dart';
import '../../../../common/components/custom_widgets/inputs/minutes_sec_increment_input.dart';
import '../../../../common/components/custom_widgets/inputs/number_increment_input.dart';
import '../../../../common/components/custom_widgets/inputs/text_field_with_title.dart';
import '../../../../common/utils/debounce.dart';
import '../../widgets/name_input_header.dart';
import '../../widgets/precise_customization_drop_down.dart';
import 'add_exercise_ui_view.dart';
import 'bloc/add_exercise_bloc.dart';

class AddExerciseUiPage extends StatelessWidget {
  const AddExerciseUiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddExerciseBloc>(
      create: (context) => AddExerciseBloc(),
      child: const AddExerciseUiView(),
    );
  }
}
