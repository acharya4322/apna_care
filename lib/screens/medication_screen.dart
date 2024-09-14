import 'package:flutter/material.dart';
import 'package:apna_care/widgets/medication_card.dart'; // Import the MedicationCard widget

class MedicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medications'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Medication List
            Text(
              'Current Medications',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  MedicationCard(
                    medicationName: 'Paracetamol',
                    dosage: '500mg',
                    time: '8:00 AM',
                  ),
                  MedicationCard(
                    medicationName: 'Ibuprofen',
                    dosage: '400mg',
                    time: '12:00 PM',
                  ),
                  MedicationCard(
                    medicationName: 'Vitamin D',
                    dosage: '1000 IU',
                    time: '6:00 PM',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
