import 'screens/workers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fish Labour Manager',
      theme: ThemeData(useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Machhli Labour Manager")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Mark Attendance")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: const Text("Salary (Date Range)")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: const Text("Workers")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: const Text("Advance")),
          ],
        ),
      ),
    );
  }
}
