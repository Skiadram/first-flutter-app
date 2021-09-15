import 'package:flutter/material.dart';
import 'package:test_flutter/models/response.dart';

class NewScreen extends StatelessWidget {
  final Results maVar;
  const NewScreen({Key? key, required this.maVar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('new page'),
        automaticallyImplyLeading: true,
      ),
      body: Stack(
        children: [
          Image.network(maVar.image ?? ""),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: 300,
              color: Colors.black38,
              padding: EdgeInsets.all(10),
              child: Text(
                maVar.name ?? "NoName",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
