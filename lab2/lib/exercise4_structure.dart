import 'package:flutter/material.dart';

class Exercise4Screen extends StatefulWidget {
  const Exercise4Screen({super.key});

  @override
  State<Exercise4Screen> createState() => _Exercise4ScreenState();
}

class _Exercise4ScreenState extends State<Exercise4Screen> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Exercise 4: Scaffold & Theme'),
          backgroundColor: Colors.purple.shade100,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              UserAccountsDrawerHeader(
                accountName: Text('Sinh viÃªn PRM393'),
                accountEmail: Text('student@fpt.edu.vn'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 36, color: Colors.purple),
                ),
                decoration: BoxDecoration(color: Colors.purple),
              ),
              ListTile(leading: Icon(Icons.home), title: Text('Trang chá»§')),
              ListTile(leading: Icon(Icons.school), title: Text('KhÃ³a há»c')),
              ListTile(leading: Icon(Icons.settings), title: Text('CÃ i Ä‘áº·t')),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _currentTabIndex == 0 ? Icons.dashboard_rounded : Icons.person_rounded,
                size: 72,
                color: Colors.purple,
              ),
              const SizedBox(height: 12),
              Text(
                'Ná»™i dung Ä‘ang á»Ÿ Tab ${_currentTabIndex == 0 ? "Báº£ng tin" : "CÃ¡ nhÃ¢n"}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('ÄÃ£ báº¥m Floating Action Button! ðŸŽ‰')),
            );
          },
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTabIndex,
          onTap: (index) => setState(() => _currentTabIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Báº£ng tin'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'CÃ¡ nhÃ¢n'),
          ],
        ),
      ),
    );
  }
}