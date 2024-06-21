import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/main_view/screens/activities_screen.dart';
import 'package:task/global/bloc_providers/bloc_providers.dart';
import 'package:task/global/methods_helpers_functions/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.providers,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Palm Task',
        home: ActivitiesScreen(),
      ),
    );
  }
}
