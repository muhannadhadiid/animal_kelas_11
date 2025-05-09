import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  Future<AuthResponse> signInWithPassword(String email, String password) async {
    return await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> SignUpWithEmail(String email, String password) async {
    return await supabase.auth.signUp(email: email, password: password);
  }

  Future<void> SignOut() async {
    await supabase.auth.signOut();
  }

  String? getUserEmail() {
    final session = supabase.auth.currentSession;
    final user = session?.user;

    return user?.email;
  }
}
