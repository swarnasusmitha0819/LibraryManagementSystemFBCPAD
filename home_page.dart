import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Library Home")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Library Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text("Browse Books"),
              onTap: () => Navigator.pushNamed(context, '/browseBooks'),
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text("My Books"),
              onTap: () => Navigator.pushNamed(context, '/myBooks'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About Us"),
              onTap: () => Navigator.pushNamed(context, '/aboutUs'),
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Contact Us"),
              onTap: () => Navigator.pushNamed(context, '/contactUs'),
            ),
            Divider(), // Adds a divider before the Logout option
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login'); // Navigate to login page
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with local asset image
            Stack(
              children: [
                Image.asset(
                  'assets/pic1.jpg', // Changed to AssetImage
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Text(
                    "Welcome to Your Library",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Explore Our Features",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            // Feature cards with local asset images
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  FeatureCard(
                    imageUrl: 'assets/browsebooks.jpg', // Changed to AssetImage
                    title: "Browse Books",
                    description: "Explore a wide selection of books across genres and authors.",
                    onTap: () => Navigator.pushNamed(context, '/browseBooks'),
                  ),
                  FeatureCard(
                    imageUrl: 'assets/mybooks.jpg', // Changed to AssetImage
                    title: "My Books",
                    description: "View and manage the books you've borrowed from the library.",
                    onTap: () => Navigator.pushNamed(context, '/myBooks'),
                  ),
                  // Additional FeatureCards can be added here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom card widget for features with local asset images
class FeatureCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final VoidCallback onTap;

  const FeatureCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl, // Changed to AssetImage
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 4),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
