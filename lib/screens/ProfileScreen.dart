import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 800,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Picture
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundImage:
                            AssetImage('assets/profile_placeholder.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: -10,
                        child: IconButton(
                          icon: Icon(Icons.edit, color: Colors.white, size: 30),
                          onPressed: () {
                            // Handle profile picture change
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),

                // Profile Details
                Center(
                  child: Text(
                    'Aditi Sharma',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'aditi@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Bio Section
                Text(
                  'Bio',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'A passionate healthcare professional with a strong background in medication management and patient care. Committed to improving health outcomes and providing exceptional care.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 24),

                // Contact Information
                Text(
                  'Contact Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 12),
                _buildContactInfo('Phone', '+1 234 567 890'),
                _buildContactInfo('Address', '123 Main Street, Anytown, USA'),
                SizedBox(height: 24),

                // Social Media Links
                Text(
                  'Social Media',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 12),
                _buildSocialMediaLinks(),
                SizedBox(height: 24),

                // Recent Activities Section
                Text(
                  'Recent Activities',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 12),
                _buildRecentActivities(),

                // Edit and Save Buttons
                SizedBox(height: 24),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle edit profile
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          textStyle: TextStyle(fontSize: 16),
                        ),
                        child: Text('Edit Profile'),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Handle save changes
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          textStyle: TextStyle(fontSize: 16),
                        ),
                        child: Text('Save Changes'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build contact info
  Widget _buildContactInfo(String label, String info) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '$label:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(
              info,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build social media links
  Widget _buildSocialMediaLinks() {
    return Column(
      children: [
        _buildSocialMediaLink(
          icon: Icons.facebook,
          label: 'Facebook',
          url: 'https://facebook.com/johndoe',
        ),
        _buildSocialMediaLink(
          icon: Icons.tag,
          label: 'Twitter',
          url: 'https://twitter.com/johndoe',
        ),
        _buildSocialMediaLink(
          icon: Icons.tag,
          label: 'LinkedIn',
          url: 'https://linkedin.com/in/johndoe',
        ),
      ],
    );
  }

  // Helper method to build individual social media link
  Widget _buildSocialMediaLink({
    required IconData icon,
    required String label,
    required String url,
  }) {
    return ListTile(
      leading: Icon(icon, size: 30),
      title: Text(
        label,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 20),
      onTap: () {
        // Handle navigation to social media link
      },
    );
  }

  // Helper method to build recent activities
  Widget _buildRecentActivities() {
    return Column(
      children: [
        _buildRecentActivityItem(
          title: 'Medication Updated',
          description: 'Updated dosage for Paracetamol.',
          date: '2024-09-14',
        ),
        _buildRecentActivityItem(
          title: 'Profile Updated',
          description: 'Changed profile picture and contact info.',
          date: '2024-09-13',
        ),
      ],
    );
  }

  // Helper method to build individual recent activity item
  Widget _buildRecentActivityItem({
    required String title,
    required String description,
    required String date,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(description),
            SizedBox(height: 8),
            Text(
              date,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
