import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String name;
  final String id;
  final String description;

  const BookCard({
    super.key,
    required this.name,
    required this.id,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => ViewPost(
          //             movieId: id,
          //           )),
          // );
        },
        child: Card(
          elevation: 4.0,
          margin: EdgeInsets.only(bottom: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ID: $id',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
