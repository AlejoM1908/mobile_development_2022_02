import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tic_tac_toe/app/app.locator.dart';
import 'package:tic_tac_toe/models/dialog_type.dart';

class AuthenticationService {
  final _dialogService = locator<DialogService>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signInAnnonymously() async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInAnonymously();
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'operation-not-allowed') {
        _dialogService.showCustomDialog(
            variant: DialogType.singleMessage,
            title: 'Error',
            description: 'Proceso de registro anónimo no permitido');
      }
    }
  }

  bool checkLoginStatus() {
    final User? user = _firebaseAuth.currentUser;
    return user != null;
  }

  void updateUserNickname(String nickname) {
    checkLoginStatus()
        ? _firebaseAuth.currentUser!.updateDisplayName(nickname)
        : null;
  }

  String? getUID() {
    return checkLoginStatus() ? _firebaseAuth.currentUser!.uid : null;
  }
}
