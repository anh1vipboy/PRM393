import 'package:flutter/material.dart';

class Exercise1Screen extends StatelessWidget {
  const Exercise1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 1: Core Widgets'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Text Widget vá»›i TextStyle Ä‘a dáº¡ng
            const Text(
              '1. Text Widget Demo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Há»c láº­p trÃ¬nh Flutter tháº­t dá»… dÃ ng vÃ  thÃº vá»‹!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.indigo,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Divider(height: 32),

            // 2. Image Widget tá»« Internet
            const Text(
              '2. Image Widget Demo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://picsum.photos/400/200',
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return Container(
                    height: 160,
                    color: Colors.grey.shade200,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                },
              ),
            ),
            const Divider(height: 32),

            // 3. Icon Widget
            const Text(
              '3. Icon Widget Demo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 36),
                Icon(Icons.thumb_up, color: Colors.blue, size: 36),
                Icon(Icons.star, color: Colors.amber, size: 36),
                Icon(Icons.share, color: Colors.green, size: 36),
              ],
            ),
            const Divider(height: 32),

            // 4. Card káº¿t há»£p ListTile
            const Text(
              '4. Card & ListTile Demo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.indigo,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text('Nguyá»…n VÄƒn A', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Sinh viÃªn Khoa CNTT - ChuyÃªn ngÃ nh Mobile'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}