import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                const SizedBox(height: 16),
                // Logo di bagian atas
                Image.asset(
                  'asset/2.png', // Path ke logo
                  width: 120, // Sesuaikan ukuran logo
                ),
                const SizedBox(height: 16),
                // Card untuk form login
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Card(
                    elevation: 4,
                    color: Colors.grey.shade100,
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
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Silahkan masukkan akun terlebih dahulu!",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          // Form username dan password
                          _buildTextField(
                            hintText: 'Username/No. Telepon atau E-mail',
                            icon: Icons.person,
                          ),
                          const SizedBox(height: 16),
                          _buildTextField(
                            hintText: 'Kata Sandi',
                            icon: Icons.lock,
                            isPassword: true,
                          ),
                          const SizedBox(height: 16),
                          // Tombol "Masuk"
                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(
                                    0xFF0058BC), // Warna biru (#0058BC)
                                fixedSize: const Size(
                                    250, 30), // Ukuran tombol (lebar x tinggi)
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      30), // Radius sudut 30
                                ),
                                elevation:
                                    2, // Tambahkan sedikit bayangan untuk estetika
                              ),
                              child: const Text(
                                'Masuk',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white, // Teks putih
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Link untuk daftar
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
                const SizedBox(height: 24),
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
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
            // Tombol kembali di pojok kiri atas + Tulisan "Login" di tengah
            Positioned(
              top: 16,
              left: 0,
              right: 0,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black, // Warna ikon
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Navigasi kembali ke halaman sebelumnya
                    },
                  ),
                  Expanded(
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center, // Teks di tengah
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Warna teks
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 48, // Memberikan ruang di sisi kanan agar sejajar dengan IconButton
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi _buildTextField tetap sama
  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isObscured = isPassword;

        return TextField(
          obscureText: isObscured,
          style: const TextStyle(
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      isObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                  )
                : null,
          ),
        );
      },
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
