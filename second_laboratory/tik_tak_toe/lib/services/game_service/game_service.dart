import 'dart:math';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tic_tac_toe/app/app.locator.dart';

class GameService with ReactiveServiceMixin{
  final _dialogService = locator<DialogService>();
  List charactersList = List.filled(9, '');
  String firstName = 'Player O';
  String secondName = 'Player X';
  bool turn = Random().nextBool(); // false for player1, true for player2
  final _counter = ReactiveValue<int>(0);
  int firstScore = 0;
  int secondScore = 0;

  GameService(){
    listenToReactiveValues([_counter]);
  }

  setDefaultValues(){
    charactersList = List.filled(9, '');
    turn = Random().nextBool(); 
    _counter.value = 0;
  }

  clearGame(){
    setDefaultValues();
    turn = Random().nextBool();
    firstScore = 0;
    secondScore = 0;

    notifyListeners();
  }

  tileTap(int index) {
    if (charactersList[index] == '') {
      charactersList[index] = turn ? 'x' : 'o';
      turn = !turn;
      _counter.value ++;

      if (_counter.value == 9) {
        _dialogService.showDialog(
          title: 'Game Over',
          description: 'Game is a draw'
        );
        setDefaultValues();
      }
    }

    checkWiner(index);
  }

  checkWiner(int index){
    var character = charactersList[index];
    if (character == '') {
      return;
    }

    // Check columns
    for (int i = 0; i < 3; i++){
      if (
        character == charactersList[i] &&
        character == charactersList[i + 3] &&
        character == charactersList[i + 6]
      ){
        _finishGame();
        return;
      }
    }

    // Check rows
    for (int i = 0; i < 7; i += 3){
      if (
        character == charactersList[i] &&
        character == charactersList[i + 1] &&
        character == charactersList[i + 2]
      ){
        _finishGame();
        return;
      }
    }

    // Check diagonals
    if (
      character == charactersList[0] &&
      character == charactersList[4] &&
      character == charactersList[8]
    ){
      _finishGame();
      return;
    }

    if (
      character == charactersList[2] &&
      character == charactersList[4] &&
      character == charactersList[6]
    ){
      _finishGame();
      return;
    }
  }

  _finishGame(){
    _dialogService.showDialog(
      title: 'Game Over',
      description:
          'Game is over. The winner is ${turn ? firstName : secondName}',
    );

    turn ? firstScore ++ : secondScore ++;

    setDefaultValues();
  }
}