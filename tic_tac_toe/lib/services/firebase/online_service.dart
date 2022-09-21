import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class OnlineService{
  final _firestore = FirebaseFirestore.instance;

  Future<void> createRoom(String room_code, String player_uid) async {
    await _firestore.collection('Room').doc(room_code).set({
      'fk_game': null,
      'token': room_code,
      'players': [player_uid],
      'is_active': true,
      'game': {
        'board': ['','','','','','','','',''],
        'score':[0,0],
        'turn': Random().nextBool(),
      }
      }
    );
  }

  Future<bool> joinRoom(String room_code, String player_uid) async {
    /// Join the game room if it exists and if there are not 2 players already
    final room = await _firestore.collection('Room').doc(room_code).get();

    if (room.exists && room.data()!['players'].length < 2) {
      await _firestore.collection('Room').doc(room_code).update({
        'players': FieldValue.arrayUnion([player_uid])
      });

      return true;
    }

    return false;
  }

  Future<void> leaveRoom(String room_code, String player_uid) async {
    /// Leave the game room if it exists and if the player is in the room
    /// Delete the room if user is the last one in the room
    final room = await _firestore.collection('Room').doc(room_code).get();

    if (room.exists && room.data()!['players'].contains(player_uid)) {
      await _firestore.collection('Room').doc(room_code).update({
        'players': FieldValue.arrayRemove([player_uid])
      });

      if (room.data()!['players'].length == 1) deleteRoom(room_code);
    }
  }

  Future<void> deleteRoom(String room_code) async {
    /// Delete the game room if it exists
    final room = await _firestore.collection('Room').doc(room_code).get();

    if (room.exists) {
      await _firestore.collection('Room').doc(room_code).delete();
    }
  }

  Future<void> updateGameState(String room_code, Map<String, dynamic> game) async {
    /// Update the game state
    final room = await _firestore.collection('Room').doc(room_code).get();

    if (room.exists) {
      await _firestore.collection('Room').doc(room_code).update({
        'game': game
      });
    }
  }

  Future<String> getOtherPlayerInfo(String room_code, String player_uid) async {
    /// Get the other player info
    final room = await _firestore.collection('Room').doc(room_code).get();

    if (room.exists) {
      final players = room.data()!['players'];
      final otherPlayer = players.firstWhere((element) => element != player_uid);
      final otherPlayerInfo = await _firestore.collection('User').doc(otherPlayer).get();

      return otherPlayerInfo.data()!['name'];
    }

    return '';
  }
}