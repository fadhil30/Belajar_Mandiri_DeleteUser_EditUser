import 'dart:math';

import 'package:flutter/material.dart';
import '../../bloc/export.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});

  final TextEditingController nameC = TextEditingController();
  final TextEditingController ageC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserBloc userB = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text('ADD USER'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameC,
            decoration: const InputDecoration(
                labelText: 'Nama', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: ageC,
            decoration: const InputDecoration(
                labelText: 'Umur', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                userB.add(AddUserEvent(User(
                    id: Random().nextInt(9999),
                    name: nameC.text,
                    age: int.parse(ageC.text))));
                Navigator.pop(context);
              },
              child: Text('ADD USER'))
        ],
      ),
    );
  }
}
