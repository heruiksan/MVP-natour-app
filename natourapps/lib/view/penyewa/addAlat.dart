import 'package:flutter/material.dart';

class addAlat extends StatefulWidget {
  @override
  _AddAlatState createState() => _AddAlatState();
}

class _AddAlatState extends State<addAlat> {
  // Variabel untuk menyimpan nilai dropdown
  String? selectedJenisProduk;
  String? selectedKapasitas;
  String? selectedJumlahStok;

  // Data dropdown
  final List<String> jenisProdukList = ["Elektronik", "Fashion", "Makanan"];
  final List<String> kapasitasList = ["Small", "Medium", "Large"];

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
              buildTextField("Nama Produk", TextInputType.text),
              SizedBox(height: 16),
              Text(
                "Deskripsi Produk",
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
                  "Jenis Produk", selectedJenisProduk, jenisProdukList,
                  (value) {
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
              buildTextField("Jumlah Stok", TextInputType.number),
              SizedBox(height: 16),
              buildTextField("Harga", TextInputType.number),

              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Aksi tombol simpan
                  print("Jenis Produk: $selectedJenisProduk");
                  print("Kapasitas: $selectedKapasitas");
                  print("Jumlah Stok: $selectedJumlahStok");
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
  Widget buildTextField(String label, TextInputType inputType) {
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
