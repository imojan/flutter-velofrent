import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Expanded untuk bagian logo dan tombol
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Logo dengan jarak padding
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 100, // Jarak atas
                        left: 8, // Jarak kiri
                        right: 7, // Jarak kanan
                        bottom: 50, // Sesuaikan jarak bawah
                      ),
                      child: SizedBox(
                        width: 200, // Lebar gambar
                        height: 200, // Tinggi gambar
                        child: Image.asset(
                          'asset/2.png', // Path ke logo
                          fit: BoxFit.contain, // Sesuaikan ukuran gambar
                        ),
                      ),
                    ),
                    // Login and Register Buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/loginpage');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                    255, 0, 84, 154), // Warna biru untuk tombol
                                minimumSize: const Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Log in',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white, // Teks putih
                                  fontWeight:
                                      FontWeight.bold, // Menjadikan teks bold
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context,
                                    '/signuppage'); // Navigasi ke SignUpPage
                              },
                              style: OutlinedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                side: const BorderSide(color: Colors.blue),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Daftar',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  fontWeight:
                                      FontWeight.bold, // Menjadikan teks bold
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Or use other methods text with horizontal lines
                    Row(
                      children: const [
                        Expanded(
                          child: Divider(
                            color: Colors.black26, // Warna garis
                            thickness: 1, // Ketebalan garis
                            indent: 24, // Margin kiri
                            endIndent: 8, // Margin kanan
                          ),
                        ),
                        Text(
                          'atau gunakan cara lain',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.black26, // Warna garis
                            thickness: 1, // Ketebalan garis
                            indent: 8, // Margin kiri
                            endIndent: 24, // Margin kanan
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Social Login Buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          _buildSocialButton(
                            context, // Kirim context untuk penggunaan MediaQuery
                            'asset/google.webp',
                            'masuk dengan akun google',
                            onPressed: () {},
                          ),
                          const SizedBox(height: 16),
                          _buildSocialButton(
                            context, // Kirim context untuk penggunaan MediaQuery
                            'asset/facebook.png',
                            'masuk dengan akun facebook',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48),
                  ],
                ),
              ),
            ),
            // Footer di bagian bawah
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                '©️2024 VeloRent | All rights reserved.',
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(BuildContext context, String iconPath, String text,
      {required VoidCallback onPressed}) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width * 0.8,
            50), // Tombol akan mengambil 80% dari lebar layar
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
