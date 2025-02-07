import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:profit_taker_analyzer/constants/layout/layout_constants.dart';
import 'package:profit_taker_analyzer/screens/analytics/widgets/header.dart';
import 'package:profit_taker_analyzer/screens/analytics/widgets/main_content.dart';
import 'package:profit_taker_analyzer/screens/analytics/widgets/subtitle.dart';
import 'package:rust_core/rust_core.dart';
import 'package:screenshot/screenshot.dart';

/// A screen displaying analytics information, including average times and run times.
///
/// This screen fetches and displays average time data and individual run times.
/// It also allows users to toggle visibility for different graph series related to
/// time data (e.g., Total Time, Flight Time, Shield Time, etc.).
class AnalyticsScreen extends StatefulWidget {
  /// Creates an instance of [AnalyticsScreen].
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  /// Controller to manage the scrolling behavior of the screen.
  ScrollController _scrollController = ScrollController();

  /// Controller to manage screenshots of the screen.
  ScreenshotController screenshotController = ScreenshotController();

  /// Timer used for debouncing requests.
  Timer? _debounceTimer;

  /// Stores the fetched average times data.
  TimeTypeModel? _averageTimes;

  /// List of run times fetched for analytics purposes.
  List<AnalyticsRunTotalTimesModel> _runTimes = [];

  // Boolean variables to control visibility of different graph series
  bool isTotalTimeVisible = true;
  bool isFlightTimeVisible = true;
  bool isShieldTimeVisible = true;
  bool isLegTimeVisible = true;
  bool isBodyTimeVisible = true;
  bool isPylonTimeVisible = true;

  @override
  void initState() {
    super.initState();
    // Initialize the scroll controller and fetch necessary data.
    _scrollController = ScrollController();
    fetchAverageData();
    fetchRunTimes();
  }

  /// Fetches average time data from the backend.
  ///
  /// This method calls a backend service to get average times and updates the
  /// state with the fetched data. If an error occurs, it will log the error in
  /// debug mode.
  void fetchAverageData() async {
    try {
      final data = getAverageTimes();
      setState(() {
        _averageTimes = data; // Update the state with fetched data
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading data: $e');
      }
    }
  }

  /// Fetches the run times for analytics purposes.
  ///
  /// This method retrieves the run times from the backend and updates the
  /// state with the fetched run times. If an error occurs, it will log the
  /// error in debug mode.
  void fetchRunTimes() async {
    try {
      final runs = getAnalyticsRuns(limit: 50);
      setState(() {
        _runTimes = runs;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching run times: $e');
      }
    }
  }

  @override
  void dispose() {
    // Cancels the debounce timer when the widget is disposed.
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the screen width considering the padding and margins.
    double screenWidth = MediaQuery.of(context).size.width -
        (LayoutConstants.totalLeftPaddingHome) -
        13; // 13 pixels to make left side padding the same as the right side

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.only(left: 60, top: 30, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header widget for the analytics screen.
              AnalyticsHeader(
                screenshotController: screenshotController,
                fetchAverageData: fetchAverageData,
              ),
              const AnalyticsSubTitle(), // Subtitle of the analytics screen.
              // Main content that displays the analytics data.
              AnalyticsMainContent(
                screenWidth: screenWidth,
                screenshotController: screenshotController,
                averageTimes: _averageTimes,
                runTimes: _runTimes,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
