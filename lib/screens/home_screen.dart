import 'package:apna_care/sos.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apna Care'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Welcome Section
            _buildWelcomeSection(),
            SizedBox(height: 24),

            // Navigation Buttons
            _buildNavigationButtons(context),
            SizedBox(height: 24),

            // Recent Activities Section
            _buildRecentActivitiesSection(context),
            SizedBox(height: 24),

            // Important Announcements Section
            _buildAnnouncementsSection(),
            SizedBox(height: 24),

            // Upcoming Events Section
            _buildUpcomingEventsSection(),
            SizedBox(height: 24),

            // Medical Facilities Section
            _buildMedicalFacilitiesSection(),
            SizedBox(height: 24),

            // Footer
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  // Welcome Section Widget
  Widget _buildWelcomeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to Apna Care!',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Manage your medication schedules, view analytics, and stay on top of your health goals.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  // Navigation Buttons Widget
  Widget _buildNavigationButtons(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavigationButton(
              context,
              label: 'View Reminders',
              color: Colors.blue,
              routeName: '/reminders',
            ),
            _buildNavigationButton(
              context,
              label: 'View Analytics',
              color: Colors.green,
              routeName: '/analytics',
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 290,
          child: _buildNavigationButton(
            context,
            label: 'Book Appointment',
            color: Colors.orange,
            routeName: '/bookAppointment',
          ),
        ),
      ],
    );
  }

  // Helper method to build navigation button
  Widget _buildNavigationButton(
    BuildContext context, {
    required String label,
    required Color color,
    required String routeName,
  }) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: TextStyle(fontSize: 14),
      ),
      child: Text(label),
    );
  }

  // Recent Activities Section Widget
  Widget _buildRecentActivitiesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Activities',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 12),
        Container(
          height: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildRecentActivityCard(
                context,
                title: 'Medication Taken',
                subtitle: 'Paracetamol 500mg\nat 8:00 AM',
                icon: Icons.check_circle,
                color: Colors.green,
              ),
              SizedBox(width: 12),
              _buildRecentActivityCard(
                context,
                title: 'Reminder Missed',
                subtitle: 'Vitamin D\nat 6:00 PM',
                icon: Icons.cancel,
                color: Colors.red,
              ),
              SizedBox(width: 12),
              _buildRecentActivityCard(
                context,
                title: 'Upcoming Dose',
                subtitle: 'Ibuprofen 400mg\nat 12:00 PM',
                icon: Icons.access_time,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Announcements Section Widget
  Widget _buildAnnouncementsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Important Announcements',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.yellow[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.yellow[300]!),
          ),
          child: Text(
            'Don\'t forget to update your medication schedule for the upcoming flu season. Check the Reminders section for more details.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  // Upcoming Events Section Widget
  Widget _buildUpcomingEventsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upcoming Events',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 12),
        Container(
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
                'Health Check-up Camp',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Date: September 25, 2024\nLocation: Community Center\nTime: 10:00 AM - 2:00 PM',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Medical Facilities Section Widget
  Widget _buildMedicalFacilitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Medical Facilities',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.orange[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.orange[300]!),
          ),
          child: Text(
            'Here is a list of nearby medical facilities:\n\n- City Hospital\n- HealthCare Clinic\n- Wellness Center\n- Urgent Care Facility',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  // Footer Widget
  Widget _buildFooter() {
    return CampusSafety();
  }

  // Helper method to build individual activity cards
  Widget _buildRecentActivityCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 200,
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(subtitle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
