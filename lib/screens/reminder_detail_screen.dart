import 'package:flutter/material.dart';

class ReminderDetailScreen extends StatelessWidget {
  final String time;
  final String medication;
  final String dosage;
  final bool isMissed;

  const ReminderDetailScreen({
    Key? key,
    required this.time,
    required this.medication,
    required this.dosage,
    this.isMissed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminder Details'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Medication Information
            Text(
              medication,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 8),
            Text(
              'Dosage: $dosage',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
            ),
            SizedBox(height: 8),
            Text(
              'Time: $time',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
            ),
            SizedBox(height: 20),

            // Notes Section
            Text(
              'Notes:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Add any notes...',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
              minLines: 2,
            ),
            SizedBox(height: 20),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Mark reminder as completed
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Marked as Completed!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Button color
                  ),
                  child: Text('Mark as Completed'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Reschedule reminder
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Rescheduled!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color
                  ),
                  child: Text('Reschedule'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
