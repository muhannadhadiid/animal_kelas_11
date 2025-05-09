import 'package:auth_supabase/auth_service.dart';
import 'package:auth_supabase/pages/profile_page.dart';
import 'package:auth_supabase/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authService = AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      await authService.signInWithPassword(email, password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    } catch (e) {
      print(e);

      if (email.isEmpty || password.isEmpty) {
        print('Email atau password tidak boleh kosong');
      }

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Username dan password salah")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login page")),
      body: ListView(
        children: [
          TextField(
            controller: emailController,

            decoration: InputDecoration(labelText: "Masukkan Email"),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: "Masukkan password"),
          ),

          ElevatedButton(onPressed: login, child: Text("Login sekarang")),
          GestureDetector(
            child: Text("Belumm punya akun ? Daftar sekarang"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RegisterPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
