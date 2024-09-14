import 'package:flutter/material.dart';
import 'package:apna_care/widgets/reminder_tile.dart'; // Import the ReminderTile widget

class RemindersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminders'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 810,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Summary Information
                _buildSummarySection(),
                SizedBox(height: 16),

                // Upcoming Reminders Section
                _buildRemindersSection(
                  context,
                  title: 'Upcoming Reminders',
                  reminders: const [
                    ReminderTile(
                      time: '8:00 AM',
                      medication: 'Paracetamol',
                      isMissed: false,
                      isCompleted: false,
                    ),
                    ReminderTile(
                      time: '12:00 PM',
                      medication: 'Ibuprofen',
                      isMissed: false,
                      isCompleted: false,
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Missed Reminders Section
                _buildRemindersSection(
                  context,
                  title: 'Missed Reminders',
                  reminders: const [
                    ReminderTile(
                      time: '6:00 PM',
                      medication: 'Vitamin D',
                      isMissed: true,
                      isCompleted: false,
                    ),
                    ReminderTile(
                      time: '9:00 PM',
                      medication: 'Calcium',
                      isMissed: true,
                      isCompleted: false,
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Completed Reminders Section
                _buildRemindersSection(
                  context,
                  title: 'Completed Reminders',
                  reminders: const [
                    ReminderTile(
                      time: '7:00 AM',
                      medication: 'Aspirin',
                      isMissed: false,
                      isCompleted: true,
                    ),
                    ReminderTile(
                      time: '11:00 AM',
                      medication: 'Metformin',
                      isMissed: false,
                      isCompleted: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to add a new reminder
          Navigator.pushNamed(context, '/addReminder');
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
      ),
    );
  }

  // Summary Section Widget
  Widget _buildSummarySection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reminder Summary',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSummaryItem('Upcoming', 2),
              _buildSummaryItem('Missed', 2),
              _buildSummaryItem('Completed', 2),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build summary item
  Widget _buildSummaryItem(String label, int count) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  // Reminders Section Widget
  Widget _buildRemindersSection(BuildContext context,
      {required String title, required List<ReminderTile> reminders}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: reminders.map((reminder) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: reminder,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
