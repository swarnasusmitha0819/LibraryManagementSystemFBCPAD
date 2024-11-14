import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.contact_mail,
                    size: 80,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Get in Touch",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "We'd love to hear from you!",
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Contact Information Section
            Text(
              "Contact Information",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            _buildContactItem(
              icon: Icons.phone,
              title: "Phone",
              detail: "+1 (234) 567-890",
            ),
            _buildContactItem(
              icon: Icons.email,
              title: "Email",
              detail: "info@library.com",
            ),
            _buildContactItem(
              icon: Icons.location_on,
              title: "Address",
              detail: "123 Library Street, Booktown, BK 56789",
            ),
            SizedBox(height: 20),

            // Social Media Links Section
            Text(
              "Connect with Us",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blueAccent),
                  onPressed: () {
                    // Add link to Facebook
                  },
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.lightBlue),
                  onPressed: () {
                    // Add link to Twitter
                  },
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.purple),
                  onPressed: () {
                    // Add link to Instagram
                  },
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.linkedin, color: Colors.blueGrey),
                  onPressed: () {
                    // Add link to LinkedIn
                  },
                ),
              ],
            ),
            SizedBox(height: 20),

            // Contact Form Section
            Text(
              "Send Us a Message",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            _buildContactForm(),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Contact Information
  Widget _buildContactItem({required IconData icon, required String title, required String detail}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 30),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(detail, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
            ],
          ),
        ],
      ),
    );
  }

  // Helper Widget for Contact Form
  Widget _buildContactForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: "Name",
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            labelText: "Email",
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 12),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            labelText: "Message",
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Handle form submission logic here
            },
            child: Text("Send Message"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              textStyle: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
