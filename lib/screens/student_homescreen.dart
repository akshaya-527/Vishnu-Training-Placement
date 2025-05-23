import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:vishnu_training_and_placements/routes/app_routes.dart';
import 'package:vishnu_training_and_placements/screens/student_schedule_screen.dart';
import 'package:vishnu_training_and_placements/utils/app_constants.dart';
import 'package:vishnu_training_and_placements/widgets/screens_background.dart';
import 'package:vishnu_training_and_placements/widgets/custom_appbar.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Get the screen size, height, and width
    final Size screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;
    return Scaffold(
      backgroundColor: AppConstants.textBlack,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(), // Dark theme background
      body: Stack(
        children: [
          // Background with elliptical containers
          ScreensBackground(height: height, width: width),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          'Hello..!!',
                          style: TextStyle(
                            fontSize: 28,
                            color: AppConstants.textWhite,
                            fontFamily: 'Alata',
                          ),
                        ),
                        Text(
                          'Name of Student',
                          style: TextStyle(
                            fontSize: 28,
                            color: AppConstants.textWhite,
                            fontFamily: 'Alata',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround, // Center the cards
                    children: [
                      GestureDetector(
                        child: CustomCard(
                          text: 'Mark Your\nAttendance',
                          style: TextStyle(fontSize: 300, fontFamily: 'Alata'),
                          image: 'assets/attendance.png',
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      StudentSchedulesScreen(enabled: true),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                      GestureDetector(
                        child: CustomCard(
                          text: 'Your Schedules',
                          style: TextStyle(fontSize: 70, fontFamily: 'Alata'),
                          image: 'assets/calendar.png',
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.studentScheduleScreen,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String text;
  final String? image;

  const CustomCard({
    super.key,
    required this.text,
    this.image,
    required TextStyle style,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.center, // Placed in the middle of the screen
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blurred effect
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9, // Increased width
            height:
                MediaQuery.of(context).size.height * 0.22, // Increased height
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.13), // More transparency
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
              ), // Optional border
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: AppConstants.textWhite,
                    fontSize: 25,
                  ),
                ),
                if (image != null)
                  Image.asset(
                    image!,
                    height: screenHeight * 0.30,
                    width: screenWidth * 0.3,
                  ), // Displays image if available
              ],
            ),
          ),
        ),
      ),
    );
  }
}
