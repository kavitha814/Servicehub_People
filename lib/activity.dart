import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF22222E),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildSearchBar(),
            SizedBox(height: 20),
            Text(
              'Upcoming',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _buildUpcomingBookingCard(),
            SizedBox(height: 20),
            Text(
              'Past',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _buildPastBookingCard(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFFE69023),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {}, // Handle back button action
      ),
      title: Text(
        'Activity',
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_outlined, color: Colors.white),
          onPressed: () {}, // Handle notification action
        ),
        IconButton(
          icon: Icon(Icons.mail_outline, color: Colors.white),
          onPressed: () {}, // Handle message action
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF42424E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        style: GoogleFonts.poppins(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search services ...',
          hintStyle: GoogleFonts.poppins(color: Colors.grey[600], fontSize: 14),
          prefixIcon: Icon(Icons.search, color: Colors.white, size: 20),
          suffixIcon: Icon(Icons.tune, color: Colors.white, size: 20),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
      ),
    );
  }

  Widget _buildUpcomingBookingCard() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Color(0xFF43434D),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Plumbing Service',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '• Today • 4.00 PM',
                  style: GoogleFonts.poppins(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '₹ 800.00',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Placeholder for the plumbing image
              Image.asset(
                'images/plumber.jpg', // Replace with your actual image path
                height: 60,
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xFFE69023),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'Booked',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPastBookingCard() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Color(0xFF43434D),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AC Installation',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Oct 20 • 1.00 PM',
                  style: GoogleFonts.poppins(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '₹ 3000.00 • Completed',
                  style: GoogleFonts.poppins(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          // Placeholder for the AC installation image
          Container(
            width: 100,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage('images/repair.jpg'), // Replace with your actual image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {}, // Handle rebook action
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFE69023),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            child: Text(
              'Rebook',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE69023),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildBottomNavItem(Icons.home_outlined, 'Home', () {
            // Navigate to Home screen
          }),
          _buildBottomNavItem(Icons.shopping_cart_outlined, 'Shopping', () {
            // Navigate to Shopping screen
          }),
          _buildBottomNavItem(Icons.calendar_today_outlined, 'Booking', () {
            // Navigate to Booking screen
          }),
          _buildBottomNavItem(Icons.person_outline, 'Profile', () {
            // Navigate to Profile screen
          }),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData iconData, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(iconData, color: Colors.white, size: 22),
          SizedBox(height: 3),
          Text(
            label,
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 11),
          ),
        ],
      ),
    );
  }
}