import 'package:flutter/material.dart';

class MedicationCard extends StatelessWidget {
  final String medicationName;
  final String dosage;
  final String time;

  const MedicationCard({
    Key? key,
    required this.medicationName,
    required this.dosage,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Medication details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medicationName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 8),
                Text(
                  'Dosage: $dosage',
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Time: $time',
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),

            // Action button to mark as taken
            ElevatedButton(
              onPressed: () {
                // Mark the medication as taken (can trigger further actions later)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Marked as Taken!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Taken'),
            ),
          ],
        ),
      ),
    );
  }
}
