import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  String? _email;
  String? _error;

  bool get isAuthenticated => _isAuthenticated;
  String? get email => _email;
  String? get error => _error;

  Future<bool> login(String email, String password) async {
    try {
      // TODO: Implement actual authentication logic here
      // For now, we'll just simulate a login
      if (email.isNotEmpty && password.isNotEmpty) {
        _isAuthenticated = true;
        _email = email;
        _error = null;
        notifyListeners();
        return true;
      } else {
        _error = 'Email and password cannot be empty';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  void logout() {
    _isAuthenticated = false;
    _email = null;
    _error = null;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
} 