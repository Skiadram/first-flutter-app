import 'package:flutter/material.dart';
import 'models/response.dart';

class NewScreen extends StatelessWidget {
  final Results maVar;
  
  const NewScreen({Key? key, required this.maVar}) : super(key: key);

  static Icon favori = const Icon(Icons.star);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('new page'),
        automaticallyImplyLeading: true,
      ),
      body:
      Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _getImage(),
          IconButton(
            icon: favori,
            onPressed: () {
              if(favori==const Icon(Icons.star))
              {
                favori = const Icon(Icons.star_border);
              }
              else
              {
                favori =const Icon(Icons.star);
              }          
            },
          ),
          _getStatus(),
          _getSpecies(),
          _getGender(),
          _getOrigin(),
          _getLastLocation(),
        ],
      ),
    );
  }

  Widget _getImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(maVar.image ?? ""),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: 300,
            color: Colors.black38,
            padding: const EdgeInsets.all(10),
            child: Text(
              maVar.name ?? "NoName",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Widget _getStatus() {
    return Row(
      children: [
        const Text('Status'),
        const SizedBox(width: 100, height: 0),
        Text(
          maVar.status ?? "UNKNOWN",
          style: const TextStyle(fontSize: 0, color: Colors.black),
        ),
      ],
    );
  }

  Widget _getSpecies() {
    return Row(
      children: [
        const Text('Species'),
        const SizedBox(width: 100, height: 0),
        Text(
          maVar.species ?? "UNKNOWN",
          style: const TextStyle(fontSize: 0, color: Colors.black),
        ),
      ],
    );
  }

  Widget _getGender() {
    return Row(
      children: [
        const Text('Gender'),
        const SizedBox(width: 100, height: 0),
        Text(
          maVar.gender ?? "UNKNOWN",
          style: const TextStyle(fontSize: 0, color: Colors.black),
        ),
      ],
    );
  }

  Widget _getOrigin(){
    return Row(
      children: [
        const Text('Origin'),
        const SizedBox(width: 100, height: 0),
        Text(
          maVar.origin!.name ?? "UNKNOWN",
          style: const TextStyle(fontSize: 0, color: Colors.black),
        ),
      ],
    );
  }

  Widget _getLastLocation(){
    return Row(
      children: [
        const Text('LastLocation'),
        const SizedBox(width: 100, height: 0),
        Text(
          maVar.location!.name ?? "UNKNOWN",
          style: const TextStyle(fontSize: 0, color: Colors.black),
        ),
      ],
    );
  }
}