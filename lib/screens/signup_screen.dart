import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
              //     String? error = await AuthService.signUp(
              //       email.text.trim(),
              //       password.text.trim(),
              //     );

              //     if (error != null) {
              //       ScaffoldMessenger.of(
              //         context,
              //       ).showSnackBar(SnackBar(content: Text(error)));
              //     } else {
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         const SnackBar(
              //           content: Text("Account created! Please login."),
              //         ),
              //       );
              //       Navigator.pop(context);
              //     }
              //   },
              //   child: const Text("Sign Up"),
              // ),
              ElevatedButton(
                onPressed: () async {
                  final result = await AuthService.signUp(
                    email.text.trim(),
                    password.text.trim(),
                  );

                  if (result != null) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(result)));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Account created successfully"),
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text("Sign Up"),
              ),
              TextButton(
  child: const Text("Privacy Policy"),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PrivacyPolicyScreen(),
      ),
    );
  },
)

            ],
          ),
        ),
      ),
    );
  }
}
