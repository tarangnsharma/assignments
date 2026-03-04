import 'package:flutter/material.dart';
import 'package:module03_capstone/core/theme/app_theme.dart';

import 'order_status_page.dart';
import 'user_login_page.dart';

/// User Menu UI matching [user_menu.png]: greeting, "What would you like to eat?", horizontal food cards, flavor filter, "Explore from categories".
/// Drawer matches [user_drawer.png]: cake image, Orders (yellow), Logout (pink).
class UserMenuPage extends StatelessWidget {
  final String userName;

  const UserMenuPage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Hi $userName', style: const TextStyle(fontSize: 18)),
        backgroundColor: const Color(0xFFF3E5F5),
        elevation: 0,
        foregroundColor: Colors.black87,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF3E5F5),
              Color(0xFFE1BEE7),
              Colors.white,
            ],
            stops: [0.0, 0.35, 0.7],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                  child: Text(
                    'What would you like to eat?',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 220,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _flavorChip('All Flavors', selected: true),
                                const SizedBox(width: 12),
                                _flavorChip('Vanilla', selected: false),
                                const SizedBox(width: 12),
                                _flavorChip('Chocolate', selected: false),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(left: 8, right: 16),
                          children: [
                            _foodCard(
                              name: 'Strawberry peanut',
                              price: '1.75',
                              gradient: const [
                                Color(0xFFF8BBD9),
                                Color(0xFFE1BEE7)
                              ],
                              isAdd: true,
                            ),
                            const SizedBox(width: 12),
                            _foodCard(
                              name: 'Strawberry Frosted Peanut',
                              price: '1.7',
                              bgColor: const Color(0xFFFFF8E1),
                              isAdd: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                  child: Text(
                    'Explore from categories',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: _categoryCard(
                          title: 'New this week',
                          gradient: const [
                            Color(0xFFE1BEE7),
                            Color(0xFFFCE4EC)
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _categoryCard(
                          title: 'Best Seller',
                          bgColor: const Color(0xFFB2DFDB),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.brown.shade300, Colors.brown.shade100],
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.cake, size: 80, color: Colors.brown),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const OrderStatusPage(
                                  orderId: '1234542m5322'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.drawerOrdersYellow,
                          foregroundColor: Colors.black87,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Orders'),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const UserLoginPage()),
                            (r) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryPink,
                          foregroundColor: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Logout'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _flavorChip(String label, {required bool selected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        boxShadow: selected
            ? const [BoxShadow(color: Colors.black12, blurRadius: 4)]
            : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _foodCard({
    required String name,
    required String price,
    List<Color>? gradient,
    Color? bgColor,
    required bool isAdd,
  }) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        gradient: gradient != null
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: gradient)
            : null,
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                  child: Icon(Icons.cake, size: 48, color: Colors.brown)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            child: Text(name,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black87)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: isAdd ? Colors.blue : Colors.grey[400],
                  child: Icon(isAdd ? Icons.add : Icons.remove,
                      color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryCard(
      {required String title, List<Color>? gradient, Color? bgColor}) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        gradient: gradient != null
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: gradient)
            : null,
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))
        ],
      ),
      child: Stack(
        children: [
          const Center(
              child: Icon(Icons.dashboard_customize,
                  size: 48, color: Colors.black26)),
          Positioned(
            left: 12,
            right: 12,
            bottom: 12,
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
