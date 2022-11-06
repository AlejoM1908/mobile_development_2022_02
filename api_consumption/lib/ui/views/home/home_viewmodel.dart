import 'package:api_consumption/app/app.locator.dart';
import 'package:api_consumption/app/app.router.dart';
import 'package:api_consumption/models/hotel.dart';
import 'package:api_consumption/services/http/http_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final HttpService _httpService = locator<HttpService>();

  final String _title = 'API Consumption';
  List<Hotel> _hotels = [];

  // Getters
  String get title => _title;
  List<Hotel> get hotels => _hotels;

  // Methods
  Future<void> getHotels() async {
    _hotels = [];
    _hotels.addAll(await _httpService.getHotels());
  }

  void navigateToHotel(Hotel hotel) {
    _navigationService.navigateTo(Routes.hotelView, arguments: HotelViewArguments(hotel: hotel));
  }
}
