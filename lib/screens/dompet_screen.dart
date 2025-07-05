import 'package:flutter/material.dart';

class DompetScreen extends StatelessWidget {
  const DompetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data
    final int saldo = 250000;
    final List<Map<String, dynamic>> riwayat = [
      {
        'tanggal': '2024-07-02',
        'keterangan': 'Order #001 - Bersih-bersih',
        'jumlah': 75000,
      },
      {
        'tanggal': '2024-07-01',
        'keterangan': 'Order #002 - Service AC',
        'jumlah': 175000,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dompet Saya'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Saldo Saat Ini',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('Rp $saldo',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 24),
            const Text('Riwayat Pemasukan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: riwayat.length,
                itemBuilder: (context, index) {
                  final item = riwayat[index];
                  return ListTile(
                    leading: const Icon(Icons.arrow_downward, color: Colors.green),
                    title: Text(item['keterangan']),
                    subtitle: Text(item['tanggal']),
                    trailing: Text('+Rp ${item['jumlah']}',
                        style: const TextStyle(color: Colors.green)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
