import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/gishtube_logo.png", height: 80),
              TextField(
                controller: email,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: password,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () async {
              //     String? error = await AuthService.signIn(
              //       email.text.trim(),
              //       password.text.trim(),
              //     );

              //     if (error != null) {
              //       ScaffoldMessenger.of(
              //         context,
              //       ).showSnackBar(SnackBar(content: Text(error)));
              //     } else {
              //       Navigator.pushReplacementNamed(context, "/videos");
              //     }
              //   },
              //   child: const Text("Login"),
              // ),
              ElevatedButton(
                onPressed: () async {
                  final result = await AuthService.signIn(
                    email.text.trim(),
                    password.text.trim(),
                  );

                  if (result != null) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(result)));
                  } else {
                    Navigator.pop(context); // success
                  }
                },
                child: const Text("Login"),
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupScreen()),
                  );
                },
                child: const Text("Create account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
