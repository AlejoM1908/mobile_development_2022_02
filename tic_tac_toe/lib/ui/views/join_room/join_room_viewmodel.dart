import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class JoinRoomViewModel extends BaseViewModel {
  final TextEditingController roomCodeController = TextEditingController();
  String _title = 'Unirse a sala';
  String get title => _title;
  
  set title(String value) {
    _title = value;
  }

  void joinRoom() {}
}