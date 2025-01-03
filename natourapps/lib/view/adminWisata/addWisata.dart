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
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.flag, color: Colors.blue),
            SizedBox(width: screenWidth * 0.02),
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
        padding: EdgeInsets.all(screenWidth * 0.04),
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
                              height: screenWidth * 0.4,
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
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          size: screenWidth * 0.12,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.02),
                    Text(
                      "Foto",
                      style: TextStyle(color: Colors.blue, fontSize: screenWidth * 0.04),
                    ),
                    SizedBox(height: screenWidth * 0.04),
                    // Menampilkan gambar jika sudah ada yang dipilih
                    _image != null
                        ? Image.file(
                            _image!,
                            width: screenWidth * 0.25,
                            height: screenWidth * 0.25,
                            fit: BoxFit.cover,
                          )
                        : Text("Belum ada foto yang dipilih"),
                  ],
                ),
              ),
              SizedBox(height: screenWidth * 0.04),
              buildTextField("Nama Lahan", TextInputType.text, namaLahanController, screenWidth),
              SizedBox(height: screenWidth * 0.04),
              Text(
                "Deskripsi Lahan",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.045,
                    color: Colors.blue),
              ),
              SizedBox(height: screenWidth * 0.02),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.02),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: deskripsiController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    border: InputBorder.none,
                    hintText: "Tambah deskripsi",
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.04),

              // Dropdown untuk Jenis Produk
              buildDropdownField(
                  "Jenis Lahan", selectedJenisProduk, jenisProdukList, (value) {
                setState(() {
                  selectedJenisProduk = value;
                });
              }, screenWidth),
              SizedBox(height: screenWidth * 0.04),

              // Dropdown untuk Kapasitas
              buildDropdownField("Kapasitas", selectedKapasitas, kapasitasList,
                  (value) {
                setState(() {
                  selectedKapasitas = value;
                });
              }, screenWidth),
              SizedBox(height: screenWidth * 0.04),
              buildTextField("Fasilitas", TextInputType.text, fasilitasController, screenWidth),
              SizedBox(height: screenWidth * 0.04),
              buildTextField("Harga", TextInputType.number, hargaController, screenWidth),
              SizedBox(height: screenWidth * 0.04),
              buildTextField("Lokasi", TextInputType.text, lokasiController, screenWidth),

              SizedBox(height: screenWidth * 0.1),
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
                    namaLahan: namaLahanController.text,
                    deskripsi: deskripsiController.text,
                    jenisLahan: selectedJenisProduk ?? '',
                    kapasitas: selectedKapasitas ?? '',
                    fasilitas: fasilitasController.text,
                    harga: double.tryParse(hargaController.text) ?? 0.0,
                    lokasi: lokasiController.text,
                    userId: userId,
                  );

                  final controller = WisataController();

                  try {
                    await controller.addWisata(wisata);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Data wisata berhasil ditambahkan")),
                    );
                    Navigator.pop(context);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Gagal menambahkan data wisata: $e")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text("Simpan", style: TextStyle(color: Colors.white)),
                ),
              ),

              SizedBox(height: screenWidth * 0.02),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => navbarAdmin()));
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
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
      String label, TextInputType inputType, TextEditingController controller, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04, color: Colors.blue),
        ),
        SizedBox(height: screenWidth * 0.02),
        Container(
          padding: EdgeInsets.all(screenWidth * 0.02),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: controller,
            keyboardType: inputType,
            decoration: InputDecoration(
              hintText: "Masukkan $label",
              contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  // Method untuk membuat Dropdown Field
  Widget buildDropdownField(String label, String? selectedValue,
      List<String> items, Function(String?) onChanged, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04, color: Colors.blue),
        ),
        SizedBox(height: screenWidth * 0.02),
        Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
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
