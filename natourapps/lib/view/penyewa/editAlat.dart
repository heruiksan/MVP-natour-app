import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:natourapps/Model/sewaModel.dart';

class EditAlat extends StatefulWidget {
  final String documentId;
  final String userId; // Tambahkan userId untuk menentukan koleksi yang benar
  final AlatModel model;

  EditAlat(
      {required this.documentId, required this.userId, required this.model});

  @override
  _EditAlatState createState() => _EditAlatState();
}

class _EditAlatState extends State<EditAlat> {
  late AlatModel editedModel;

  late TextEditingController namaController;
  late TextEditingController deskripsiController;
  late TextEditingController jumlahStokController;
  late TextEditingController hargaController;
  late TextEditingController lokasiController;

  final List<String> jenisProdukList = ["Elektronik", "Fashion", "Makanan"];
  final List<String> kapasitasList = ["Small", "Medium", "Large"];

  @override
  void initState() {
    super.initState();
    editedModel = widget.model;

    // Inisialisasi controller dengan nilai awal dari model
    namaController = TextEditingController(text: editedModel.namaProduk);
    deskripsiController =
        TextEditingController(text: editedModel.deskripsiProduk);
    jumlahStokController =
        TextEditingController(text: editedModel.jumlahStok.toString());
    hargaController = TextEditingController(text: editedModel.harga.toString());
    lokasiController = TextEditingController(text: editedModel.lokasi);
  }

  @override
  void dispose() {
    // Pastikan controller dibersihkan saat widget dihapus
    namaController.dispose();
    deskripsiController.dispose();
    jumlahStokController.dispose();
    hargaController.dispose();
    lokasiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.edit, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              'Edit Alat',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Foto Section
              Center(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        size: 48,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Foto",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              buildTextField("Nama Produk", namaController, (value) {
                editedModel.namaProduk = value;
              }),
              SizedBox(height: 16),
              Text(
                "Deskripsi Produk",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.blue),
              ),
              SizedBox(height: 8),
              buildTextField("Deskripsi", deskripsiController, (value) {
                editedModel.deskripsiProduk = value;
              }, maxLines: 5),
              SizedBox(height: 16),

              // Dropdown untuk Jenis Produk
              buildDropdownField(
                  "Jenis Produk", editedModel.jenisProduk, jenisProdukList,
                  (value) {
                setState(() => editedModel.jenisProduk = value!);
              }),
              SizedBox(height: 16),

              // Dropdown untuk Kapasitas
              buildDropdownField(
                  "Kapasitas", editedModel.kapasitas, kapasitasList, (value) {
                setState(() => editedModel.kapasitas = value!);
              }),
              SizedBox(height: 16),
              buildTextField("Jumlah Stok", jumlahStokController, (value) {
                editedModel.jumlahStok = int.tryParse(value) ?? 0;
              }, keyboardType: TextInputType.number),
              SizedBox(height: 16),
              buildTextField("Harga", hargaController, (value) {
                editedModel.harga = double.tryParse(value) ?? 0.0;
              }, keyboardType: TextInputType.number),
              SizedBox(height: 16),
              buildTextField("Lokasi", lokasiController, (value) {
                editedModel.lokasi = value;
              }),
              SizedBox(height: 16),

              // Tombol Simpan
              ElevatedButton(
                onPressed: () async {
                  // Validasi untuk memastikan semua field diisi dengan benar
                  if (editedModel.namaProduk.isEmpty ||
                      editedModel.deskripsiProduk.isEmpty ||
                      editedModel.jenisProduk.isEmpty ||
                      editedModel.kapasitas.isEmpty ||
                      editedModel.jumlahStok <= 0 ||
                      editedModel.harga <= 0.0 ||
                      editedModel.lokasi.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('Pastikan semua field terisi dengan benar')),
                    );
                    return;
                  }

                  try {
                    // Ambil data berdasarkan userId dan documentId
                    await FirebaseFirestore.instance
                        .collection('Sewa alat')
                        .doc(widget
                            .userId) // Gunakan userId untuk menentukan koleksi yang tepat
                        .collection('Detail alat')
                        .doc(widget
                            .documentId) // Gunakan documentId untuk menentukan dokumen yang tepat
                        .update(editedModel.toMap());

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Data berhasil diupdate')),
                    );
                    Navigator.pop(context);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Gagal mengupdate data: $e')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text("Simpan", style: TextStyle(color: Colors.white)),
                ),
              ),

              SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {
                  // Aksi tombol batal
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text("Batal", style: TextStyle(color: Colors.blue)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method untuk membuat TextField dalam kotak individu
  Widget buildTextField(String label, TextEditingController controller,
      Function(String) onChanged,
      {TextInputType keyboardType = TextInputType.text, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            keyboardType: keyboardType,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: "Masukkan $label",
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  // Method untuk membuat Dropdown Field
  Widget buildDropdownField(String label, String value, List<String> items,
      Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              hint: Text("Pilih $label"),
              isExpanded: true,
              items: items.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
