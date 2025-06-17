import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.arrow_back_ios, color: Colors.black),
            Text('Booking', style: TextStyle(color: Colors.black)),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.notifications_none, color: Colors.black), onPressed: () {}),
          IconButton(icon: Icon(Icons.flag_outlined, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              'images/map.png', // Replace with your map image path
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView(
              children: [
                _buildBookingCard(
                  'Mr. Yaazhan',
                  '5:00 PM',
                  '15min away',
                  4,
                  'images/profile1.png', // Replace with your profile image path
                ),
                _buildBookingCard(
                  'Mr. Siva',
                  '5:30 PM',
                  '20min away',
                  5,
                  'images/profile2.png', // Replace with your profile image path
                ),
                _buildBookingCard(
                  'Mr. Kavin',
                  '7 PM',
                  '40min away',
                  3,
                  'images/profile3.png', // Replace with your profile image path
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'PURCHASES'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'ACTIVITY'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'PROFILE'),
        ],
      ),
    );
  }

  Widget _buildBookingCard(String name, String time, String distance, int rating, String imagePath) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey[850]!, Colors.grey[900]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 30,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Text('$time • $distance', style: TextStyle(color: Colors.white70)),
                Row(
                  children: List.generate(5, (index) => Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 20,
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}