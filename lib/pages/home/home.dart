import 'package:flutter/material.dart';
import 'package:latihan_bloc/pages/add/add.dart';
import 'package:latihan_bloc/pages/edit/edit.dart';

import '../../bloc/export.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc userB = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text('ALL USERS'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        bloc: userB,
        builder: (context, state) {
          if (state.allUsers.isEmpty) {
            return const Center(
              child: Text('TIDAK ADA DATA'),
            );
          }
          return ListView.builder(
            itemCount: state.allUsers.length,
            itemBuilder: (context, index) {
              User user = state.allUsers[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPage(user),
                      ));
                },
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(user.name),
                subtitle: Text('${user.age} Tahun'),
                trailing: IconButton(
                    onPressed: () {
                      userB.add(DeleteUserEvent(user));
                    },
                    icon: Icon(Icons.delete)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPage(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
