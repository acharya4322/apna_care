import 'package:flutter/material.dart';

class ReminderTile extends StatelessWidget {
  final String time;
  final String medication;
  final bool isMissed;

  const ReminderTile({
    Key? key,
    required this.time,
    required this.medication,
    this.isMissed = false,
    required bool isCompleted, // Default value for isMissed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        isMissed ? Icons.error : Icons.check_circle,
        color: isMissed ? Colors.red : Colors.green,
      ),
      title: Text(
        medication,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        'Time: $time',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: isMissed
          ? IconButton(
              icon: Icon(Icons.replay),
              onPressed: () {
                // Reschedule action
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Reminder Rescheduled!')),
                );
              },
            )
          : null,
    );
  }
}
