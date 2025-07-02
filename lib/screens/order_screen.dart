import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final orders = args?['newOrders'] as List<Map<String, dynamic>>? ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesanan Masuk'),
      ),
      body: orders.isEmpty
          ? const Center(child: Text("Belum ada pesanan."))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.assignment_turned_in),
              title: Text(order['nama']),
              subtitle: Text(order['alamat']),
            ),
          );
        },
      ),
    );
  }
}
