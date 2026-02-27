import 'package:flutter/material.dart';

/// PC 17: Date picker – start date and end date (end = start - 29 days).
class DatePickerPage extends StatefulWidget {
  const DatePickerPage({super.key});

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _pickStartDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        _startDate = date;
        _endDate = date.subtract(const Duration(days: 29));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 17 – Date Picker')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton.icon(
                onPressed: _pickStartDate,
                icon: const Icon(Icons.calendar_today),
                label: const Text('Select start date'),
              ),
              const SizedBox(height: 24),
              if (_startDate != null) ...[
                Text('Start date: ${_startDate!.toString().split(' ').first}'),
                const SizedBox(height: 8),
                Text('End date (29 days ago): ${_endDate!.toString().split(' ').first}'),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
