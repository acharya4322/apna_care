import 'package:apna_care/screens/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:apna_care/screens/home_screen.dart';
import 'package:apna_care/screens/reminders_screen.dart';
import 'package:apna_care/screens/reminder_detail_screen.dart';
import 'package:apna_care/screens/analytics_screen.dart'; // Import the AnalyticsScreen
import 'package:apna_care/screens/book_appointment_screen.dart'; // Import the BookAppointmentScreen
// Import the ProfileScreen
import 'package:apna_care/screens/notification_screen.dart'; // Import the NotificationScreen

class AppRoutes {
  static const String home = '/';
  static const String reminders = '/reminders';
  static const String reminderDetail = '/reminderDetail';
  static const String analytics = '/analytics'; // Route for AnalyticsScreen
  static const String bookAppointment =
      '/bookAppointment'; // Route for BookAppointmentScreen
  static const String profile = '/profile'; // Route for ProfileScreen
  static const String notifications =
      '/notifications'; // Route for NotificationScreen

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case reminders:
        return MaterialPageRoute(builder: (_) => RemindersScreen());
      case reminderDetail:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ReminderDetailScreen(
            time: args['time'],
            medication: args['medication'],
            dosage: args['dosage'],
            isMissed: args['isMissed'],
          ),
        );
      case analytics:
        return MaterialPageRoute(builder: (_) => AnalyticsScreen());
      case bookAppointment:
        return MaterialPageRoute(
            builder: (_) =>
                BookAppointmentScreen()); // Route for BookAppointmentScreen
      case profile:
        return MaterialPageRoute(
            builder: (_) => ProfileScreen()); // Route for ProfileScreen
      case notifications:
        return MaterialPageRoute(
            builder: (_) =>
                NotificationScreen()); // Route for NotificationScreen
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
