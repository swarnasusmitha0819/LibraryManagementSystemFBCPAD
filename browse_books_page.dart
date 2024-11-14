import 'package:flutter/material.dart';
import 'book_detail_page.dart';

class BrowseBooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Browse Books"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Goes back to HomePage
          },
        ),
      ),
      body: Stack(
        children: [
          // Background image (optional)
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'), // Background asset image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Gradient overlay
          Container(
            color: Colors.blue.withOpacity(0.6), // Semi-transparent overlay
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Explore Our Collection!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Discover a variety of books available for you to read, borrow, or purchase.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    childAspectRatio: 0.7,
                    children: List.generate(6, (index) {
                      return BookCard(
                        title: "Book Title ${index + 1}",
                        author: "Author ${index + 1}",
                        imageUrl: "assets/Book${index + 1}.jpg", // Local asset images
                        description: "This is a detailed description for Book Title ${index + 1}.",
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// BookCard widget with navigation to BookDetailPage
class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final String description;

  const BookCard({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(8),
      shadowColor: Colors.blueAccent.withOpacity(0.4),
      child: InkWell(
        onTap: () {
          // Navigate to BookDetailPage and pass the details
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetailPage(
                title: title,
                author: author,
                imageUrl: imageUrl,
                description: description,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue[800], // Dark blue for title text
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    author,
                    style: TextStyle(color: Colors.blueGrey), // Subtle blue-grey for author text
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
