import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  bool _centerClicked = false;

  bool get centerClicked => _centerClicked;

  void toggleCenterClicked() {
    _centerClicked = !_centerClicked;
    notifyListeners();
  }
}
