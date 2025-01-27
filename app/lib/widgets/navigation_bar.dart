import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A custom navigation bar widget used on the left side of the application.
///
/// The `NavigationBar` widget provides a vertical navigation bar with
/// customizable icons for different tabs. It includes a callback function
/// to notify when a tab is selected.
class NavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const NavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      descendantsAreFocusable: false,
      child: Container(
        width: 80,
        color: Theme.of(context).colorScheme.surfaceBright,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildNavItem(context, 'assets/icons/HOME_GREY.svg',
                'assets/icons/HOME_SELECTED.svg', 0),
            const SizedBox(height: 20),
            _buildNavItem(context, 'assets/icons/STORAGE_GREY.svg',
                'assets/icons/STORAGE_SELECTED.svg', 1),
            const SizedBox(height: 20),
            _buildNavItem(context, 'assets/icons/FAVORITES_GREY.svg',
                'assets/icons/FAVORITES_SELECTED.svg', 2),
            const SizedBox(height: 20),
            _buildNavItem(context, 'assets/icons/ANALYTICS_GREY.svg',
                'assets/icons/ANALYTICS_SELECTED.svg', 3),
            const SizedBox(height: 20),
            _buildNavItem(context, 'assets/icons/SETTINGS_GREY.svg',
                'assets/icons/SETTINGS_SELECTED.svg', 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String greyIconAsset,
      String selectedIconAsset, int index) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Center(
          child: IconButton(
            icon: SvgPicture.asset(
              currentIndex == index ? selectedIconAsset : greyIconAsset,
              width: 22,
              height: 22,
            ),
            onPressed: () {
              onTabSelected(index); // Pass the index to the parent widget
            },
          ),
        ),
      ],
    );
  }
}
