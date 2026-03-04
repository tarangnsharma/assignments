import 'package:flutter/material.dart';

import 'package:module03_capstone/core/theme/app_theme.dart';

/// Order Status UI matching [order_status.png]: pink app bar "Order Status", back arrow, pink card with Order Id, Status, 4 progress squares (3 green, 1 white).
class OrderStatusPage extends StatelessWidget {
  final String orderId;

  const OrderStatusPage({super.key, required this.orderId});

  static const int _currentStep = 3; // Out for delivery: 3 steps filled (Order Received, Preparing, Out for delivery)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Order Status'),
        backgroundColor: AppTheme.primaryPink,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: _orderCard(
          orderId: orderId,
          statusText: 'Out for delivery',
          completedSteps: _currentStep,
        ),
      ),
    );
  }
}

Widget _orderCard({
  required String orderId,
  required String statusText,
  required int completedSteps,
}) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppTheme.primaryPink,
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 2))],
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
  );
}
