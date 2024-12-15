import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import package url_launcher

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            width: 400,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 98, 98, 98).withOpacity(0.3),
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: TextField(
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                hintText: 'Cari motor yang kamu ingin pakai hari ini!',
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 12,
                ),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.black),
                contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          CircleAvatar(
            backgroundImage: AssetImage('asset/fauzan.png'),
            radius: 15,
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 10),
                Text('KOTA MALANG', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                Spacer(),
                Icon(Icons.arrow_drop_down),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Merk Motor Rekomendasi',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildMotorBrandCard('Yamaha', 'asset/yamaha.png'),
                _buildMotorBrandCard('Honda', 'asset/honda.png'),
                _buildMotorBrandCard('Kawasaki', 'asset/kawasaki.png'),
                _buildMotorBrandCard('Vespa', 'asset/vespa.png'),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Rekomendasi Trip!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            _buildTripRecommendationCard(
              'https://nusantaratrip.com/tempat-wisata-di-malang-dan-batu-beserta-rute-perjalannya/', // URL halaman pertama
            ),
            SizedBox(height: 8),
            _buildTripRecommendationCard2(
              'https://www.klook.com/id/blog/rekomendasi-tempat-wisata-di-malang/', // URL halaman kedua
            ),
            SizedBox(height: 8),
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Lihat Rekomendasi Lainnya',
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(Icons.arrow_right_alt, color: Colors.black),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        iconSize: 30,
        selectedLabelStyle: TextStyle(fontSize: 12, color: Color.fromARGB(255, 255, 255, 255)),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        unselectedItemColor: const Color.fromARGB(255, 189, 189, 189),
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
          ),
        ],
      ),
    );
  }

  Widget _buildMotorBrandCard(String brand, String imagePath) {
    return Column(
      children: [
        Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color.fromARGB(255, 165, 165, 165)),
          ),
          child: Center(
            child: Image.asset(imagePath, width: 80, height: 80),
          ),
        ),
        SizedBox(height: 8),
        Text(
          brand,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  // Fungsi untuk membuka URL di browser
  void _launchURL(String url) async {
  final Uri uri = Uri.parse(url); // Pastikan URL-nya benar
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
  // Widget Card 1 dengan GestureDetector untuk mengarahkan ke URL
  Widget _buildTripRecommendationCard(String url) {
    return GestureDetector(
      onTap: () => _launchURL('https://nusantaratrip.com/tempat-wisata-di-malang-dan-batu-beserta-rute-perjalannya/'), // Membuka URL saat card diklik
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                'asset/rekomen2.png',
                fit: BoxFit.cover,
                height: 160,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'sumber: nusantaratrip.com',
                      style: TextStyle(
                        fontSize: 10,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '23 Tempat Wisata di Malang yang Paling Banyak Diminati',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Card 2 dengan GestureDetector untuk mengarahkan ke URL
  Widget _buildTripRecommendationCard2(String url) {
    return GestureDetector(
      onTap: () => _launchURL('https://www.klook.com/id/blog/rekomendasi-tempat-wisata-di-malang/'), // Membuka URL saat card diklik
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                'asset/berita1.jpg',
                fit: BoxFit.cover,
                height: 180,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'sumber: klook.com',
                      style: TextStyle(
                        fontSize: 10,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Rekomendasi Wisata Terbaru dan Menarik di Malang',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
