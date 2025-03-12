import 'dart:developer';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      showCursor: true,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (value) {
                        return value!.isEmpty ? 'Enter email' : null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      showCursor: true,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                      validator: (value) {
                        return value!.isEmpty ? 'Enter password' : null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              //  Image picker
              button(
                  context: context,
                  text: 'Login',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      log('Validate');
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton button({
    required BuildContext context,
    required String text,
    required void Function()? onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        textStyle: const TextStyle(fontSize: 12),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
