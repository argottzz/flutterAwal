import 'package:flutter/material.dart';
import 'pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool togglePassword = true;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQv1lqV6zFMIBSR_Wb-7nhazM_qLjeIzAQiiwlgv0mrmA&s=10",
                    width: 100,
                    height: 100,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image_not_supported, size: 100);
                    },
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Login to your account",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 30),

                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Masukan Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email wajib diisi";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    obscureText: togglePassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Masukan Password",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            togglePassword = !togglePassword;
                          });
                        },
                        icon: Icon(
                          togglePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password wajib diisi";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                    SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print("Login berhasil");
                          // Navigasi ke Homepage dengan BottomNavBar jika email & password valid
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Homepage(),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
