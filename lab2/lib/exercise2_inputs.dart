import 'package:flutter/material.dart';

class Exercise2Screen extends StatefulWidget {
  const Exercise2Screen({super.key});

  @override
  State<Exercise2Screen> createState() => _Exercise2ScreenState();
}

class _Exercise2ScreenState extends State<Exercise2Screen> {
  double _volume = 50.0;
  bool _notificationEnabled = true;
  String _gender = 'Nam';
  DateTime? _selectedDate;

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2: Input Controls'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Slider Widget
            Text('1. Slider: Ã‚m lÆ°á»£ng (${_volume.round()}%)',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Slider(
              value: _volume,
              min: 0,
              max: 100,
              divisions: 100,
              label: _volume.round().toString(),
              activeColor: Colors.teal,
              onChanged: (val) => setState(() => _volume = val),
            ),
            const Divider(height: 28),

            // 2. Switch Widget
            SwitchListTile(
              title: const Text('2. Nháº­n thÃ´ng bÃ¡o', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(_notificationEnabled ? 'Äang báº­t' : 'Äang táº¯t'),
              value: _notificationEnabled,
              onChanged: (val) => setState(() => _notificationEnabled = val),
            ),
            const Divider(height: 28),

            // 3. Radio Options
            const Text('3. Chá»n giá»›i tÃ­nh:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            RadioGroup<String>(
              groupValue: _gender,
              onChanged: (val) {
                if (val != null) setState(() => _gender = val);
              },
              child: Column(
                children: [
                  RadioListTile<String>(
                    title: const Text('Nam'),
                    value: 'Nam',
                  ),
                  RadioListTile<String>(
                    title: const Text('Ná»¯'),
                    value: 'Ná»¯',
                  ),
                ],
              ),
            ),
            const Divider(height: 28),

            // 4. Date Picker
            const Text('4. Date Picker:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: _pickDate,
                  icon: const Icon(Icons.calendar_month, color: Colors.white),
                  label: const Text('Chá»n ngÃ y sinh', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                ),
                const SizedBox(width: 16),
                Text(
                  _selectedDate == null
                      ? 'ChÆ°a chá»n ngÃ y'
                      : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}