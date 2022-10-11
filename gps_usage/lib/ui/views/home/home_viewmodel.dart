import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gps_usage/app/app.locator.dart';
import 'package:location/location.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final LatLng _initialPosition = const LatLng(4.624335, -74.063644);
  late GoogleMapController _controller;
  final Location _location = Location();

  final String _title = 'GPS Usage';

  HomeViewModel(){
    _initLocationService();
  }

  // Getters
  String get title => _title;
  LatLng get initialPosition => _initialPosition;
  GoogleMapController get controller => _controller;
  Location get location => _location;

  void onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  void centerCamera() async {
    final LatLng currentPosition = LatLng(
      (await _location.getLocation()).latitude!,
      (await _location.getLocation()).longitude!,
    );
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: currentPosition,
        zoom: 17.0,
      ),
    ));
  }

  void _initLocationService() async {
    if (!await _location.serviceEnabled()) {
      if (!await _location.requestService()) {
        return;
      }
    }

    if (await _location.hasPermission() == PermissionStatus.denied) {
      if (await _location.requestPermission() != PermissionStatus.granted) {
        return;
      }
    }
  }

  void zoomIn() {
    _controller.animateCamera(CameraUpdate.zoomIn());
  }

  void zoomOut() {
    _controller.animateCamera(CameraUpdate.zoomOut());
  }
}
