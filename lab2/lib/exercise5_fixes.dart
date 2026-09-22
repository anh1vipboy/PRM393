import 'package:flutter/material.dart';

class Exercise5Screen extends StatelessWidget {
  const Exercise5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 5: Common UI Fixes'),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Card(
              color: Colors.amberAccent,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'ðŸ’¡ Lá»—i 1: TrÃ n chá»¯ trong Row (RenderFlex Overflow)\n'
                  'CÃ¡ch sá»­a: Bá»c Widget Text báº±ng Expanded Ä‘á»ƒ tá»± Ä‘á»™ng xuá»‘ng dÃ²ng.',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
            ),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Äoáº¡n vÄƒn báº£n nÃ y ráº¥t dÃ i. Nhá» cÃ³ Expanded, chá»¯ sáº½ tá»± Ä‘á»™ng xuá»‘ng dÃ²ng an toÃ n mÃ  khÃ´ng bao giá» bá»‹ lá»—i sá»c vÃ ng Ä‘en!',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 36),

            const Card(
              color: Colors.amberAccent,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'ðŸ’¡ Lá»—i 2: TrÃ n mÃ n hÃ¬nh chiá»u dá»c khi nhiá»u pháº§n tá»­\n'
                  'CÃ¡ch sá»­a: Bá»c Column báº±ng SingleChildScrollView Ä‘á»ƒ cho phÃ©p cuá»™n.',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
            ),
            const SizedBox(height: 12),

            for (int i = 1; i <= 6; i++)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.redAccent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text('Khá»‘i pháº§n tá»­ $i (Cuá»™n mÆ°á»£t mÃ  khÃ´ng lá»—i)'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}