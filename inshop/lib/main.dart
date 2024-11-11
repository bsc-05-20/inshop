import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:inshop/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://awwjjwinvonirpxcqvpx.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF3d2pqd2ludm9uaXJweGNxdnB4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc3ODQzNTcsImV4cCI6MjA0MzM2MDM1N30.z-XSsq6agjR-HY1zmYOmIHTy8abFk3YlUkI1vUyZttw',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),  // Set HomeScreen as the home widget
    );
  }
}
