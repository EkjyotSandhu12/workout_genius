import 'package:flutter/material.dart';
import '../../services/loggy_service.dart';

class PartitionData {
  final Widget widget;
  final Function onTap;

  double? widthRatio;
  String? title;

  PartitionData({
    required this.widget,
    required this.onTap,
    this.title,
    this.widthRatio,
  });
}

class ClickableRoundedPartitionDividerWithTitle extends StatelessWidget {
  ClickableRoundedPartitionDividerWithTitle({
    super.key,
    required this.partitions,
    required this.rowHeight,
    this.containerPadding,
    this.containerHeight,
  });

  final List<PartitionData> partitions;
  final double rowHeight;
  EdgeInsets? containerPadding;
  double? containerHeight;

  @override
  Widget build(BuildContext context) {
    BorderSide bs = BorderSide(color: Colors.white);

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        alignment: Alignment.bottomCenter,
        height: rowHeight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...partitions.map(
              (e) {
                bool isFirst = partitions.indexOf(e) == 0;
                bool isLast = partitions.indexOf(e) == partitions.length - 1;
                BorderRadius? bRG = BorderRadius.circular(20);

                Widget child = Expanded(
                    flex: e.widthRatio != null
                        ? (e.widthRatio! * 100).toInt()
                        : 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Opacity(
                          opacity: .5,
                          child: Text(
                            e.title ?? '',
                            style: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Material(
                          borderRadius: bRG,
                          child: InkWell(
                            borderRadius: bRG,
                            onTap: () {
                              e.onTap();
                             myLog.traceLog("Clicked ${e.title}");
                            },
                            child: Container(
                              height: containerHeight,
                              padding: containerPadding ??
                                  const EdgeInsets.symmetric(horizontal: 4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: bRG,
                                border: Border(
                                  top: bs,
                                  bottom: bs,
                                  left: isFirst ? bs : BorderSide.none,
                                  right: bs,
                                ),
                              ),
                              child: e.widget,
                            ),
                          ),
                        ),
                      ],
                    ));

                return child;
              },
            ).toList()
          ],
        ),
      );
    });
  }
}
