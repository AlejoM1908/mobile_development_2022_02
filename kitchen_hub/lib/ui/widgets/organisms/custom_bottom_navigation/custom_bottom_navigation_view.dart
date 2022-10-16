import 'package:flutter/material.dart';
import 'package:kitchen_hub/ui/widgets/organisms/custom_bottom_navigation/custom_bottom_navigation_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:kitchen_hub/utils/colors.dart' as app_colors;

class CustomBottomNavigationView extends StatelessWidget {
  final void Function(int)? changeIndex;
  final int currentIndex;

  const CustomBottomNavigationView({super.key, required this.changeIndex, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);

    return ViewModelBuilder.reactive(
      builder: (context, CustomBottomNavigationViewModel model, child) =>
          BottomAppBar(
        child: Container(
          decoration: const BoxDecoration(color: app_colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                iconSize: media.orientation == Orientation.landscape
                    ? media.size.width * 0.05
                    : media.size.height * 0.05,
                color: currentIndex == 0
                    ? app_colors.primary
                    : app_colors.darkGrey,
                onPressed: () => changeIndex!(0),
              ),
              IconButton(
                icon: const Icon(Icons.home),
                iconSize: media.orientation == Orientation.landscape
                    ? media.size.width * 0.05
                    : media.size.height * 0.05,
                color: currentIndex == 1
                    ? app_colors.primary
                    : app_colors.darkGrey,
                onPressed: () => changeIndex!(1),
              ),
              SizedBox(
                width: media.orientation == Orientation.landscape
                    ? media.size.width * 0.08
                    : media.size.height * 0.08,
              ),
              IconButton(
                icon: const Icon(Icons.home),
                iconSize: media.orientation == Orientation.landscape
                    ? media.size.width * 0.05
                    : media.size.height * 0.05,
                color: currentIndex == 2
                    ? app_colors.primary
                    : app_colors.darkGrey,
                onPressed: () => changeIndex!(2),
              ),
              IconButton(
                icon: const Icon(Icons.home),
                iconSize: media.orientation == Orientation.landscape
                    ? media.size.width * 0.05
                    : media.size.height * 0.05,
                color: currentIndex == 3
                    ? app_colors.primary
                    : app_colors.darkGrey,
                onPressed: () => changeIndex!(3),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => CustomBottomNavigationViewModel(),
    );
  }
}
