// Flutter imports:
import 'package:flutter/material.dart';
import 'package:kitchen_hub/ui/widgets/atoms/category_box.dart';
import 'package:kitchen_hub/ui/widgets/atoms/date_selector.dart';
import 'package:kitchen_hub/ui/widgets/atoms/product_name.dart';
import 'package:kitchen_hub/ui/widgets/atoms/quantity_selector.dart';
import 'package:kitchen_hub/ui/widgets/atoms/storage_selector.dart';
import 'package:kitchen_hub/ui/widgets/atoms/selector.dart';
import 'package:kitchen_hub/ui/widgets/organisms/products_showcase/products_showcase_view.dart';

// Package imports:
import 'package:stacked/stacked.dart';

// Project imports:
import 'package:kitchen_hub/ui/views/home/home_viewmodel.dart';
import 'package:kitchen_hub/ui/widgets/organisms/custom_bottom_navigation/custom_bottom_navigation_view.dart';
import 'package:kitchen_hub/utils/colors.dart' as app_colors;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);

    return ViewModelBuilder.reactive(
      builder: (context, HomeViewModel model, child) => Scaffold(
          appBar: AppBar(
            title: Text(model.title),
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
                      child: _getMainCenterView(model, context)),
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
                    child: FutureBuilder(
                      future: Future.delayed(const Duration(milliseconds: 240)),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return model.centerClicked
                              ? _getAddView(model, context)
                              : Container();
                        } else {
                          return const SizedBox();
                        }
                      },
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
          bottomNavigationBar: CustomBottomNavigationView(
            changeIndex: model.changeIndex,
            currentIndex: model.currentIndex,
          )),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget _getMainCenterView(HomeViewModel model, BuildContext context) {
    var media = MediaQuery.of(context);
    switch (model.currentIndex) {
      case 1:
        return Container(
          decoration: const BoxDecoration(
            color: app_colors.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
        );
      case 2:
        return Container(
          decoration: const BoxDecoration(
            color: app_colors.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
        );
      case 3:
        return Container(
            decoration: const BoxDecoration(
              color: app_colors.background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: media.size.width / media.size.height),
              itemBuilder: (context, index) {
                return CategoryBox(
                  onTap: () {},
                  category: model.categories[index],
                );
              },
              itemCount: model.categories.length,
            ));
      default:
        return Container(
            decoration: const BoxDecoration(
              color: app_colors.background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            child: model.noProducts()
                ? const Center(
                    child: Text(
                      'No products found',
                      style: TextStyle(
                          color: app_colors.text,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : ListView.builder(
                    itemCount: model.records.length - 1,
                    itemBuilder: (context, index) {
                      return ProductShowcase(
                        onProductTap: () {},
                        products: model.records[index],
                        categoryTag: model.categories[index].name,
                      );
                    },
                  ));
    }
  }

  Widget _getAddView(HomeViewModel model, BuildContext context) {
    final media = MediaQuery.of(context);

    switch (model.currentIndex) {
      case 1:
        return Container(
          decoration: const BoxDecoration(
            color: app_colors.primaryVariant,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
        );
      case 2:
        return Container(
          decoration: const BoxDecoration(
            color: app_colors.primaryVariant,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
        );
      case 3:
        return Container(
          decoration: const BoxDecoration(
            color: app_colors.primaryVariant,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
        );
      default:
        return Container(
          decoration: const BoxDecoration(
            color: app_colors.primaryVariant,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: model.categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio:
                          media.size.width / media.size.height * 1.8),
                  itemBuilder: (context, index) {
                    return Selector(
                      onTap: () {
                        model.categoryTapped(index);
                      },
                      icon:
                          'assets/images/category_icon_${model.categories[index].icon}.png',
                      title: model.categories[index].name,
                    );
                  },
                ),
              ),
              const Divider(
                color: app_colors.white,
                indent: 20.0,
                endIndent: 20.0,
                thickness: 2.0,
              ),
              model.categoryIndex >= 0
                  ? Expanded(
                      flex: 2,
                      child: GridView.builder(
                        itemCount: model.products[model.categoryIndex].length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio:
                                media.size.width / media.size.height * 1.8),
                        itemBuilder: (context, index) {
                          return Selector(
                            onTap: () {
                              model.productTapped(index);
                            },
                            icon:
                                'assets/images/product_icon_${model.products[model.categoryIndex][index].icon}.png',
                            title:
                                model.products[model.categoryIndex][index].name,
                          );
                        },
                      ),
                    )
                  : Container(),
            ],
          ),
        );
    }
  }
}
