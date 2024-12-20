import 'package:flutter/material.dart';

class EditAlat extends StatefulWidget {
  final String initialName;
  final String initialDescription;
  final String initialJenisProduk;
  final String initialKapasitas;
  final String initialStok;
  final String initialHarga;

  EditAlat({
    required this.initialName,
    required this.initialDescription,
    required this.initialJenisProduk,
    required this.initialKapasitas,
    required this.initialStok,
    required this.initialHarga,
  });

  @override
  _EditAlatState createState() => _EditAlatState();
}

class _EditAlatState extends State<EditAlat> {
  // Variabel untuk menyimpan nilai dropdown
  String? selectedJenisProduk;
  String? selectedKapasitas;
  String? selectedJumlahStok;

  // Data dropdown
  final List<String> jenisProdukList = ["Elektronik", "Fashion", "Makanan"];
  final List<String> kapasitasList = ["Small", "Medium", "Large"];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController stokController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current data
    nameController.text = widget.initialName;
    descriptionController.text = widget.initialDescription;
    selectedJenisProduk = widget.initialJenisProduk;
    selectedKapasitas = widget.initialKapasitas;
    stokController.text = widget.initialStok;
    hargaController.text = widget.initialHarga;
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
              buildTextField("Nama Produk", nameController, TextInputType.text),
              SizedBox(height: 16),
              Text(
                "Deskripsi Produk",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.blue),
              ),
              SizedBox(height: 8),
              buildTextField(
                  "Deskripsi", descriptionController, TextInputType.text,
                  maxLines: 5),
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
              buildTextField(
                  "Jumlah Stok", stokController, TextInputType.number),
              SizedBox(height: 16),
              buildTextField("Harga", hargaController, TextInputType.number),

              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Aksi tombol simpan untuk update
                  print("Nama Produk: ${nameController.text}");
                  print("Deskripsi Produk: ${descriptionController.text}");
                  print("Jenis Produk: $selectedJenisProduk");
                  print("Kapasitas: $selectedKapasitas");
                  print("Jumlah Stok: ${stokController.text}");
                  print("Harga: ${hargaController.text}");
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
  Widget buildTextField(
      String label, TextEditingController controller, TextInputType inputType,
      {int? maxLines}) {
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
