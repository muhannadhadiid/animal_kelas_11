import 'package:auth_supabase/auth_service.dart';
import 'package:auth_supabase/pages/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final authSupabaseService = AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmasiController = TextEditingController();

  void signup() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final konfirmasi = confirmasiController.text.trim();

    if (password != konfirmasi) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Password tidak sama")));
      return;
    }

    try {
      await authSupabaseService.SignUpWithEmail(email, password);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registrasi berhasil, silakan login")),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Page")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        children: [
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: "Email"),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: "Password"),
          ),
          TextField(
            controller: confirmasiController,
            obscureText: true,
            decoration: const InputDecoration(labelText: "Konfirmasi Password"),
          ),
          SizedBox(height: 15),
          ElevatedButton(onPressed: signup, child: Text("Register sekarang")),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Center(
              child: Text(
                "Sudah punya akun? Login sekarang",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
