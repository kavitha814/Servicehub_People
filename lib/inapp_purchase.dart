import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servicehubpeople/activity.dart';

import 'home_screen.dart'; // Import MainPage (or the other pages)

class InAppPurchaseScreen extends StatefulWidget {
  @override
  _InAppPurchaseScreenState createState() => _InAppPurchaseScreenState();
}

class _InAppPurchaseScreenState extends State<InAppPurchaseScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF22222E),
      appBar: AppBar(
        backgroundColor: Color(0xFFE69023),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
            SizedBox(width: 8),
            Text(
              'In App Purchases',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.location_on, color: Colors.white),
              label: Text(
                'Chennai',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFE69023),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.white),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                textStyle: GoogleFonts.poppins(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
      body: _buildBody(), // Separate body content
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 15),
          Text(
            "Buy hardwares from your nearby in a Click !",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 1.1,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            children: <Widget>[
              _buildServiceCard(
                title: 'MK Electronics',
                image: 'images/mk_electronics.png',
                price: '399',
              ),
              _buildServiceCard(
                title: 'Nippon Paints',
                image: 'images/nippon.jpg',
                price: '399',
              ),
              _buildServiceCard(
                title: 'Pradhaa Spare Parts',
                image: 'images/pradha_hardwares.jpg',
                price: '399',
              ),
              _buildServiceCard(
                title: 'Asian Paints',
                image: 'images/asian.png',
                price: '399',
              ),
              _buildServiceCard(
                title: 'Siva Hardwares',
                image: 'images/siva_spares.jpg',
                price: '399',
              ),
              _buildServiceCard(
                title: 'SS Ceramics',
                image: 'images/ceramics.jpg',
                price: '399',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({
    required String title,
    required String image,
    required String price,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF42424E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Starts from Rs . $price',
                  style: GoogleFonts.poppins(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE69023),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildBottomNavItem(Icons.home_outlined, 'Home', 0),
          _buildBottomNavItem(Icons.shopping_cart_outlined, 'Shopping', 1),
          _buildBottomNavItem(Icons.calendar_today_outlined, 'Booking', 2),
          _buildBottomNavItem(Icons.person_outline, 'Profile', 3),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData iconData, String label, int index) {
    Color color = Colors.white;
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
        _navigateToPage(index, context); // Call navigation function
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(iconData, color: color, size: 24),
          SizedBox(height: 3),
          Text(
            label,
            style: GoogleFonts.poppins(color: color, fontSize: 12),
          ),
        ],
      ),
    );
  }

  void _navigateToPage(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()), // Replace with your actual Home screen
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InAppPurchaseScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ActivityScreen()), // Replace with your Booking/Activity screen
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()), // Replace with your Profile screen
        );
        break;
    }
  }
}