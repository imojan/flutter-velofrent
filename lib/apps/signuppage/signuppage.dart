import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 10),
                // Form Sign Up
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Card(
                    elevation: 4,
                    color: const Color.fromARGB(255, 245, 245, 245),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            "Selamat Datang di Ruang VeloFRent!",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Buat akunmu terlebih dahulu, jika belum memiliki akun.",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          // Input fields
                          _buildTextField(
                            controller: phoneController,
                            hintText: 'No. Telepon',
                            icon: Icons.phone,
                          ),
                          const SizedBox(height: 16),
                          _buildTextField(
                            controller: emailController,
                            hintText: 'Masukkan Email Kamu di sini',
                            icon: Icons.email,
                          ),
                          const SizedBox(height: 16),
                          _buildTextField(
                            controller: usernameController,
                            hintText: 'Buat Username Kamu di sini',
                            icon: Icons.person,
                          ),
                          const SizedBox(height: 16),
                          _buildTextField(
                            controller: passwordController,
                            hintText: 'Buat Kata Sandi',
                            icon: Icons.lock,
                            isPassword: true,
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0058BC),
                                fixedSize: const Size(250, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 2,
                              ),
                              child: const Text(
                                'Buat Akun',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Login dengan sosial media
                Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(
                          child: Divider(
                            color: Colors.black26,
                            thickness: 1,
                            indent: 24,
                            endIndent: 8,
                          ),
                        ),
                        Text(
                          'atau gunakan cara lain',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.black26,
                            thickness: 1,
                            indent: 8,
                            endIndent: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildSocialButton(
                            context,
                            'asset/google.webp',
                            onPressed: () {},
                          ),
                          _buildSocialButton(
                            context,
                            'asset/facebook.png',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
                // Footer
                const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    '©️2024 VeloFRent | All rights reserved.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
            // Tombol kembali di pojok kiri atas
            Positioned(
              top: 16,
              left: 14,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Expanded(
                    child: Text(
                      'Buat Akun',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 62, // Placeholder untuk tombol kembali
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword && !_isPasswordVisible,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, color: Colors.black54),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black54,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : null,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }

  Widget _buildSocialButton(BuildContext context, String iconPath,
      {required VoidCallback onPressed}) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width * 0.4, 50),
        side: const BorderSide(color: Colors.blue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Image.asset(
        iconPath,
        height: 24,
        width: 24,
      ),
    );
  }
}
