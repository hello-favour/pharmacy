import 'package:flutter/material.dart';
import 'package:pharmacy/constants/app_images.dart';
import 'package:pharmacy/constants/custom_textfield.dart';
import 'package:pharmacy/constants/reusable_text.dart';
import 'package:pharmacy/pages/home_page.dart';
import 'package:pharmacy/pages/register.dart';
import 'package:pharmacy/services/auth_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  AuthService _authService = AuthService();

  final GlobalKey _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 30),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      AppImages.pills1,
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                CustomTextField(
                  hintText: "Email",
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    _email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty || !value.contains("@")) {
                      return "Invalid email address";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  hintText: "Password",
                  prefixIcon: Icons.lock_outline,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) {
                    _password = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                const Divider(
                  thickness: 8,
                ),
                const SizedBox(height: 30),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                          (route) => false);
                    },
                    child: const ReusableText(
                      text: "No account? Register",
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _authService.signInUser(
                          _email.trim(), _password.trim(), context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: const Text("Login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
