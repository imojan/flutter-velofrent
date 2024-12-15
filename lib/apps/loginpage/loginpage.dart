import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false; // Untuk melacak visibility password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Konten utama
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 10),
                // Logo di bagian atas
                Image.asset(
                  'asset/bg-velo.png', // Path ke logo
                  width: 300, // Perbesar ukuran logo
                ),
                const SizedBox(
                    height: 10), // Kurangi jarak antara logo dan card form
                // Card untuk form login
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
                            "Selamat Datang di VeloFRent!",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Silahkan masukkan akun terlebih dahulu!",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          // Form username
                          _buildTextField(
                            controller: usernameController,
                            hintText: 'Username/No. Telepon atau E-mail',
                            icon: Icons.person,
                          ),
                          const SizedBox(height: 16),
                          // Form password
                          _buildTextField(
                            controller: passwordController,
                            hintText: 'Kata Sandi',
                            icon: Icons.lock,
                            isPassword: true,
                          ),
                          const SizedBox(height: 16),
                          // Tombol "Masuk"
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                      Navigator.pushNamed(context,
                          '/homepage'); // Navigasi kembali ke halaman sebelumnya
                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0058BC),
                                fixedSize: const Size(250, 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 2,
                              ),
                              child: const Text(
                                'Masuk',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Belum punya akun? Daftar',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                              ),
                              textAlign: TextAlign.center,
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
                    '©️2024 VeloRent | All rights reserved.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
            // Tombol kembali di pojok kiri atas + Teks "Login" di tengah
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
                      color: Colors.black, // Warna ikon
                    ),
                    onPressed: () {
                      Navigator.pop(context,
                          '/landingpage'); // Navigasi kembali ke halaman sebelumnya
                    },
                  ),
                  Expanded(
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Warna teks
                      ),
                    ),
                  ),
                  const SizedBox(
                    width:
                        62, // Memberikan ruang kosong agar IconButton tetap sejajar
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
      obscureText: isPassword &&
          !_isPasswordVisible, // Sembunyikan teks jika bukan password visible
      style: TextStyle(
        fontStyle:
            controller.text.isEmpty ? FontStyle.italic : FontStyle.normal,
        fontSize: 14,
      ),
      onChanged: (value) {
        setState(() {}); // Memperbarui UI saat teks berubah
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontStyle: FontStyle.italic, // Hint text italic
          fontSize: 14,
          color: Color.fromARGB(115, 0, 0, 0), // Warna hint teks
        ),
        prefixIcon: Icon(
          icon,
          color: const Color.fromARGB(135, 0, 0, 0), // Warna ikon
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: const Color.fromARGB(137, 0, 0, 0), // Warna ikon
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : null,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(115, 0, 0, 0), // Warna garis bawah default
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue, // Warna garis bawah saat fokus
            width: 2, // Ketebalan garis saat fokus
          ),
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
