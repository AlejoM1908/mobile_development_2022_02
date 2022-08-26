// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'main.dart';

/// The class Env is used to select different development environments
class Env{ 
  static Env? value;

  Env() {
    value= this;
    runApp(MyApp(this));
  }
}