import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RepairWorksChecklistScreen extends StatefulWidget {
  @override
  _RepairWorksChecklistScreenState createState() =>
      _RepairWorksChecklistScreenState();
}

class _RepairWorksChecklistScreenState
    extends State<RepairWorksChecklistScreen> {
  final List<ServiceItem> services = [
    ServiceItem(
        name: 'Fan Installation',
        isSelected: false,
        image: 'images/fan_installation.png'),
    ServiceItem(
        name: 'AC Services',
        isSelected: false,
        image: 'images/repair.jpg'),
    ServiceItem(
        name: 'Refridgerator Services',
        isSelected: false,
        image: 'images/refridgerator.jpg'),
    ServiceItem(
        name: 'Washing machine',
        isSelected: false,
        image: 'images/washing_machine.webp'),
    ServiceItem(
        name: 'Mixer & Grinder',
        isSelected: false,
        image: 'images/mixer.jpg'),
    ServiceItem(
        name: 'Computer Services',
        isSelected: false,
        image: 'images/computer.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Repair works',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 4),
                Text(
                  'Chennai',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        color: Color(0xFF2E2E38),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Book Trusted Electricians in a Click !',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: services.length,
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final service = services[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        services[index].isSelected = !services[index].isSelected;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF43434D),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          if (service.image != null &&
                              service.image!.isNotEmpty)
                            Image.asset(service.image!, width: 60, height: 60)
                          else
                            SizedBox(
                                width: 60, height: 60), // Placeholder if no image
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              service.name,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          //  Replace Checkbox with a Custom Implementation
                          _buildCustomCheckbox(service.isSelected, (bool? newValue) {
                            setState(() {
                              services[index].isSelected = newValue ?? false;
                            });
                          }),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final selectedServices =
                      services.where((s) => s.isSelected).toList();
                  if (selectedServices.isNotEmpty) {
                    print(
                        'Selected services: ${selectedServices.map((s) => s.name).toList()}');
                    // Handle submission logic here
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please select at least one service.'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'SUBMIT',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomCheckbox(bool isSelected, ValueChanged<bool?> onChanged) {
  return GestureDetector(
    onTap: () {
      onChanged(!isSelected); // Toggle the state
    },
    child: Container(
      decoration: BoxDecoration(
        color: isSelected
            ? Color(0xFFE69023) // Fill color when selected
            : Colors.transparent, // No fill color when not selected
        border: Border.all(
          color: Colors.white, // Border color
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      width: 24, // Adjust size as needed
      height: 24,
      child: isSelected
          ? Icon(
              Icons.check,
              size: 20,
              color: Colors.white, // Color of the checkmark (white)
            )
          : null, // No icon when not selected
    ),
  );
}

  Widget _buildNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavigationItem(Icons.home, 'Home', () {}),
          _buildNavigationItem(Icons.shopping_cart, 'Shopping', () {}),
          _buildNavigationItem(Icons.calendar_today, 'Booking', () {}),
          _buildNavigationItem(Icons.person_outline, 'Profile', () {}),
        ],
      ),
    );
  }

  Widget _buildNavigationItem(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class ServiceItem {
  String name;
  bool isSelected;
  String? image;

  ServiceItem({required this.name, required this.isSelected, this.image});
}