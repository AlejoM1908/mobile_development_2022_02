import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tic_tac_toe/app/app.locator.dart';
import 'package:tic_tac_toe/app/app.router.dart';

class OnlineMenuViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  TextEditingController usernameController = TextEditingController();

  String _title = 'Administrar salas';
  String get title => _title;
  
  set title(String value) {
    _title = value;
  }

  void navigateToRoom() {}

  void navigateToJoinMatch() {
    _navigationService.navigateTo(Routes.joinRoomView);
  }
}