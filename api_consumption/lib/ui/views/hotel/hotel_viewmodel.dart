import 'package:api_consumption/models/hotel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:stacked/stacked.dart';

class HotelViewModel extends BaseViewModel {
  LatLng _initialPosition = const LatLng(5.33775, -72.39586);
  late GoogleMapController _controller;
  final Location _location = Location();
  Set<Marker> markers = {};
  final String _title = 'Hotel';
  final Hotel _hotel;

  HotelViewModel({required Hotel hotel}) : _hotel = hotel {
    _initLocationService();

    markers.add(Marker(
      markerId: MarkerId(_hotel.name),
      position: LatLng(_hotel.long, _hotel.lat),
      infoWindow: InfoWindow(
        title: _hotel.name,
        snippet: _hotel.address,
      ),
    ));

    _initialPosition = LatLng(_hotel.long, _hotel.lat);
    notifyListeners();
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
