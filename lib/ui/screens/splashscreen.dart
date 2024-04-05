// ignore: file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jmobility_riders/ui/utils/colors.dart';
import 'package:jmobility_riders/ui/screens/onboardscreen.dart';

class SplashScreenBloc {
  final StreamController<bool> _navigateToOnboardController =
      StreamController<bool>();

  Stream<bool> get navigateToOnboardStream =>
      _navigateToOnboardController.stream;

  SplashScreenBloc() {
    Future.delayed(const Duration(seconds: 3), () {
      _navigateToOnboardController.add(true);
    });
  }

  void dispose() {
    _navigateToOnboardController.close();
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenBloc _bloc = SplashScreenBloc();
  final AppColors _appColors = AppColors();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<bool>(
        stream: _bloc.navigateToOnboardStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return const OnboardScreen();
          } else {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnboardScreen(),
                  ),
                );
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Background image
                  Image.asset(
                    'assets/images/iStock-1479428658 1.jpg',
                    fit: BoxFit.cover,
                  ),
                  // Foreground image overlaid on top of background
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/jaguarPetroleumLogo-removebg-preview 1.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OnboardScreen(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: _appColors.colorPrimary,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 15,
                              ),
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            child: const Text('Let\'s Get Started'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
