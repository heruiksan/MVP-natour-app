import 'package:flutter/material.dart';
import 'package:natourapps/view/adminWisata/bottomNavAdmin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:natourapps/Controller/wisataController.dart';
import 'package:natourapps/Model/wisataMode.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class addWisata extends StatefulWidget {
  @override
  _addWisataState createState() => _addWisataState();
}

class _addWisataState extends State<addWisata> {
  // Variabel untuk menyimpan nilai dropdown
  String? selectedJenisProduk;
  String? selectedKapasitas;
  String? selectedJumlahStok;
  File? _image;

  // Data dropdown
  final List<String> jenisProdukList = ["A", "B", "C"];
  final List<String> kapasitasList = ["Small", "Medium", "Large"];

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

  // TextEditingController untuk setiap TextField
  TextEditingController namaLahanController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController fasilitasController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController lokasiController = TextEditingController();

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
                        // Menampilkan pilihan untuk mengambil foto dari galeri atau kamera
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
                    // Menampilkan gambar jika sudah ada yang dipilih
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
              buildTextField("Nama Lahan", TextInputType.text, namaLahanController),
              SizedBox(height: 16),
              Text(
                "Deskripsi Lahan",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.blue),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: deskripsiController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    border: InputBorder.none,
                    hintText: "Tambah deskripsi",
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Dropdown untuk Jenis Produk
              buildDropdownField(
                  "Jenis Lahan", selectedJenisProduk, jenisProdukList, (value) {
                setState(() {
                  selectedJenisProduk = value;
                });
              }),
              SizedBox(height: 16),

              // Dropdown untuk Kapasitas
              buildDropdownField("Kapasitas", selectedKapasitas, kapasitasList,
                  (value) {
                setState(() {
                  selectedKapasitas = value;
                });
              }),
              SizedBox(height: 16),
              buildTextField("Fasilitas", TextInputType.text, fasilitasController),
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

                  final wisata = WisataModel(
                    namaLahan: namaLahanController.text, // Text from TextField
                    deskripsi: deskripsiController.text, // Text from TextField
                    jenisLahan: selectedJenisProduk ?? '', // Dropdown value
                    kapasitas: selectedKapasitas ?? '', // Dropdown value
                    fasilitas: fasilitasController.text, // Text from TextField
                    harga: double.tryParse(hargaController.text) ?? 0.0, // Convert text to double
                    lokasi: lokasiController.text, // Text from TextField
                    userId: userId, // User UID from Firebase Authentication
                  );

                  final controller = WisataController();

                  try {
                    await controller.addWisata(wisata);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Data wisata berhasil ditambahkan")),
                    );
                    Navigator.pop(context); // Kembali ke halaman sebelumnya
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Gagal menambahkan data wisata: $e")),
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
                      MaterialPageRoute(builder: (context) => navbarAdmin()));
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
  Widget buildTextField(
      String label, TextInputType inputType, TextEditingController controller) {
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
  Widget buildDropdownField(String label, String? selectedValue,
      List<String> items, Function(String?) onChanged) {
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
          child: DropdownButton<String>(
            value: selectedValue,
            hint: Text("Pilih $label"),
            isExpanded: true,
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (value) => onChanged(value),
          ),
        ),
      ],
    );
  }
}
