import 'package:flutter/material.dart';
import 'companyRegister.dart';
import '../l10n/app_localizations.dart';
import 'adsServices.dart'; // Import your existing adsServices.dart file

class TypeSelectionLoginScreen extends StatefulWidget {
  const TypeSelectionLoginScreen({super.key});

  @override
  State<TypeSelectionLoginScreen> createState() => _TypeSelectionLoginScreenState();
}

class _TypeSelectionLoginScreenState extends State<TypeSelectionLoginScreen> {
  bool _isPasswordVisible = false;
  final TextEditingController _emailOrUsernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 117, 51, 232),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset(
              'assets/images/logo1.png',
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Text(
              localizations.appTitle,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              localizations.appSubtitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        localizations.companyLogin, // Using localization
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      
                      // Email OR Username Field
                      Text(
                        localizations.emailOrUsername, // Using localization
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: TextField(
                          controller: _emailOrUsernameController,
                          decoration: InputDecoration(
                            hintText: localizations.emailOrUsernameHint, // Using localization
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Colors.grey[600],
                            ),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Password
                      Text(
                        localizations.password,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: localizations.passwordHint,
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.grey[600],
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                color: Colors.grey[600],
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          obscureText: !_isPasswordVisible,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Forgot password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            _showForgotPasswordDialog(context);
                          },
                          child: Text(
                            localizations.forgotPassword,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 117, 51, 232),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            _login();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 117, 51, 232),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                          ),
                          child: Text(
                            localizations.submit,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Don't have account question
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          localizations.noAccountQuestion,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Create Account Button
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const CreateCompanySortlistStyle(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color.fromARGB(255, 117, 51, 232),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                color: Color.fromARGB(255, 117, 51, 232),
                                width: 2,
                              ),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            localizations.createAccount,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() {
  final emailOrUsername = _emailOrUsernameController.text.trim();
  final password = _passwordController.text.trim();
  
  // Get localizations from the current context
  final localizations = AppLocalizations.of(context)!;

  if (emailOrUsername.isEmpty || password.isEmpty) {
    _showErrorDialog(localizations.fillAllFields);
    return;
  }

  // Check for specific credentials: user1234 and 1234
  if (emailOrUsername == 'user1234' && password == '1234') {
    // Navigate to your PricingScreen from adsServices.dart
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const PricingScreen(), // This is the class name in your adsServices.dart file
      ),
    );
  } else {
    // Show error for invalid credentials
    _showErrorDialog(localizations.invalidEmailOrUsername);
  }
}

  void _showForgotPasswordDialog(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String emailOrUsername = '';
        return AlertDialog(
          title: Text(localizations.forgotPassword),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(localizations.enterEmailResetPassword),
              const SizedBox(height: 15),
              TextField(
                onChanged: (value) => emailOrUsername = value,
                decoration: InputDecoration(
                  hintText: localizations.emailOrUsername,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(localizations.cancel),
            ),
            TextButton(
              onPressed: () {
                if (emailOrUsername.isNotEmpty) {
                  Navigator.of(context).pop();
                  _showSuccessDialog(localizations.instructionsSent);
                } else {
                  _showErrorDialog(localizations.enterValidEmailForReset);
                }
              },
              child: Text(localizations.send),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    final localizations = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations.error),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(localizations.ok),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(String message) {
    final localizations = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations.success),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(localizations.ok),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _emailOrUsernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}