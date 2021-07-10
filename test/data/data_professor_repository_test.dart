import 'package:ecole_prof/data/repositories/professor/data_professor_repository.dart';
import 'package:ecole_prof/domain/entities/professor/professor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'data_professor_repository_test.mocks.dart';

 

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {

   test('first connexion', () {
    final client = MockClient();
    final dataParent = DataProfessorRepository();
    dynamic authority = "backend-ecole-yapi.herokuapp.com";
    dynamic route = "api/v1/auth/login";
    dynamic body = {
      "email": "Evaris@gmail.com",
      "password": "bizim12345",
      "type": "PROFESSOR"
    };
    String myResponse = """{
                        "statusCode": 403,
                        "message": "PREMIERE_CONNEXION",
                        "error": "2"
                        }""";
    // Use Mockito to return a successful response when it calls the
    // provided http.Client.
    when(client.post(Uri.https(authority, route, body)))
        .thenAnswer((_) async => http.Response(myResponse, 403));

    expect(dataParent.login(' Evaris@gmail.com', 'bizim12345'), Throws());
  });

  test('returns a Professor', () async {
    final client = MockClient();
    final dataParent = DataProfessorRepository();
    dynamic authority = "backend-ecole-yapi.herokuapp.com";
    dynamic route = "api/v1/auth/login";
    dynamic body = {
      "email": "didier@gmail.com",
      "password": "243567",
      "type": "PROFESSOR"
    };
    String myResponse =
        """{
  "user": {
    "email": "didier@gmail.com",
    "type": "PROFESSOR",
    "id": 1,
    "Nom": "Kone",
    "prenom": "Didier",
    "addresse": "Bp220",
    "tel": "0807444444",
    "picture": "image.jpeg",
    "first_connection": false
  },
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbiI6ImRpZGllckBnbWFpbC5jb20iLCJwd2QiOiIyNDM1NjciLCJpYXQiOjE2MjU5MTE1MDgsImV4cCI6MTYyNTkxMTU2OH0.ca9VM9960h_z02XRd6zVDLiAr2VzhBHEo1TwpQBB-LM"
}""";
    // Use Mockito to return a successful response when it calls the
    // provided http.Client.
    when(client.post(Uri.https(authority, route, body)))
        .thenAnswer((_) async => http.Response(myResponse, 200));

    expect(await dataParent.login('didier@gmail.com', '243567'),
        isA<Professor>());
  });
}