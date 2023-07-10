// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FirstExample extends StatefulWidget {
  const FirstExample({super.key});

  @override
  State<FirstExample> createState() => _FirstExampleState();
}

class _FirstExampleState extends State<FirstExample> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Secure Storage'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
            ),
            TextFormField(
              controller: passwordController,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                FlutterSecureStorage fs = const FlutterSecureStorage();
                fs.write(key: 'email', value: emailController.text);
                fs.write(key: 'password', value: passwordController.text);

                email = await fs.read(key: 'email') ?? "";
                password = await fs.read(key: 'password') ?? "";
                emailController.clear();
                passwordController.clear();
                setState(() {});
              },
              child: const Text('Submit Data'),
            ),
            Text(
              'Email: $email',
            ),
            Text(
              'password: $password',
            ),
          ],
        ),
      ),
    );
  }
}
