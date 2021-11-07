import 'dart:math';
import 'package:flutter/material.dart';

import 'piece.dart';

class Pieces with ChangeNotifier {
  List<Piece> _pieceList = [
    Piece(0, '0'),
    Piece(0, '0'),
    Piece(0, '0'),
    Piece(0, '0'),
    Piece(0, '0'),
    Piece(0, '0'),
    Piece(0, '0'),
    Piece(0, '0'),
    Piece(8, ' '),
  ];
  const List<Piece> goalState = [
    Piece(0, '1'),
    Piece(1, '2'),
    Piece(2, '3'),
    Piece(3, '4'),
    Piece(4, '5'),
    Piece(5, '6'),
    Piece(6, '7'),
    Piece(7, '8'),
    Piece(8, ' '),
  ];

  List<Piece> get pieceList {
    return [..._pieceList];
  }

  bool status = false;

  int space = 8;

  Pieces() {
    generate();
  }

  void generate() {
    var rand = Random();
    String val;
    int num = 0;
    List<String> added = [];

    while (num < 8) {
      val = (rand.nextInt(8) + 1).toString();

      if (added.isEmpty || !added.contains(val)) {
        added.add(val);
        pieceList[num].id = num;
        pieceList[num].value = val;
        //pieceList.add(temp);
        print(pieceList[num].value);
        num++;
      }
    }
    print(added);
  }

  void generatePieces() {
    generate();
    notifyListeners();
  }

  bool checkMove(int index) {
    bool valid = (space + 1 == index) ||
        (space - 3 == index) ||
        (space + 3 == index) ||
        (space - 1 == index);

    return valid;
  }

  void checkSolved() {
    bool won = true;
    for (int n in [0, 1, 2, 3, 4, 5, 6, 7, 8])
      if (_pieceList[n].value != goalState[n].value) won = false;

    print(won);

    status = won;
  }

  void set() {
    _pieceList = goalState;
    notifyListeners();
  }

  void show() {
    Piece piece;
    for (piece in pieceList) print('${piece.id} : ${piece.value}');
    for (piece in goalState) print('${piece.id} : ${piece.value}');
    print(status);
  }

  void swap(int index) {
    if (checkMove(index)) {
      pieceList[space].value = pieceList[index].value;
      pieceList[index].value = " ";
      space = index;
      notifyListeners();
      checkSolved();
    }
  }
}
