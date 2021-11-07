import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:puzzler/pieces.dart';

class Arrange8 extends StatelessWidget {
  Future wonPopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 15,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Image.asset('assets/won.gif'),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var piecesData = Provider.of<Pieces>(context);
    final pieces = piecesData.pieceList;

    return Scaffold(
      appBar: AppBar(
        title: Text('Solve'),
      ),
      body: Column(
        children: [
          Center(
            widthFactor: double.infinity,
            child: Container(
              height: 300,
              width: 300,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: pieces.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(2),
                      child: ElevatedButton(
                        onPressed: () {
                          piecesData.swap(index);
                          if (piecesData.status) wonPopUp(context);
                        },
                        child: Center(
                          child: Text(
                            pieces[index].value,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          IconButton(
            onPressed: () {
              piecesData.checkSolved();
              piecesData.show();
              if (piecesData.status) wonPopUp(context);
            },
            icon: Icon(Icons.verified),
          ),
          FloatingActionButton(
            onPressed: piecesData.set,
            child: Text("Set"),
          ),
        ],
      ),
    );
  }
}
