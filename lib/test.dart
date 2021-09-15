import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_flutter/models/response.dart';

import 'newscreen.dart';

class ApiTestScreen extends StatefulWidget {
  const ApiTestScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ApiTestScreenState createState() => _ApiTestScreenState();
}

class _ApiTestScreenState extends State<ApiTestScreen> {
  List<Results> _characters = List.empty();

  Future<void> getAllCharacters() async {
    debugPrint('getting char...');
    var url = Uri.parse('https://rickandmortyapi.com/api/character');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      debugPrint("json decode");
      Map<String, dynamic> map = jsonDecode(response.body);

      debugPrint("fromJson");
      Response res = Response.fromJson(map);
      if (res.results!.isNotEmpty) {
        debugPrint("set results inside _characters");
        setState(() {
          _characters = res.results!.cast<Results>();
        });
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _getBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: getAllCharacters,
        tooltip: 'get all characters',
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
                        NewScreen(maVar: _characters[index])));
              },
            );
          });
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}
