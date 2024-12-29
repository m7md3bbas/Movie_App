import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';
import 'package:movieapp/bloc_observer.dart';
import 'package:movieapp/core/functions/my_routes.dart';
import 'package:movieapp/core/theme/theme_provider.dart';
import 'package:movieapp/features/auth/presentation/manager/binding/auth_binding.dart';
import 'package:movieapp/splash_screen.dart';
import 'package:movieapp/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bloc.Bloc.observer = MyBlocObserver();

  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) => const MovieApp()));
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: MyRoutes.myroutes,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialBinding: AuthBinding(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
