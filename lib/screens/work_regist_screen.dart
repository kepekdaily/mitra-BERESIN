import 'package:flutter/material.dart';

class WorkregistScreen extends StatefulWidget {
  const WorkregistScreen({super.key});

  @override
  State<WorkregistScreen> createState() => _WorkregistScreenState();
}

class _WorkregistScreenState extends State<WorkregistScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController customCategoryController =
      TextEditingController();

  String? selectedCategory;

  final List<String> jobCategories = [
    'Otomotif',
    'Cleaning Service',
    'Jasa Angkut',
    'Tukang Bangunan',
    'Service Elektronik',
    'Lainnya',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pendaftaran Layanan"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Dropdown Kategori Pekerjaan
              DropdownButtonFormField<String>(
                value: selectedCategory,
                items: jobCategories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Kategori Pekerjaan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null ? 'Pilih kategori pekerjaan' : null,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Tampilkan form custom jika "Lainnya" dipilih
              if (selectedCategory == 'Lainnya')
                TextFormField(
                  controller: customCategoryController,
                  decoration: const InputDecoration(
                    labelText: 'Tulis jenis pekerjaan Anda',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (selectedCategory == 'Lainnya' &&
                        (value == null || value.isEmpty)) {
                      return 'Jenis pekerjaan wajib diisi';
                    }
                    return null;
                  },
                ),

              if (selectedCategory == 'Lainnya') const SizedBox(height: 16),

              // Deskripsi, Harga, Area, Jam Kerja
              TextFormField(
                controller: descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi Layanan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Deskripsi wajib diisi' : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Harga Layanan (Rp)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Harga wajib diisi' : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: areaController,
                decoration: const InputDecoration(
                  labelText: 'Area Layanan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Area layanan wajib diisi' : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: timeController,
                decoration: const InputDecoration(
                  labelText: 'Jam Kerja (contoh: 08.00 - 17.00)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Jam kerja wajib diisi' : null,
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Pendaftaran berhasil!')),
                    );

                    // Navigasi ke halaman login setelah delay singkat
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.pushReplacementNamed(context, '/login');
                    });
                  }
                },
                child: const Text("Daftar Sekarang",
                    style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
