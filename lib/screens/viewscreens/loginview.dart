import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mechinetest/screens/viewscreens/homepage.dart';
import 'package:mechinetest/screens/controller/logincontroler/authprovider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/login.png',
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 100,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/Layer_1-2(1).png'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 70),
              child: Text(
                "Login Or Register To Book ",
                style: TextStyle(fontSize: 28),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Text(
                "Your Appointments.",
                style: TextStyle(fontSize: 28),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 330),
                    child: Text(
                      "Email",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.grey[100],
                        filled: true,
                        errorText: errorMessage.isNotEmpty ? errorMessage : null,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 300),
                    child: Text(
                      "Password",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.grey[100],
                        filled: true,
                        errorText: errorMessage.isNotEmpty ? errorMessage : null,
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () async {
                        String email = emailController.text.trim();
                        String password = passwordController.text.trim();
                        if (email.isEmpty || password.isEmpty) {
                          setState(() {
                            errorMessage = 'Please enter email and password.';
                          });
                          return;
                        }
                        setState(() {
                          errorMessage = '';
                        });
                        await authProvider.login(context,email, password);

                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  Text(
                    "By Creating or Login into an account You are agreeing",
                    style: TextStyle(fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Row(
                      children: [
                        Text(
                          "With Our",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Terms and Condition",
                            style: TextStyle(
                              color: CupertinoColors.systemBlue,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Text(
                          "and",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(
                              color: CupertinoColors.systemBlue,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
