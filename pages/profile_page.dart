import 'package:auth_supabase/auth_service.dart';
import 'package:auth_supabase/pages/animal_page.dart';
import 'package:auth_supabase/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final authservice = AuthService();
  void logout() async {
    await authservice.SignOut();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = authservice.getUserEmail();
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
      ),
      body: Center(
        child: Column(
          children: [
            Text(currentUser.toString()),
            ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnimalPage()),
                  ),
              child: Text("produck"),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
