import 'package:flutter/material.dart';
import '../db/db.dart';

class WorkersScreen extends StatefulWidget {
  const WorkersScreen({super.key});

  @override
  State<WorkersScreen> createState() => _WorkersScreenState();
}

class _WorkersScreenState extends State<WorkersScreen> {
  List workers = [];

  @override
  void initState() {
    super.initState();
    loadWorkers();
  }

  Future loadWorkers() async {
    final db = await DB.database;
    workers = await db.query("workers");
    setState(() {});
  }

  Future addWorker(String name, String rate) async {
    final db = await DB.database;
    await db.insert("workers", {
      "name": name,
      "rate": int.parse(rate),
    });
    loadWorkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Workers")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String name = "";
          String rate = "";
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Add Worker"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(onChanged: (v) => name = v, decoration: const InputDecoration(labelText: "Name")),
                  TextField(onChanged: (v) => rate = v, decoration: const InputDecoration(labelText: "₹ Per Day"), keyboardType: TextInputType.number),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      addWorker(name, rate);
                      Navigator.pop(context);
                    },
                    child: const Text("Save"))
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: workers.length,
        itemBuilder: (_, i) => ListTile(
          title: Text(workers[i]['name']),
          trailing: Text("₹${workers[i]['rate']}"),
        ),
      ),
    );
  }
}
