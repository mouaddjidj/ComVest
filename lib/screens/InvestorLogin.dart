import 'package:flutter/material.dart';
import 'investorRegister.dart';
import 'investor_dashboard.dart'; // Import the dashboard
import '../l10n/app_localizations.dart';
import '../widgets/models.dart'; // Import models for Investor class

class InvestorLoginScreen extends StatefulWidget {
  const InvestorLoginScreen({super.key});

  @override
  State<InvestorLoginScreen> createState() => _InvestorLoginScreenState();
}

class _InvestorLoginScreenState extends State<InvestorLoginScreen> {
  bool _isPasswordVisible = false;
  final TextEditingController _emailOrUsernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 117, 51, 232),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Logo
            Image.asset(
              'assets/images/logo1.png',
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            // App Name
            Text(
              localizations?.appTitle ?? 'ComVest',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 10),
            // Subtitle
            Text(
              localizations?.appSubtitle ?? 'COMMUNICATION + INVESTMENT',
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
                        localizations?.investorLogin ?? 'Investor Login',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      
                      // Email or Username Field
                      Text(
                        localizations?.emailOrUsername ?? 'Email or Username',
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
                            hintText: localizations?.emailOrUsernameHint ?? 'Enter email or username',
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Colors.grey[600],
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      // Password Field
                      Text(
                        localizations?.password ?? 'Password',
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
                            hintText: localizations?.passwordHint ?? 'Enter your password',
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
                      
                      // Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            _showForgotPasswordDialog(context);
                          },
                          child: Text(
                            localizations?.forgotPassword ?? 'Forgot Password?',
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
                            _login(context);
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
                            localizations?.login ?? 'Login',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 40),

                      // BIG VISIBLE "CRÉER UN COMPTE" BUTTON - PURPLE TEXT VERSION
                      Container(
                        width: double.infinity,
                        height: 65,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 117, 51, 232),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const CreateInvestorAccount(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color.fromARGB(255, 117, 51, 232),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            localizations?.createAccount ?? 'Créer un nouveau compte',
                            style: const TextStyle(
                              fontSize: 20,
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

  void _login(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final emailOrUsername = _emailOrUsernameController.text.trim();
    final password = _passwordController.text.trim();
    
    if (emailOrUsername.isEmpty || password.isEmpty) {
      _showErrorDialog(context, localizations?.fillAllFields ?? 'Please fill in all fields');
      return;
    }
    
    // Check if input is email or username
    final isEmail = _isValidEmail(emailOrUsername);
    final isUsername = !isEmail && _isValidUsername(emailOrUsername);
    
    if (!isEmail && !isUsername) {
      _showErrorDialog(
        context, 
        localizations?.invalidEmailOrUsername ?? 'Please enter a valid email or username'
      );
      return;
    }
    
    // Hardcoded login check for "user1234" and "1234"
    if ((emailOrUsername == 'user1234') && (password == '1234')) {
      print('Login successful! Navigating to investor dashboard...');
      
      try {
        // Create Investor object - ADJUST THIS BASED ON YOUR ACTUAL Investor MODEL
        // You need to check your models.dart file for the exact constructor
        final investor = Investor(
          id: '1',
          firstName: 'Test',
          lastName: 'User',
          email: 'user1234@example.com', username: '', password: '',
          // Add other fields based on your actual Investor model
          // Check your models.dart file for the exact field names
        );
        
        // Clear the text fields
        _emailOrUsernameController.clear();
        _passwordController.clear();
        
        // Navigate to investor dashboard
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => InvestorDashboard(investor: investor),
          ),
          (route) => false,
        );
      } catch (e) {
        print('Error: $e');
        // If Investor creation fails, try with minimal data or show error
        _showErrorDialog(
          context, 
          'Login successful but could not create profile. Check Investor model.'
        );
      }
      
    } else {
      // Failed login attempt - FIXED: Use direct string instead of invalidCredentials
      print('Login failed for: $emailOrUsername');
      _showErrorDialog(
        context, 
        'Invalid username or password. Please try again.' // Direct string instead of localization
      );
    }
  }

  void _showForgotPasswordDialog(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations?.forgotPassword ?? 'Forgot Password'),
          content: Text(localizations?.enterEmailResetPassword ?? 'Enter your email to reset your password'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(localizations?.cancel ?? 'Cancel'),
            ),
            TextButton(
              onPressed: () {
                final email = _emailOrUsernameController.text.trim();
                if (email.isEmpty || !_isValidEmail(email)) {
                  _showErrorDialog(
                    context, 
                    localizations?.enterValidEmailForReset ?? 'Please enter a valid email address for password reset'
                  );
                  return;
                }
                
                Navigator.of(context).pop();
                _showSuccessDialog(
                  context, 
                  localizations?.instructionsSent ?? 'Instructions have been sent to your email'
                );
              },
              child: Text(localizations?.send ?? 'Send'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    final localizations = AppLocalizations.of(context);
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations?.error ?? 'Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(localizations?.ok ?? 'OK'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context, String message) {
    final localizations = AppLocalizations.of(context);
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations?.success ?? 'Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(localizations?.ok ?? 'OK'),
            ),
          ],
        );
      },
    );
  }

  // Helper method to validate email
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  // Helper method to validate username
  bool _isValidUsername(String username) {
    final usernameRegex = RegExp(r'^[a-zA-Z0-9_-]{3,20}$');
    return usernameRegex.hasMatch(username);
  }

  @override
  void dispose() {
    _emailOrUsernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}