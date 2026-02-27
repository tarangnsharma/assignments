import 'package:flutter/material.dart';

/// PC 27: List of 20 items – odd index → image1, even index → image2; index shown top-left.
class AlternatingImagesPage extends StatelessWidget {
  const AlternatingImagesPage({super.key});

  static const _image1 =
      'https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI';
  static const _image2 =
      'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  static const int maxCount = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 27 – Alternating images')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
        ),
        itemCount: maxCount,
        itemBuilder: (context, index) {
          final url = index % 2 == 0 ? _image2 : _image1;
          return Stack(
            alignment: Alignment.topLeft,
            children: [
              Image.network(
                url,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                color: Colors.black54,
                child: Text(
                  '$index',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
