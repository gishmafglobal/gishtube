import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  String policyText = "";

  @override
  void initState() {
    super.initState();
    loadPolicy();
  }

  Future<void> loadPolicy() async {
    final text = await rootBundle.loadString('assets/privacy_policy.txt');
    setState(() {
      policyText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Privacy Policy")),
      body: policyText.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Text(
                  policyText,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
    );
  }
}
