import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:profit_taker_analyzer/constants/layout_constants.dart';
import 'package:profit_taker_analyzer/models/phase.dart';
import 'package:profit_taker_analyzer/models/phases.dart';
import 'package:profit_taker_analyzer/screens/home/utils/build_row.dart';
import 'package:profit_taker_analyzer/widgets/text_widgets.dart';

Widget buildCompactPhaseCard(
  int index,
  BuildContext context,
  double screenWidth,
  Phases phases,
  bool isBuggedRun,
) {
  final Phase phase = phases.getPhase(index)!;
  final double responsiveCardWidth = screenWidth / 2;

  List<String> labels = [
    FlutterI18n.translate(context, "phase_cards.shields"),
    FlutterI18n.translate(context, "phase_cards.legs"),
    FlutterI18n.translate(context, "phase_cards.body"),
    FlutterI18n.translate(context, "phase_cards.pylons"),
  ];

  List<String> overviewList = [
    phase.totalShield.toString(),
    phase.totalLeg.toString(),
    phase.totalBodyKill.toString(),
    phase.totalPylon.toString(),
  ];

  List<Widget> rows =
      generatePhaseRows(index, labels, overviewList, isBuggedRun, context);

  return Container(
    width: screenWidth < LayoutConstants.minimumResponsiveWidth
        ? LayoutConstants.phaseCardWidth
        : responsiveCardWidth,
    height: index == 1 && screenWidth < LayoutConstants.minimumResponsiveWidth
        ? 110
        : 160,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceBright,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: <Widget>[
        buildCompactCardHeader(phase, context, index, phases),
        buildCompactCardBody(rows, phase, index, context, isBuggedRun),
      ],
    ),
  );
}

// Helper: Generate Compact Phase Rows
List<Widget> generatePhaseRows(
  int index,
  List<String> labels,
  List<String> overviewList,
  bool isBuggedRun,
  BuildContext context,
) {
  List<Widget> rows;

  if (index == 1) {
    rows = labels.sublist(1, 3).asMap().entries.map((entry) {
      return buildRow(context, entry.value, overviewList[entry.key], false);
    }).toList();
  } else if (index == 2) {
    rows = labels.asMap().entries.map((entry) {
      return buildRow(context, entry.value, overviewList[entry.key],
          entry.key == 3 && isBuggedRun);
    }).toList();
  } else if (index == 3) {
    rows = labels.sublist(0, 3).asMap().entries.map((entry) {
      return buildRow(context, entry.value, overviewList[entry.key],
          entry.key == 0 && isBuggedRun || entry.key == 2 && isBuggedRun);
    }).toList();
  } else {
    rows = labels.asMap().entries.map((entry) {
      return buildRow(context, entry.value, overviewList[entry.key], false);
    }).toList();
  }
  return rows;
}

// Helper: Build Compact Card Header
Widget buildCompactCardHeader(
    Phase phase, BuildContext context, int index, Phases phases) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Text(
            FlutterI18n.translate(
                context, "phase_cards.phase_${phase.phaseNumber}"),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Column(
              children: <Widget>[
                generateRichText(
                  context,
                  [
                    generateTextSpan(
                      (index == 0
                              ? phase.totalTime
                              : (phase.totalTime -
                                  phases.getPhase(index - 1)!.totalTime))
                          .toStringAsFixed(3),
                      16,
                      FontWeight.w400,
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                    ),
                    generateTextSpan('s / ', 16, FontWeight.w400,
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest),
                    generateTextSpan(
                        phase.totalTime.toString(), 20, FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface),
                    generateTextSpan('s ', 20, FontWeight.w400,
                        color: Theme.of(context).colorScheme.onSurface),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

// Helper: Build Compact Card Body
Widget buildCompactCardBody(List<Widget> rows, Phase phase, int index,
    BuildContext context, bool isBuggedRun) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, left: 20),
    child: IntrinsicHeight(
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: rows,
            ),
          ),
          const SizedBox(
            width: 30,
            child: VerticalDivider(
              thickness: 2,
              width: 100,
              color: Color(0xFFAFAFAF),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildShieldsInfo(index, phase, context, isBuggedRun),
                  index != 1
                      ? const SizedBox(height: 6)
                      : const SizedBox.shrink(),
                  buildLegsInfo(phase, context),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

// Helper: Build Compact Shields Info
Widget buildShieldsInfo(
    int index, Phase phase, BuildContext context, bool isBuggedRun) {
  if (index == 1) return const SizedBox.shrink();

  return Wrap(
    spacing: 20.0,
    runSpacing: 8.0,
    direction: Axis.horizontal,
    children: phase.shieldChanges.map((pair) {
      bool isFirstPairAndIndexThreeAndBuggedRun =
          index == 3 && pair == phase.shieldChanges.first && isBuggedRun;
      return SizedBox(
        width: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(pair.icon, size: 13),
            Text(
              pair.shieldTime.toStringAsFixed(3),
              style: TextStyle(
                fontFamily: 'DMMono',
                fontSize: 12,
                color: isFirstPairAndIndexThreeAndBuggedRun
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
            ),
          ],
        ),
      );
    }).toList(),
  );
}

// Helper: Build Compact Legs Info
Widget buildLegsInfo(Phase phase, BuildContext context) {
  return Wrap(
    spacing: 20.0,
    runSpacing: 8.0,
    direction: Axis.horizontal,
    children: phase.legBreaks.map((pair) {
      return SizedBox(
        width: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(pair.icon, size: 8),
            Text(
              pair.breakTime.toStringAsFixed(3),
              style: TextStyle(
                fontFamily: 'DMMono',
                fontSize: 12,
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
            ),
          ],
        ),
      );
    }).toList(),
  );
}
