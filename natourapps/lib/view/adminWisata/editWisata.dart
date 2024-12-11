import 'package:flutter/material.dart';

class EditWisata extends StatefulWidget {
  // Initial values to pre-fill the form
  final String initialNamaLahan;
  final String initialDeskripsiLahan;
  final String initialJenisLahan;
  final String initialKapasitas;
  final String initialFasilitas;
  final String initialHarga;

  EditWisata({
    required this.initialNamaLahan,
    required this.initialDeskripsiLahan,
    required this.initialJenisLahan,
    required this.initialKapasitas,
    required this.initialFasilitas,
    required this.initialHarga,
  });

  @override
  _EditWisataState createState() => _EditWisataState();
}

class _EditWisataState extends State<EditWisata> {
  // Variabel untuk menyimpan nilai dropdown
  String? selectedJenisLahan;
  String? selectedKapasitas;

  // Data dropdown
  final List<String> jenisLahanList = ["A", "B", "C"];
  final List<String> kapasitasList = ["Small", "Medium", "Large"];

  // Controllers for the text fields
  final TextEditingController namaLahanController = TextEditingController();
  final TextEditingController deskripsiLahanController =
      TextEditingController();
  final TextEditingController fasilitasController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current data
    namaLahanController.text = widget.initialNamaLahan;
    deskripsiLahanController.text = widget.initialDeskripsiLahan;
    selectedJenisLahan = widget.initialJenisLahan;
    selectedKapasitas = widget.initialKapasitas;
    fasilitasController.text = widget.initialFasilitas;
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
              'Edit Posting',
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
              buildTextField(
                  "Nama Lahan", namaLahanController, TextInputType.text),
              SizedBox(height: 16),
              Text(
                "Deskripsi Lahan",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.blue),
              ),
              SizedBox(height: 8),
              buildTextField(
                  "Deskripsi", deskripsiLahanController, TextInputType.text,
                  maxLines: 5),
              SizedBox(height: 16),

              // Dropdown untuk Jenis Lahan
              buildDropdownField(
                  "Jenis Lahan", selectedJenisLahan, jenisLahanList, (value) {
                setState(() {
                  selectedJenisLahan = value;
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
                  "Fasilitas", fasilitasController, TextInputType.text),
              SizedBox(height: 16),
              buildTextField("Harga", hargaController, TextInputType.number),

              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Aksi tombol simpan untuk update
                  print("Nama Lahan: ${namaLahanController.text}");
                  print("Deskripsi Lahan: ${deskripsiLahanController.text}");
                  print("Jenis Lahan: $selectedJenisLahan");
                  print("Kapasitas: $selectedKapasitas");
                  print("Fasilitas: ${fasilitasController.text}");
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
