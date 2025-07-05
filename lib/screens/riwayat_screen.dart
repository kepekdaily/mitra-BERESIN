import 'package:flutter/material.dart';

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final order = args?['completedOrder'] as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Pesanan')),
      body: order == null
          ? const Center(child: Text("Belum ada riwayat."))
          : Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: ListTile(
            leading: const Icon(Icons.history),
            title: Text(order['layanan'] ?? ''),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nama: ${order['namaPengguna']}"),
                Text("Alamat: ${order['alamat']}"),
                const Text("Status: selesai"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
