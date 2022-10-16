import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  bool _centerClicked = false;
  int _currentIndex = 0;

  bool get centerClicked => _centerClicked;
  int get currentIndex => _currentIndex;

  void toggleCenterClicked() {
    _centerClicked = !_centerClicked;
    notifyListeners();
  }

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
