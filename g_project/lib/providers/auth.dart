import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  late String _token;
  late DateTime? _expiryDate = null;
  late String _userId;
  late Timer? _authTimer = null;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    // For signup => 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBZZb0kCWdQWZXTZvp9ho9WMTzPj2RngYg'
    // For login  => 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBZZb0kCWdQWZXTZvp9ho9WMTzPj2RngYg'

    // For signup => 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=[API_KEY]'
    // For login  => 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=[API_KEY]'
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyCMphrtFJpu8Xj9uooJKiAfRLvDUNYzjgQ');

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      print(json.decode(response.body)); // For debug console...
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken']; // Get the id token...
      _userId = responseData['localId']; // Get the user id
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      _autoLogout(); // Called autoLog() method here..
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }

  void logout() {
    _token = '';
    _userId = '';
    _expiryDate = null;

    if (_authTimer != null) {
      _authTimer?.cancel();
      _authTimer = null;
    }
    notifyListeners();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer?.cancel();
    }
    final timeToExpiry = _expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
    //_authTimer =
    //    Timer(Duration(seconds: 8), logout); // Use for testing only (set as 8 seconds)
  }
}