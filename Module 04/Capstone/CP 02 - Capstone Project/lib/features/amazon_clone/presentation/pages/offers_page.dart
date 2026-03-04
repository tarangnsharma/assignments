import 'package:flutter/material.dart';

import 'package:cp02_amazon_clone/core/theme/app_theme.dart';

/// Offers screen using amazonAddBanner1–4 and amazonBanner as promotional visuals.
class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  static const String _assets = 'assets/Images';

  static final List<String> _offerBanners = [
    '$_assets/amazonAddBanner1.jpg',
    '$_assets/amazonAddBanner2.jpg',
    '$_assets/amazonAddBanner3.jpg',
    '$_assets/amazonAddBanner4.jpg',
    '$_assets/amazonBanner.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.amazonLightBg,
      appBar: AppBar(
        backgroundColor: AppTheme.amazonDark,
        title: const Text('Offers', style: TextStyle(fontSize: 18)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _offerBanners.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                _offerBanners[index],
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 160,
                  color: AppTheme.amazonDark,
                  child: const Center(
                    child: Icon(Icons.local_offer, color: Colors.white54, size: 48),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
