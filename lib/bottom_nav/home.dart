import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/items/book_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _bookIdController = TextEditingController();
  final TextEditingController _bookNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final List<Map<String, String>> books = [
    {
      'id': '001',
      'name': 'The Great Gatsby',
      'description': 'A classic novel about the American Dream.',
    },
    {
      'id': '002',
      'name': 'To Kill a Mockingbird',
      'description': 'A story of racial injustice and moral growth.',
    },
    {
      'id': '003',
      'name': '1984',
      'description': 'A dystopian novel about totalitarianism.',
    },
  ];
  final String _title = 'Dashboard';

  void _addBook() {
    // Get the values from the input fields
    String bookId = _bookIdController.text.trim();
    String bookName = _bookNameController.text.trim();
    String description = _descriptionController.text.trim();

    // Validate the inputs
    if (bookId.isEmpty || bookName.isEmpty || description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields!'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Add the new book to the top of the list
    setState(() {
      books.insert(0, {
        'id': bookId,
        'name': bookName,
        'description': description,
      });
    });

    // Clear the input fields
    _bookIdController.clear();
    _bookNameController.clear();
    _descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const LostPost()),
              // );
            },
            icon: Icon(
              Icons.manage_accounts_outlined,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            iconSize: 32.0,
          ),
        ],
      ),
      body: Column(
        children: [
          // List of Books
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return BookCard(
                  id: book['id']!,
                  name: book['name']!,
                  description: book['description']!,
                );
              },
            ),
          ),

          // Input Fields at the Bottom
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
            child: Column(
              children: [
                // Book ID Input Field
                TextField(
                  controller: _bookIdController,
                  decoration: InputDecoration(
                    labelText: 'Book ID',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the book ID',
                  ),
                ),
                SizedBox(height: 8.0),

                // Book Name Input Field
                TextField(
                  controller: _bookNameController,
                  decoration: InputDecoration(
                    labelText: 'Book Name',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the book name',
                  ),
                ),
                SizedBox(height: 8.0),

                // Description Input Field
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the book description',
                  ),
                  maxLines: 2, // Allow multiple lines for the description
                ),
                SizedBox(height: 16.0),

                // Add Book Button
                ElevatedButton(
                  onPressed: _addBook,
                  child: Text('Add Book'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), // Full-width button
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