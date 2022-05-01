import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/states/task_state.dart';

class InputScreen extends StatefulWidget {
  static const routeName = 'input_screen';
  final int? id;

  // InputScreen([this.id]);
  const InputScreen({Key? key, this.id}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _titleCtrl = TextEditingController();
  final _statusCtrl = TextEditingController();

  @override
  void didChangeDependencies() {
    if(widget.id != null) {
      Todo task = Provider.of<GState>(context, listen: false).details(widget.id);

      _titleCtrl.text = task.title;
      _statusCtrl.text = task.status;
    }

    super.didChangeDependencies();
  }

  void _addTodo() {
    if(_titleCtrl.text.length < 0) {
      return;
    }

    if(widget.id != null) {
      Provider.of<GState>(context, listen: false).update(widget.id, _titleCtrl.text, _statusCtrl.text);
    } else {
      Provider.of<GState>(context, listen: false).addTodo(_titleCtrl.text);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id != null ? "Edit Todo" : "Insert Todo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _titleCtrl,
              decoration: InputDecoration(
                hintText: "Type here ..."
              ),
            ),
            if(widget.id != null)... [
              SizedBox(height: 20,),
              TextField(
                controller: _statusCtrl,
              ),
            ],
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  _addTodo();
                },
                child: Text(widget.id != null ? "Update" : "Save"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 60.0),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
