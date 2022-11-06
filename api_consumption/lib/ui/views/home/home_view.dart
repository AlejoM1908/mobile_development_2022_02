import 'package:api_consumption/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:api_consumption/utils/colors.dart' as app_colors;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);

    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, HomeViewModel model, child) => Scaffold(
            appBar: AppBar(
              elevation: 1.0,
              centerTitle: true,
              backgroundColor: app_colors.background,
              title: Text(model.title),
            ),
            body: Container(
              width: media.size.width,
              height: media.size.height,
              child: FutureBuilder(
                future: model.getHotels(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: model.hotels.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: app_colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: GestureDetector(
                              onTap: () => model.navigateToHotel(model.hotels[index]),
                              child: ListTile(
                                title: Text(model.hotels[index].name),
                                subtitle: Text(model.hotels[index].address),
                                trailing: Text(model.hotels[index].telephone),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )));
  }
}
