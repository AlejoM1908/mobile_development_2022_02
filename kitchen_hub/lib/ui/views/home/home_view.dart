import 'package:flutter/material.dart';
import 'package:kitchen_hub/ui/views/home/home_viewmodel.dart';
import 'package:kitchen_hub/ui/widgets/organisms/custom_bottom_navigation/custom_bottom_navigation_view.dart';
import 'package:stacked/stacked.dart';
import 'package:kitchen_hub/utils/colors.dart' as app_colors;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);

    return ViewModelBuilder.reactive(
      builder: (context, HomeViewModel model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            toolbarHeight: 50,
            elevation: 0,
            centerTitle: true,
            backgroundColor: app_colors.primary,
          ),
          body: Stack(
            children: <Widget>[
              Align(
                alignment: FractionalOffset.center,
                child: Container(
                  width: media.size.width,
                  height: media.size.height,
                  decoration: const BoxDecoration(color: app_colors.primary),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: app_colors.background,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    height: model.centerClicked ? media.size.height : 10.0,
                    width: model.centerClicked ? media.size.width : 10.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          model.centerClicked ? 0.0 : 300.0),
                      color: app_colors.primaryVariant,
                    ),
                  ))
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () => model.toggleCenterClicked(),
            child: const Icon(Icons.add),
            backgroundColor: app_colors.primary,
            elevation: 4.0,
          ),
          bottomNavigationBar: const CustomBottomNavigationView()),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}