import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class OnBoarding {
  final String image, title, description;
  OnBoarding({
    required this.image,
    required this.title,
    required this.description,
  });

  factory OnBoarding.fromJson(Map<String, dynamic> json) {
    return OnBoarding(
      image: json['image'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }
}

class OnboardingBloc {
  late Future<List<OnBoarding>> onboardingData;

  OnboardingBloc() {
    onboardingData = loadOnboardingData();
  }

  Future<List<OnBoarding>> loadOnboardingData() async {
    final String jsonString =
        await rootBundle.loadString('assets/lang/en.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((item) => OnBoarding.fromJson(item)).toList();
  }
}

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  Timer? _timer;
  late OnboardingBloc _bloc;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
    _bloc = OnboardingBloc();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      setState(() {
        if (_pageIndex < 2) {
          _pageIndex++;
        } else {
          _pageIndex = 0;
        }
        _pageController.animateToPage(_pageIndex,
            duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<OnBoarding>>(
        future: _bloc.onboardingData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading data'));
          } else {
            final onboardingList = snapshot.data!;
            return PageView.builder(
              controller: _pageController,
              itemCount: onboardingList.length,
              itemBuilder: (context, index) {
                final onboardingItem = onboardingList[index];
                return OnboardingPage(
                  onboardingItem: onboardingItem,
                  onPageChanged: (pageIndex) {
                    setState(() {
                      _pageIndex = pageIndex;
                    });
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnBoarding onboardingItem;
  final ValueChanged<int> onPageChanged;

  const OnboardingPage({
    super.key,
    required this.onboardingItem,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(onboardingItem.image),
        const SizedBox(height: 20),
        Text(
          onboardingItem.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            onboardingItem.description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(height: 40),
        OutlinedButton(
          onPressed: () {
            onPageChanged(0); // Navigate to the next page
          },
          child: const Text('Registration'),
        ),
      ],
    );
  }
}
