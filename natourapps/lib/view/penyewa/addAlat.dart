import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:natourapps/Controller/sewaController.dart';
import 'package:natourapps/Model/sewaModel.dart';
import 'package:natourapps/view/penyewa/bottomNavPenyewa.dart';

class addAlat extends StatefulWidget {
  @override
  _AddAlatState createState() => _AddAlatState();
}

class _AddAlatState extends State<addAlat> {
  // Variabel untuk menyimpan nilai dropdown
  String? selectedJenisProduk;
  String? selectedKapasitas;
  File? _image;

  // Data dropdown
  final List<String> jenisProdukList = ["Elektronik", "Fashion", "Makanan"];
  final List<String> kapasitasList = ["Small", "Medium", "Large"];

  // TextEditingController untuk setiap TextField
  final TextEditingController namaProdukController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController jumlahStokController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController lokasiController = TextEditingController();

  // Fungsi untuk memilih gambar dari kamera atau galeri
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Simpan file gambar
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.flag, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              'Posting',
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
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 150,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.camera_alt),
                                    title: Text("Ambil Foto dengan Kamera"),
                                    onTap: () {
                                      _pickImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.image),
                                    title: Text("Pilih Foto dari Galeri"),
                                    onTap: () {
                                      _pickImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
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
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Foto",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    _image != null
                        ? Image.file(
                            _image!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        : Text("Belum ada foto yang dipilih"),
                  ],
                ),
              ),
              SizedBox(height: 16),
              buildTextField("Nama Produk", TextInputType.text, namaProdukController),
              SizedBox(height: 16),
              buildTextField("Deskripsi Produk", TextInputType.text, deskripsiController, maxLines: 5),
              SizedBox(height: 16),
              buildDropdownField("Jenis Produk", selectedJenisProduk, jenisProdukList, (value) {
                setState(() {
                  selectedJenisProduk = value;
                });
              }),
              SizedBox(height: 16),
              buildDropdownField("Kapasitas", selectedKapasitas, kapasitasList, (value) {
                setState(() {
                  selectedKapasitas = value;
                });
              }),
              SizedBox(height: 16),
              buildTextField("Jumlah Stok", TextInputType.number, jumlahStokController),
              SizedBox(height: 16),
              buildTextField("Harga", TextInputType.number, hargaController),
              SizedBox(height: 16),
              buildTextField("Lokasi", TextInputType.text, lokasiController),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  final userId = FirebaseAuth.instance.currentUser?.uid;

                  if (userId == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Gagal mendapatkan ID pengguna")),
                    );
                    return;
                  }

                  final sewaAlat = AlatModel(
                    namaProduk: namaProdukController.text,
                    deskripsiProduk: deskripsiController.text,
                    jenisProduk: selectedJenisProduk ?? '',
                    kapasitas: selectedKapasitas ?? '',
                    jumlahStok: int.tryParse(jumlahStokController.text) ?? 0,
                    harga: double.tryParse(hargaController.text) ?? 0.0,
                    lokasi: lokasiController.text,
                    userId: userId,
                  );

                  final controller = Sewacontroller();

                  try {
                    await controller.addsewaAlat(sewaAlat);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Data alat berhasil ditambahkan")),
                    );
                    Navigator.pop(context);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Gagal menambahkan data alat: $e")),
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => navbarPenyewa()));
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

  Widget buildTextField(String label, TextInputType inputType, TextEditingController controller, {int maxLines = 1}) {
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
            keyboardType: inputType,
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

  Widget buildDropdownField(String label, String? selectedValue, List<String> items, Function(String?) onChanged) {
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
              value: selectedValue,
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
