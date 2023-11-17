import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_tracking/shared/locator.dart';
import 'package:order_tracking/view/order_status_view.dart';
import 'package:order_tracking/view/sign_in_view.dart';
import 'package:order_tracking/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await locatorSetUp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StatusViewModel()),
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Order Tracking',
          theme: ThemeData(
            fontFamily: "Mulish",
            visualDensity: VisualDensity.adaptivePlatformDensity,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SignInView()),
    );
  }
}
