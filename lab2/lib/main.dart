import 'package:flutter/material.dart';
import 'exercise1_core.dart';
import 'exercise2_inputs.dart';
import 'exercise3_layouts.dart';
import 'exercise4_structure.dart';
import 'exercise5_fixes.dart';

void main() {
  runApp(const Lab4App());
}

class Lab4App extends StatelessWidget {
  const Lab4App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4 â€“ Flutter UI Fundamentals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6366F1)),
        useMaterial3: true,
      ),
      home: const Lab4MenuScreen(),
    );
  }
}

class Lab4MenuScreen extends StatelessWidget {
  const Lab4MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exercises = [
      {
        'title': 'Exercise 1 â€“ Core Widgets Demo',
        'subtitle': 'Text, Image, Icon, Card, ListTile',
        'screen': const Exercise1Screen(),
      },
      {
        'title': 'Exercise 2 â€“ Input Controls Demo',
        'subtitle': 'Slider, Switch, RadioListTile, Pickers',
        'screen': const Exercise2Screen(),
      },
      {
        'title': 'Exercise 3 â€“ Layout Demo',
        'subtitle': 'Column, Row, Padding, ListView',
        'screen': const Exercise3Screen(),
      },
      {
        'title': 'Exercise 4 â€“ App Structure & Theme',
        'subtitle': 'Scaffold, AppBar, Drawer, FAB, Theme',
        'screen': const Exercise4Screen(),
      },
      {
        'title': 'Exercise 5 â€“ Common UI Fixes',
        'subtitle': 'Expanded, SingleChildScrollView, Fix Overflow',
        'screen': const Exercise5Screen(),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          'Lab 4 â€“ Flutter UI Fundamentals',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final item = exercises[index];
          return Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              title: Text(
                item['title'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              subtitle: Text(
                item['subtitle'] as String,
                style: const TextStyle(color: Colors.black54, fontSize: 13),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item['screen'] as Widget),
                );
              },
            ),
          );
        },
      ),
    );
  }
}