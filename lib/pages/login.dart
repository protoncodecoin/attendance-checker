import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:attendance_system/auth/auth_service.dart';
import 'package:attendance_system/pages/dashboard.dart';
import 'package:attendance_system/screens/upcoming.dart';

class LoginPage extends StatefulWidget {
  static final String routeName = "/login";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errMsg = "";

  @override
  void initState() {
    _emailController.text = "";
    _passwordController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            shrinkWrap: true,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _errMsg,
                    style: const TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ),
              ),
              const Icon(
                Icons.person,
                size: 100,
                color: Colors.blue,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email Address",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Provide a valid email address";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.password),
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Make sure the password is correct";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _authenticate,
                  child: const Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _authenticate() async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: "Authenticating");

      final email = _emailController.text;
      final password = _passwordController.text;

      try {
        final status = await AuthService.loginAdmin(email, password);
        EasyLoading.dismiss();

        if (status) {
          if (context.mounted) {
            context.go(Dashboard.routeName);
          }

        } else {
          // AuthService.logout();
          // setState(() {
          //   _errMsg = "Account is not in admin scope";
          // });

          context.go(UpcomingPage.routeName);
        }

        // if (context.mounted)
      } on FirebaseAuthException catch (e) {
        EasyLoading.dismiss();

        setState(() {
          _errMsg = e.message!;
        });
      }
    }
  }
}
