import 'package:flutter/material.dart';

class Exercise3Screen extends StatelessWidget {
  const Exercise3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3: Layout Composition'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row káº¿t há»£p cÄƒn Ä‘á»u 3 Ã´ thá»‘ng kÃª
            Row(
              children: [
                _buildStatBox('Lá»›p há»c', '12', Colors.blue),
                const SizedBox(width: 8),
                _buildStatBox('Äiá»ƒm danh', '98%', Colors.green),
                const SizedBox(width: 8),
                _buildStatBox('Äiá»ƒm TB', '8.5', Colors.orange),
              ],
            ),
            const SizedBox(height: 20),

            const Text(
              'Danh sÃ¡ch sinh viÃªn (ListView cuá»™n mÆ°á»£t):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // ListView hiá»ƒn thá»‹ danh sÃ¡ch cuá»™n
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepOrange.shade100,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.deepOrange),
                        ),
                      ),
                      title: Text('Sinh viÃªn ${index + 1}'),
                      subtitle: Text('MSSV: 202600${index + 10}'),
                      trailing: const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBox(String title, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.4)),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
