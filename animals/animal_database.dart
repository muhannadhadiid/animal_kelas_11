import 'package:auth_supabase/animals/animal.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AnimalDatabase {
  final supabase = Supabase.instance.client;
  final stream =
      Supabase.instance.client
          .from("animal")
          .stream(primaryKey: ["id"])
          .map((event) => event.map((e) => animal.fromMap(e)))
          .toList();
}
