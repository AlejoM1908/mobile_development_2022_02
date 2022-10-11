import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gps_usage/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:gps_usage/utils/colors.dart' as app_colors;

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
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () => model.zoomIn(),
                  backgroundColor: app_colors.primary,
                  child: const Icon(Icons.add),
                ),
                SizedBox(height: media.size.height * 0.02),
                FloatingActionButton(
                  onPressed: () => model.zoomOut(),
                  backgroundColor: app_colors.primary,
                  child: const Icon(Icons.remove),
                ),
                SizedBox(height: media.size.height * 0.02),
                FloatingActionButton(
                  onPressed: () => model.centerCamera(),
                  backgroundColor: app_colors.primary,
                  child: const Icon(Icons.my_location),
                ),
              ],
            ),
            body: Container(
              height: media.size.height,
              width: media.size.width,
              color: app_colors.background,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: model.initialPosition,
                  zoom: 17.0,
                ),
                onMapCreated: model.onMapCreated,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
              ),
            )));
  }
}
