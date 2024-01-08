import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/todo_cubit.dart';
import '../models/todo.dart';

import 'add_todo_page.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Page'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('List of Todos:'),
            Expanded(
              child: BlocBuilder<TodoCubit, List<Todo>>(
                builder: (context, todos) {
                  if (todos.isEmpty == true) {
                    return const Text('No todos');
                  }
                  return ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return ListTile(title: Text(todo.name));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddTodoPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
