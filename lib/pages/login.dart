import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoginForm = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF790000),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade900),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF790000),
          title: Text(
            _isLoginForm ? 'Login' : 'Register',
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          titleTextStyle: const TextStyle(fontSize: 16.0),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20.0),
          child: Center(
            child: _isLoginForm ? _buildLoginForm() : _buildRegisterForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        const Text('You need to be logged in to use the Fightnight Scores app',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 30.0,
        ),
        Card(
          elevation: 8.0,
          surfaceTintColor: Colors.grey,
          color: Colors.grey.shade100,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 26.0),
            child: Column(children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF790000)!),
                ),
                onPressed: () {
                  // Implement login functionality
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isLoginForm = false;
                  });
                },
                child: const Text('or register an account'),
              ),
            ]),
          ),
        )
      ],
    );
  }

  Widget _buildRegisterForm() {
    return Column(
      children: [
        Card(
          elevation: 8.0,
          surfaceTintColor: Colors.grey,
          color: Colors.grey.shade100,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 26.0),
            child: Column(children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  labelText: 'Confirm Password',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF790000)!),
                ),
                onPressed: () {
                  // Implement login functionality
                },
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isLoginForm = true;
                  });
                },
                child: const Text('Already have an account? Login here'),
              ),
            ]),
          ),
        )
      ],
    );
  }
}
