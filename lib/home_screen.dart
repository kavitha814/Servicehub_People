import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servicehubpeople/activity.dart';
import 'package:servicehubpeople/cleaning_works.dart';
import 'package:servicehubpeople/electric_works.dart';
import 'package:servicehubpeople/inapp_purchase.dart';
import 'package:servicehubpeople/mechanic_works.dart';
import 'package:servicehubpeople/painting_works.dart';
import 'package:servicehubpeople/plumbing_screen.dart';
import 'package:servicehubpeople/repair_works.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = 'User';
  int _currentIndex = 0; // Track the current index

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('username') ?? 'User';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF22222E),
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFFE69023),
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Text(
            'ServiceHub',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Spacer(),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.person, color: Colors.white),
            label: Text(
              userName,
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
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 4),
          Center(
            child: Text(
              "India's No.1 Doorstep Service Provider",
              style: GoogleFonts.poppins(
                color: Color.fromARGB(255, 249, 249, 249),
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 15),
          _buildSearchBar(),
          SizedBox(height: 25),
          Text(
            'Popular services',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          _buildPopularServicesGrid(context),
          SizedBox(height: 25),
          Text(
            'Package details',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          _buildPackageDetailsCard(),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF42424E),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
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

  Widget _buildPopularServicesGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 1.0,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: <Widget>[
        _buildServiceItem(
          context: context,
          title: 'Repair Tech',
          imagePath: 'images/repair.jpg',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RepairScreen()),
            );
          },
        ),
        _buildServiceItem(
          context: context,
          title: 'Mechanic',
          imagePath: 'images/mechanic.webp',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MechanicScreen()),
            );
          },
        ),
        _buildServiceItem(
          context: context,
          title: 'Plumber',
          imagePath: 'images/plumber.jpg',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlumberScreen()),
            );
          },
        ),
        _buildServiceItem(
          context: context,
          title: 'Painters',
          imagePath: 'images/painter.jpg',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PainterScreen()),
            );
          },
        ),
        _buildServiceItem(
          context: context,
          title: 'Home Clean',
          imagePath: 'images/home_cleac.jpg',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CleaningScreen()),
            );
          },
        ),
        _buildServiceItem(
          context: context,
          title: 'Electrician',
          imagePath: 'images/electrician.jpg',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ElectricianScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildServiceItem({
    required BuildContext context,
    required String title,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF22222E),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 5),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageDetailsCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF22222E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'images/ad.jpg',
          width: double.infinity,
          height: 130,
          fit: BoxFit.cover,
        ),
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
    Color color = _currentIndex == index ? Colors.white : Colors.white; //change color here

    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
        _navigateToPage(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(iconData, color: color, size: 22),
          SizedBox(height: 3),
          Text(
            label,
            style: GoogleFonts.poppins(color: color, fontSize: 11),
          ),
        ],
      ),
    );
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        // Home (do nothing, we're already here)
        break;
      case 1:
        // Navigate to Shopping Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InAppPurchaseScreen()), // Replace ShoppingPage() with your shopping page widget
        );
        break;
      case 2:
        // Navigate to Booking Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ActivityScreen()),  // Replace BookingPage() with your booking page widget
        );
        break;
      case 3:
        // Navigate to Profile Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),  // Replace ProfilePage() with your profile page widget
        );
        break;
    }
  }
}

class ShoppingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping')),
      body: Center(child: Text('Shopping Page Content')),
    );
  }
}

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booking')),
      body: Center(child: Text('Booking Page Content')),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(child: Text('Profile Page Content')),
    );
  }
}