import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardWithUrl extends StatelessWidget {
  final String url;

  CardWithUrl({required this.url});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Padding(
        padding: const EdgeInsets.only(left:17),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    url,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800]
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: url));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Text copied')),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255,51,53,125),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.link, color: Colors.white),
                    SizedBox(width: 5),
                    Text(
                    'Copy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}