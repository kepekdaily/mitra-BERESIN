import 'package:flutter/material.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  List<Map<String, dynamic>> orders = [
    {
      'id': 'ORD001',
      'namaPengguna': 'Haskari Aufa',
      'alamat': 'Jl. Merpati No. 5',
      'layanan': 'Bersih-bersih Rumah',
      'status': 'pending',
    },
    {
      'id': 'ORD002',
      'namaPengguna': 'Budi Santoso',
      'alamat': 'Jl. Kenanga No. 12',
      'layanan': 'Cuci AC',
      'status': 'pending',
    },
  ];

  void _updateStatus(int index, String newStatus) {
    setState(() {
      orders[index]['status'] = newStatus;
    });

    if (newStatus == 'diterima') {
      Navigator.pushReplacementNamed(
        context,
        '/orders',
        arguments: {
          'newOrders': [orders[index]], // kirim pesanan diterima
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Order ${orders[index]['id']} telah $newStatus'),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Order Masuk")),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];

          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(order['layanan']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pengguna: ${order['namaPengguna']}"),
                  Text("Alamat: ${order['alamat']}"),
                  Text("Status: ${order['status']}"),
                ],
              ),
              trailing: order['status'] == 'pending'
                  ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.check, color: Colors.green),
                    onPressed: () => _updateStatus(index, 'diterima'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.red),
                    onPressed: () => _updateStatus(index, 'ditolak'),
                  ),
                ],
              )
                  : Text(
                order['status'],
                style: TextStyle(
                  color: order['status'] == 'diterima'
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
