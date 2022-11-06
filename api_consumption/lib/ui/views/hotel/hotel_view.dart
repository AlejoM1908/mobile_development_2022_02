import 'package:api_consumption/models/hotel.dart';
import 'package:api_consumption/ui/views/hotel/hotel_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

import 'package:api_consumption/utils/colors.dart' as app_colors;

class HotelView extends StatelessWidget {
  Hotel? hotel;

  HotelView({super.key, this.hotel});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HotelViewModel(hotel: hotel!),
        builder: (context, HotelViewModel model, child) => Scaffold(
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
                  heroTag: 'btn1',
                  onPressed: () => model.zoomIn(),
                  backgroundColor: app_colors.primary,
                  child: const Icon(Icons.add),
                ),
                SizedBox(height: media.size.height * 0.02),
                FloatingActionButton(
                  heroTag: 'btn2',
                  onPressed: () => model.zoomOut(),
                  backgroundColor: app_colors.primary,
                  child: const Icon(Icons.remove),
                ),
                SizedBox(height: media.size.height * 0.02),
                FloatingActionButton(
                  heroTag: 'btn3',
                  onPressed: () => model.centerCamera(),
                  backgroundColor: app_colors.primary,
                  child: const Icon(Icons.my_location),
                ),
              ],
            ),
            body: Container(
              width: media.size.width,
              height: media.size.height,
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
                  markers: model.markers,
              )
            )));
  }
}
