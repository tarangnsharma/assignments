import 'package:flutter/material.dart';

import 'package:module03_capstone/core/theme/app_theme.dart';

/// Admin dialog matching [admin_dialog_box.png]: Order Number, 4 checkboxes (Order Received, Preparing, Out for Delivery, Order Delivered),
/// Orders / Customer Number / Customer Address, Save button.
class AdminOrderDialog extends StatefulWidget {
  final String orderId;
  final VoidCallback onSave;

  const AdminOrderDialog({super.key, required this.orderId, required this.onSave});

  @override
  State<AdminOrderDialog> createState() => _AdminOrderDialogState();
}

class _AdminOrderDialogState extends State<AdminOrderDialog> {
  final List<bool> _steps = [true, true, true, false]; // Order Received, Preparing, Out for Delivery, Order Delivered
  static const List<String> _stepLabels = [
    'Order Received',
    'Preparing',
    'Out for Delivery',
    'Order Delivered',
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppTheme.primaryPink,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Order Number: ${widget.orderId}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              ...List.generate(4, (i) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: _steps[i],
                          onChanged: (v) => setState(() => _steps[i] = v ?? false),
                          activeColor: Colors.blue,
                          checkColor: Colors.white,
                          fillColor: WidgetStateProperty.resolveWith((_) => Colors.white),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        _stepLabels[i],
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 16),
              const Text('Orders', style: TextStyle(color: Colors.white70, fontSize: 12)),
              const Text('Chocolate brownie cake', style: TextStyle(color: Colors.white, fontSize: 14)),
              const SizedBox(height: 8),
              const Text('Customer Number', style: TextStyle(color: Colors.white70, fontSize: 12)),
              const Text('+919823243', style: TextStyle(color: Colors.white, fontSize: 14)),
              const SizedBox(height: 8),
              const Text('Customer Address:', style: TextStyle(color: Colors.white70, fontSize: 12)),
              const Text(
                'Army and Navy Building, 148, Mahatma Gandhi Road, opposite Kala Ghoda, Mantralaya, Fort, Mumbai, Maharashtra 400001.',
                style: TextStyle(color: Colors.white, fontSize: 12),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () => widget.onSave(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Save', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
