import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// GC 15: Fetch image links and text from Firestore; present in cards with left-to-right slide transition; scrollable.
class FirestoreCardsSlidePage extends StatefulWidget {
  const FirestoreCardsSlidePage({super.key});

  @override
  State<FirestoreCardsSlidePage> createState() => _FirestoreCardsSlidePageState();
}

class _FirestoreCardsSlidePageState extends State<FirestoreCardsSlidePage> {
  static const String _defaultCollection = 'cards';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GC 15 – Firestore Cards with Slide')),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection(_defaultCollection).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 48, color: Colors.red.shade700),
                    const SizedBox(height: 16),
                    Text(
                      'Firestore error: ${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Ensure Firebase is configured. Use a collection (e.g. "cards") with docs containing "imageUrl" and "text" (or "title") fields.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final docs = snapshot.data?.docs ?? [];
          if (docs.isEmpty) {
            return const Center(
              child: Text(
                'No documents in the collection. Add docs with "imageUrl" and "text" (or "title") for image cards.',
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data();
              final imageUrl = data['imageUrl']?.toString();
              final text = data['text']?.toString() ?? data['title']?.toString() ?? '';
              return _SlideInCard(
                index: index,
                imageUrl: imageUrl,
                text: text,
              );
            },
          );
        },
      ),
    );
  }
}

class _SlideInCard extends StatefulWidget {
  const _SlideInCard({
    required this.index,
    required this.imageUrl,
    required this.text,
  });

  final int index;
  final String? imageUrl;
  final String text;

  @override
  State<_SlideInCard> createState() => _SlideInCardState();
}

class _SlideInCardState extends State<_SlideInCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty)
              Image.network(
                widget.imageUrl!,
                height: 160,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    height: 160,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (_, __, ___) => Container(
                  height: 160,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.broken_image_outlined, size: 48),
                ),
              )
            else
              Container(
                height: 120,
                color: Colors.grey.shade200,
                child: const Icon(Icons.image_not_supported, size: 48),
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                widget.text,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
