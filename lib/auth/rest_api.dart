// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:modern/main.dart';

// final uri = Uri.parse('$url/user/login');

// Future userLogin(String email, String password) async {
//   final response = await http.post(uri,
//       headers: {"accept": "application/json"},
//       body: {'email': email, 'password': password});

//   if (response.statusCode == 200) {
//     var decodedData = jsonDecode(response.body);
//     return decodedData;
//   } else {
//     throw Exception('Failed to login');
//   }
// }


// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:modern/main.dart';
// final uri = Uri.parse(url);

// Future userLogin(String email, String password) async {
//   final uri = Uri.parse('$url/user/login');
//   final response = await http.post(uri,
//       headers: {"accept": "application/json"},
//       body: {'email': email, 'password': password});

//   var decodedData = jsonDecode(response.body);
//   return decodedData;
// }




// final uri = Uri.parse(url);
// final headers = {
//   'Contact-Type': 'application/json',
// };

// class userLogin {
//   late final String email;
//   late final String password;
//   userLogin(this.email, this.password);
//   Map<String, dynamic>? toJson() {
//     return {
//       'email': email,
//       'password': password,
//     };
//   }
// }

// login(String email, String password) async {
//   final uri = Uri.parse('$url/user/login');
//   final user = userLogin(email, password);
//   final JsonString = jsonEncode(user.toJson());
//   try {
//     final response = await http.post(uri, headers: headers, body: JsonString);
//     if (response.statusCode == 200) {
//       var responseJson = json.decode(response.body);
//       getIt
//           .get<SharedPreferences>()
//           .setString('token', '${responseJson['token']}');
//     }
//   } catch (e) {}
// }
