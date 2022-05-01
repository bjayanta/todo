import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/states/task_state.dart';
import 'input_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    Provider.of<GState>(context, listen: false).getRecords();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final todoData = Provider.of<GState>(context).todos;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home screen"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(InputScreen.routeName);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: todoData.length,
          itemBuilder: (context, index) {
            final item = todoData[index];

            return Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text("${index + 1}.", style: TextStyle(color: (item.status == 'done') ? Colors.green : Colors.black)),
                    SizedBox(width: 2),
                    Text("${item.title}.", style: TextStyle(color: (item.status == 'done') ? Colors.green : Colors.black)),
                    // Text("(${item.status})"),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return InputScreen(id: item.id);
                          }));
                        },
                        icon: Icon(Icons.edit, color: Colors.green)),
                    IconButton(
                      onPressed: () {
                        Provider.of<GState>(context, listen: false).deleteTodo(item.id);
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
