import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ElectricianScreen extends StatelessWidget {
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
              'Repair works',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15),
            Text(
              "Book Trusted Electricians in a Click !",
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
                  title: 'Fan Installation',
                  image: 'images/fan_installation.jpg',
                  price: '399',
                ),
                _buildServiceCard(
                  title: 'AC Services',
                  image: 'images/ac_services.jpg',
                  price: '399',
                ),
                _buildServiceCard(
                  title: 'Refridgerator Services',
                  image: 'images/refrigerator_repair.jpg',
                  price: '399',
                ),
                _buildServiceCard(
                  title: 'Washing machine',
                  image: 'images/washing_machine_repair.jpg',
                  price: '399',
                ),
                _buildServiceCard(
                  title: 'Mixer & Grinder',
                  image: 'images/mixer_grinder_repair.jpg',
                  price: '399',
                ),
                _buildServiceCard(
                  title: 'Computer Services',
                  image: 'images/computer_repair.jpg',
                  price: '399',
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
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
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
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
                SizedBox(height: 4),
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
          _buildBottomNavItem(Icons.home_outlined, 'Home', false),
          _buildBottomNavItem(Icons.shopping_cart_outlined, 'Shopping', false),
          _buildBottomNavItem(Icons.calendar_today_outlined, 'Booking', false),
          _buildBottomNavItem(Icons.person_outline, 'Profile', false),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData iconData, String label, bool isActive) {
    Color color = Colors.white;
    return InkWell(
      onTap: () {},
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
}