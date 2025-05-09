import 'package:auth_supabase/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxra21icnJlcG95bHhteWJ4ZXhmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU1NDM0OTQsImV4cCI6MjA2MTExOTQ5NH0.JGYhUl5YJIIUxcKNT50bVbZ80QChlvlTzFYlE8NBSQM",
    url: "https://lkkmbrrepoylxmybxexf.supabase.co",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}
