import 'package:flutter/material.dart';
import '../../bloc/export.dart';

class EditPage extends StatelessWidget {
  EditPage(this.user, {super.key});

  final User user;
  final TextEditingController nameC = TextEditingController();
  final TextEditingController ageC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserBloc userB = context.read<UserBloc>();
    nameC.text = user.name;
    ageC.text = user.age.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('EDIT USER'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
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
            controller: ageC,
            decoration: const InputDecoration(
                labelText: 'Umur', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                userB.add(EditUserEvent(User(
                    id: user.id, name: nameC.text, age: int.parse(ageC.text))));
                Navigator.pop(context);
              },
              child: const Text('SAVE '))
        ],
      ),
    );
  }
}
