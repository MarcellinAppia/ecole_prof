import 'package:ecole_prof/domain/entities/professor/professor.dart';

abstract class ProfessorRepository{
    Future<Professor> login(String email, String password);
    Future<String> updatePassword(String password);
}