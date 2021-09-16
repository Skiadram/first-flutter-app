import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/response.dart';
import 'new_screen.dart';

class ApiTestScreen extends StatefulWidget {
  const ApiTestScreen({Key? key,}) : super(key: key);

  @override
  _ApiTestScreenState createState() => _ApiTestScreenState(); 
}

class _ApiTestScreenState extends State<ApiTestScreen> {
  List<Results> _characters = [];

  Future<void> getAllCharacters() async 
  {
    var uri = Uri.parse('https://rickandmortyapi.com/api/character');

    var response = await http.get(uri);
    
    if(response.statusCode == 200)
    {
      Map<String, dynamic> map = jsonDecode(response.body);
      Response res = Response.fromJson(map);

      if (res.results!.isNotEmpty) {
        debugPrint("set results inside _characters");
        setState(() {
          _characters = res.results!.cast<Results>();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: getAllCharacters,
        tooltip: 'Increment',
        child: const Icon(Icons.api),
      ),
    );
  }

  Widget _getBody() {
    if (_characters.isNotEmpty) {
      return ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: _characters.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_characters[index].name ?? "Vide"),
              leading: Image.network(_characters[index].image ?? ""),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        NewScreen(maVar: _characters[index],)));
              },
            );
          });
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}