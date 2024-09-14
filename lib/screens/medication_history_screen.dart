import 'package:flutter/material.dart';
import 'package:apna_care/widgets/medication_card.dart'; // Import the MedicationCard widget

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medication History'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Section: Historical Medications
            Text(
              'Past Medications',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge, // Updated text theme property
            ),
            SizedBox(height: 10),
            _buildHistoricalMedicationsList(context),
          ],
        ),
      ),
    );
  }

  // Widget for historical medication list
  Widget _buildHistoricalMedicationsList(BuildContext context) {
    return Column(
      children: [
        MedicationCard(
          medicationName: 'Paracetamol',
          dosage: '500mg',
          time: 'Yesterday, 8:00 AM',
        ),
        MedicationCard(
          medicationName: 'Ibuprofen',
          dosage: '400mg',
          time: 'Yesterday, 12:00 PM',
        ),
        MedicationCard(
          medicationName: 'Vitamin D',
          dosage: '1000 IU',
          time: 'Day Before Yesterday, 6:00 PM',
        ),
      ],
    );
  }
}
