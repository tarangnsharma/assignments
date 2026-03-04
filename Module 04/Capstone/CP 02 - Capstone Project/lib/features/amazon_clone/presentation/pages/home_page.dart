import 'package:cp02_amazon_clone/core/navigation/app_routes.dart';
import 'package:cp02_amazon_clone/core/theme/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_flow_page.dart';
import 'product_detail_page.dart';
import 'profile_page.dart';

/// Home: Amazon-style app bar with logo, banner carousel, product grid. Uses amazonLogo, amazonBanner, amazonAddBanner1–4.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String _assets = 'assets/Images';
  int _bannerIndex = 0;

  final List<String> _bannerImages = [
    '$_assets/amazonBanner.jpg',
    '$_assets/amazonAddBanner1.jpg',
    '$_assets/amazonAddBanner2.jpg',
    '$_assets/amazonAddBanner3.jpg',
    '$_assets/amazonAddBanner4.jpg',
  ];

  final List<Map<String, String>> _products = [
    {
      'id': '1',
      'title': 'Wireless Earbuds',
      'price': '₹1,299',
      'image': '$_assets/testing.png'
    },
    {
      'id': '2',
      'title': 'Smart Watch',
      'price': '₹2,499',
      'image': '$_assets/testing.png'
    },
    {
      'id': '3',
      'title': 'Phone Stand',
      'price': '₹349',
      'image': '$_assets/testing.png'
    },
    {
      'id': '4',
      'title': 'USB Cable Pack',
      'price': '₹199',
      'image': '$_assets/testing.png'
    },
    {
      'id': '5',
      'title': 'Screen Guard',
      'price': '₹149',
      'image': '$_assets/testing.png'
    },
    {
      'id': '6',
      'title': 'Power Bank',
      'price': '₹899',
      'image': '$_assets/testing.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.amazonLightBg,
      appBar: AppBar(
        backgroundColor: AppTheme.amazonDark,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            '$_assets/amazonLogo.png',
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => const Icon(Icons.shopping_bag),
          ),
        ),
        title: Container(
          margin: const EdgeInsets.only(left: 8),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              Icon(Icons.location_on_outlined,
                  size: 18, color: Colors.grey[700]),
              const SizedBox(width: 4),
              Text(
                'Deliver to India',
                style: TextStyle(fontSize: 12, color: Colors.grey[800]),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications_outlined), onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.cart),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _buildBannerCarousel(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today\'s Deals',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.offers),
                    child: const Text('See all offers'),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.72,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final p = _products[index];
                  return _ProductCard(
                    title: p['title']!,
                    price: p['price']!,
                    imagePath: p['image']!,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailPage(
                          productId: p['id']!,
                          title: p['title']!,
                          price: p['price']!,
                          imagePath: p['image'],
                        ),
                      ),
                    ),
                  );
                },
                childCount: _products.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: AppTheme.amazonFooterBg,
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Image.asset(
                  '$_assets/amazonLogoFooter.png',
                  height: 40,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
      bottomNavigationBar: Container(
        color: AppTheme.amazonFooterBg,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(icon: Icons.home, label: 'Home', onTap: () {}),
                _NavItem(
                  icon: Icons.account_circle_outlined,
                  label: 'Account',
                  onTap: () {
                    if (FirebaseAuth.instance.currentUser != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ProfilePage()),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AuthFlowPage()),
                      );
                    }
                  },
                ),
                _NavItem(
                  icon: Icons.shopping_cart_outlined,
                  label: 'Cart',
                  onTap: () => Navigator.pushNamed(context, AppRoutes.cart),
                ),
                _NavItem(
                  icon: Icons.local_offer_outlined,
                  label: 'Offers',
                  onTap: () => Navigator.pushNamed(context, AppRoutes.offers),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBannerCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            itemCount: _bannerImages.length,
            onPageChanged: (i) => setState(() => _bannerIndex = i),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    _bannerImages[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (_, __, ___) => Container(
                      color: AppTheme.amazonDark,
                      child: const Center(
                        child:
                            Icon(Icons.image, color: Colors.white54, size: 48),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _bannerImages.length,
            (i) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _bannerIndex == i ? AppTheme.amazonOrange : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;
  final VoidCallback onTap;

  const _ProductCard({
    required this.title,
    required this.price,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    errorBuilder: (_, __, ___) => const Center(
                      child: Icon(Icons.image_not_supported, size: 40),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Text(
                price,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _NavItem(
      {required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white70, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
