import 'package:flutter/material.dart';

class MyBooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> borrowedBooks = [
      {
        "title": "The Great Gatsby",
        "author": "F. Scott Fitzgerald",
        "imageUrl": "assets/Book1.jpg", // Local asset image
        "status": "Borrowed",
      },
      {
        "title": "To Kill a Mockingbird",
        "author": "Harper Lee",
        "imageUrl": "assets/Book2.jpg", // Local asset image
        "status": "Due Soon",
      },
      {
        "title": "1984",
        "author": "George Orwell",
        "imageUrl": "assets/Book3.jpg", // Local asset image
        "status": "Borrowed",
      },
      {
        "title": "Pride and Prejudice",
        "author": "Jane Austen",
        "imageUrl": "assets/Book4.jpg", // Local asset image
        "status": "Due Soon",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("My Books"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: borrowedBooks.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final book = borrowedBooks[index];
          return BookCard(
            title: book['title']!,
            author: book['author']!,
            imageUrl: book['imageUrl']!,
            status: book['status']!,
          );
        },
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final String status;

  const BookCard({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          // Implement navigation to a book detail page if needed
        },
        child: Row(
          children: [
            // Book cover image
            Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl), // Changed to use AssetImage
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800], // Dark blue for title
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "by $author",
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Colors.blue[600], // Medium blue for author text
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: status == "Borrowed" ? Colors.blue[400] : Colors.blue[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
