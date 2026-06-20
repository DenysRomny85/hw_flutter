import 'package:flutter/material.dart';
import 'package:hw_flutter/lesson_25/decode.dart';
import 'package:hw_flutter/lesson_25/person_entity.dart';

class JsonDecodeScreen extends StatefulWidget {
  const JsonDecodeScreen({super.key});

  @override
  State<JsonDecodeScreen> createState() => _JsonDecodeScreenState();
}

class _JsonDecodeScreenState extends State<JsonDecodeScreen> {
  PersonEntity? _personEntity;

  @override
  void initState() {
    super.initState();

    _loadDataFromJson();
  }

  Future<void> _loadDataFromJson() async {
    final personEntity = await getDecodeDataFromJson();

    setState(() {
      _personEntity = personEntity;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_personEntity == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(27, 61, 112, 1),
        title: Text(
          'Json decode',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Номер чеку: ${_personEntity!.chequeId}'),
              Text('Вартість: ${_personEntity!.totalAmount}'),
              Text('Передбачення: ${_personEntity!.prediction}'),
              Text('Перелік товару:'),
              ..._personEntity!.items.map(
                (el) => Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text('- $el'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
