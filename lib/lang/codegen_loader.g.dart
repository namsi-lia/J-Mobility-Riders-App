// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "splash-screen": {
    "title": "Welcome To J-MOBILITY",
    "descriprion": "Whether you are sending or recieving parcels,our app makes the process seamless",
    "splash-Button": "Lets Get Strated"
  },
  "OnBoarding-screen-01": {
    "image": "J-Mobility-Riders-App/assets/lang/images/undraw_order_delivered_re_v4ab 1.png",
    "title": "Get Started With J-Mobility",
    "description": "Sign up  hassle-free with J-Mobility.Simply enter your phone  number,recieve an otp to verify,provide your name and email, and set a secure password to get started.Your Information is Kept safe and secure",
    "Onboard-Button": "Next"
  },
  "onBoarding-screen-02": {
    "image": "J-Mobility-Riders-App/assets/lang/images/undraw_order_delivered_re_v4ab 1.png",
    "title": "Ordering Process",
    "description": "Ordering with J-Mobility is quick and straightforward.Choose your desired service,whether its sending or recieving parcels.Input pickup and devlivery details,review summary,select your payment mode,and voila!Your order is on its way with our trusted riders",
    "Button": "Next"
  },
  "onBoarding-screen-03": {
    "image": "J-Mobility-Riders-App/assets/lang/images/undraw_order_delivered_re_v4ab 1.png",
    "title": "Swift and Reliable Deliveries",
    "description": "With J-Mobility,your deliveries are in safe hands.Our dedicated rides=rs ensure prompt and reliable servivce,so yor parcels reach their destination on time,everytimem. Experience the convenience of timely deliveries with J-Mobility",
    "Button": "Next"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
