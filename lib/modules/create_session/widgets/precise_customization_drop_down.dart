import 'package:flutter/material.dart';

import '../../../common/Utils/utils.dart';
import '../../../common/common_dtos/session/session_dto.dart';
import '../../../common/components/custom_widgets/animated_drop_down_menu.dart';
import '../../../common/components/custom_widgets/clickable_equal_parition_divider.dart';

class PreciseCustomizationDropDown extends StatelessWidget {
  PreciseCustomizationDropDown(
      {super.key,
      required this.setsAndBreaksList,});

  final List setsAndBreaksList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedSingleWidgetDropDown(
        height: (setsAndBreaksList.length *
                (77 + 10)) +
           10,
        widget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            children: [
              ...setsAndBreaksList.map((e) {
                late Widget widget;
                if (e is SetDto) {
                  widget = AdvanceCustomizationListTileEachSet(
                    deleteSet: () {},
                    updateParentWidgetState: (){},
                    set: e,
                    metricShortForm:'mm',
                  );
                } else {
                  widget = AdvanceCustomizationListTileEachBreak(
                    updateParentWidgetState: (){},
                    deleteBeakDto:(){},
                    breakDto: e,
                  );
                }
                return Padding(
                  padding: EdgeInsets.only(
                      bottom:7),
                  child: widget,
                );
              }),
            ],
          ),
        ),
        title: 'Strings.preciseCustomization',
      ),
    );
  }
}

//this list tile is divided in 4 parts.
class AdvanceCustomizationListTileEachSet extends StatelessWidget {
  AdvanceCustomizationListTileEachSet({
    super.key,
    this.metricShortForm = 'kg',
    required this.set,
    required this.updateParentWidgetState,
    required this.deleteSet,
  });

  String metricShortForm;
  SetDto set;
  Function updateParentWidgetState;
  Function deleteSet;



  @override
  Widget build(BuildContext context) {
    return ClickableRoundedPartitionDividerWithTitle(
      containerHeight: 45,
      rowHeight: 77,
      partitions: [
        PartitionData(
          widthRatio: .30,
          title: "Set No.",
          widget: Text("${1}"),
          onTap: () {},
        ),
        PartitionData(
          widthRatio: .8,
          title: "Workout Name",
          widget: Text(
            set.parentWorkoutName ?? '',
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
          ),
          onTap: () {

          },
        ),
        PartitionData(
          widthRatio: .30,
          title: "Total Reps",
          widget: Text("${set.reps}"),
          onTap: () async {

          },
        ),
        PartitionData(
          widthRatio: .50,
          title: "Weight\n($metricShortForm)",
          widget: Text("${25}"),
          onTap: () async {

          },
        ),
        PartitionData(
          widthRatio: .50,
          title: "Duration",
          widget: Text(
            "${Utils.formatDurationToMM(set.setTotalDuration)}m ${Utils.formatDurationTo60S(set.setTotalDuration)}s",
          ),
          onTap: () async {

          },
        ),
        PartitionData(
          widthRatio: .26,
          widget: const Icon(Icons.delete),
          onTap: () {
            deleteSet();
            updateParentWidgetState();
          },
        ),
      ],
    );
  }
}

//this list tile is divided in 2 parts.
class AdvanceCustomizationListTileEachBreak extends StatelessWidget {
  AdvanceCustomizationListTileEachBreak({
    super.key,
    required this.breakDto,
    required this.deleteBeakDto,
    required this.updateParentWidgetState,
  });

  BreakDto breakDto;
  Function deleteBeakDto;
  Function updateParentWidgetState;

  @override
  Widget build(BuildContext context) {
    return ClickableRoundedPartitionDividerWithTitle(
      containerHeight: 45,
      rowHeight: 77,
      partitions: [
        PartitionData(
            title: "Break Duration",
            widget: Text(
                "${Utils.formatDurationToMM(breakDto.breakTotalDuration)}m ${Utils.formatDurationTo60S(breakDto.breakTotalDuration)}s"),
            onTap: () {

            }),
        PartitionData(
          widthRatio: .1,
          title: " ",
          widget: const Icon(Icons.delete),
          onTap: () {
            deleteBeakDto();
            updateParentWidgetState();
          },
        ),
      ],
    );
  }
}
