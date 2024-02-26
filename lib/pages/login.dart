import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:fightnight_scores/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoginForm = true;
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoginForm ? _buildLoginForm() : _buildRegisterForm();
  }

  Widget _buildLoginForm() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 15.0,),
          const Text('Login'),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 26.0),
            child: Column(children: [
              TextField(
                controller: _emailController, // Assign controller here
                decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF790000)),
                ),
                onPressed: () => _login(context), // Pass context here
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 40),
            ]),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _isLoginForm = false;
              });
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not registered?'),
                SizedBox(
                  width: 6.0,
                ),
                Text(
                  'create an account',
                  style: TextStyle(color: Color(0xff790000)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterForm() {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 26.0),
          child: Column(children: [
            const Text('Register'),
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
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF790000)),
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
              child: const Row(
                children: [
                  Text('Already have an account?'),
                  SizedBox(width: 6.0,),
                  Text('Login here', style: TextStyle(color: Color(0xFF790000)),),
                ],
              ),
            ),
          ]),
        )
      ],
    );
  }

  void _login(BuildContext context) async {
    // Get email and password from text fields
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // Create a Map with email and password
    Map<String, String> data = {
      'email': email,
      'password': password,
    };

    // Send POST request to API
    var response = await http.get(
      Uri.parse(
          'http://fightnight-scores.test/api/user/login/$email/$password'),
    );

    // Check if request was successful (status code 200)
    if (response.statusCode == 200) {
      // Login successful, handle response
      // For example, navigate to the next screen
      print('yeahhh');
      print(response.body);

      // Update isLoggedIn state using the provided context
      Provider.of<MyAppState>(context, listen: false).isLoggedIn = true;
    } else {
      // Login failed, handle error
      print('something went wrong');
      print('Error: ${response.statusCode}');
      print('Error message: ${response.body}');
      // For example, show an error message to the user
    }
  }
}
