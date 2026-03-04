import 'package:flutter/material.dart';

import 'package:module03_capstone/core/theme/app_theme.dart';
import 'admin_order_dialog.dart';

/// Admin Panel UI matching [admin_panel.png]: pink app bar "Admin Panel", list of order cards (Order Id, Status, 4 progress squares).
class AdminPanelPage extends StatelessWidget {
  const AdminPanelPage({super.key});

  static const List<({String id, String status, int completedSteps})> _orders = [
    (id: '1234542m5322', status: 'Out for delivery', completedSteps: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Admin Panel'),
        backgroundColor: AppTheme.primaryPink,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          final o = _orders[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _AdminOrderCard(
              orderId: o.id,
              statusText: o.status,
              completedSteps: o.completedSteps,
              onTap: () => _showOrderDialog(context, o.id),
            ),
          );
        },
      ),
    );
  }

  void _showOrderDialog(BuildContext context, String orderId) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AdminOrderDialog(
        orderId: orderId,
        onSave: () => Navigator.pop(ctx),
      ),
    );
  }
}

class _AdminOrderCard extends StatelessWidget {
  final String orderId;
  final String statusText;
  final int completedSteps;
  final VoidCallback onTap;

  const _AdminOrderCard({
    required this.orderId,
    required this.statusText,
    required this.completedSteps,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.primaryPink,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Order Id:', style: TextStyle(color: Colors.white70, fontSize: 12)),
                    const SizedBox(height: 4),
                    Text(
                      orderId,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Status: $statusText', style: const TextStyle(color: Colors.white, fontSize: 13)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(4, (i) {
                      final filled = i < completedSteps;
                      return Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.only(left: 4),
                        decoration: BoxDecoration(
                          color: filled ? AppTheme.progressGreen : Colors.white,
                          border: filled ? null : Border.all(color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
