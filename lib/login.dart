import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tpm1/navbar.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var usernameController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        automaticallyImplyLeading: false,
      ),
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop(animated: true);
          return false;
        },
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Please login to continue',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Text text = const Text("Login Failed");

                        if (usernameController.text.toString() == "admin" &&
                            passwordController.text.toString() == "admin") {
                          text = const Text("Login Success");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavBar(),
                            ),
                          );
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: text,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(40),
                      ),
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
