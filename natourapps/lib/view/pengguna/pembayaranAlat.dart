import 'package:flutter/material.dart';
import 'package:natourapps/view/pengguna/pembayaranBerhasil.dart';


class PembayaranAlat extends StatefulWidget {
  final String gambarAlat;
  final String namaAlat;
  final double ratingAlat;
  final String alamatAlat;
  final String deskripsiAlat;
  final int sisaAlat;
  final int hargaAlat;
  final DateTime selectedDate;
  final int days;
  final double hargaTotal;
  final int jumlahOrang;

  // Constructor untuk menerima data dari halaman sebelumnya
  PembayaranAlat({
    required this.gambarAlat,
    required this.namaAlat,
    required this.ratingAlat,
    required this.alamatAlat,
    required this.deskripsiAlat,
    required this.sisaAlat,
    required this.hargaAlat,
    required this.selectedDate,
    required this.days,
    required this.hargaTotal,
    required this.jumlahOrang,
  });

  @override
  _PembayaranAlatState createState() => _PembayaranAlatState();
}

class _PembayaranAlatState extends State<PembayaranAlat> {
  String? selectedOption;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 208, 234, 255),
      appBar: AppBar(
        title: Text(
          'Pembayaran',
          style: TextStyle(
            fontSize: 24, // Ukuran font
            fontWeight: FontWeight.w900, // Ketebalan font
            color: Colors.blue, // Warna teks
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.blue, // Warna ikon back
        ),
        backgroundColor:
            Color.fromARGB(255, 208, 234, 255), // Warna latar belakang AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(right: 30, left: 30, top: 15, bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Warna bayangan
                      blurRadius: 10, // Ukuran blur bayangan
                      offset: Offset(4, 4), // Posisi bayangan (x, y)
                      spreadRadius: 1, // Lebar penyebaran bayangan
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Row(
                            children: [
                              Image.network(widget.gambarAlat,
                                  fit: BoxFit.cover, height: 50, width: 50),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rp${widget.hargaAlat / widget.days}/Barang/Malam',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Text(
                                    '${widget.alamatAlat}',
                                    style: TextStyle(color: Colors.blue),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 8.0, bottom: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Metode Pembayaran',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blue),
                    ),
                  ),
                  buildRadioTile(
                    context,
                    Icons.store_outlined,
                    'Indomaret atau Alfamart',
                    'indomaret',
                  ),
                  buildRadioTile(
                    context,
                    Icons.card_membership_outlined,
                    'Kartu Kredit',
                    'credit_card',
                  ),
                  buildRadioTile(
                    context,
                    Icons.monetization_on_outlined,
                    'Transfer Bank',
                    'bank_transfer',
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(right: 30, left: 30, top: 0, bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Warna bayangan
                      blurRadius: 10, // Ukuran blur bayangan
                      offset: Offset(4, 4), // Posisi bayangan (x, y)
                      spreadRadius: 1, // Lebar penyebaran bayangan
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.description_outlined,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Detail Pembayaran',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 4.0, top: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Nama Alat',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(
                                        255, 110, 190, 255)),
                              ),
                              Text(
                                '${widget.namaAlat}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.blue),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 4.0, top: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tanggal',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(
                                        255, 110, 190, 255)),
                              ),
                              Text(
                                '${widget.selectedDate}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.blue),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 4.0, top: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(
                                        255, 110, 190, 255)),
                              ),
                              Text(
                                'Rp${widget.hargaAlat/widget.days}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.blue),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 4.0, top: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Jumlah',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(
                                        255, 110, 190, 255)),
                              ),
                              Text(
                                '${widget.jumlahOrang} Barang',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.blue),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 4.0, top: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Malam',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(
                                        255, 110, 190, 255)),
                              ),
                              Text(
                                '${widget.days} Malam',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.blue),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 0.0, top: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '------------------------------------------------',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: const Color.fromARGB(
                                        255, 110, 190, 255)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 4.0, top: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(
                                        255, 110, 190, 255),
                                    fontSize: 16),
                              ),
                              Text(
                                'Rp${widget.hargaTotal}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Colors.blue),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:30.0, right: 30, bottom: 30, top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PembayaranBerhasil(
                                  
                                ),
                              ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Membuat sudut membulat
                  ),
                  backgroundColor: Colors.blue, // Warna latar belakang
                  elevation: 8, // Menambahkan bayangan
                  shadowColor: Colors.blueAccent, // Warna bayangan
                ),
                child: Container(
                  width: double.infinity, // Atur lebar tombol
                  height: 50,
                  alignment: Alignment.center, // Agar teks berada di tengah
                  child: const Text(
                    'Bayar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRadioTile(
      BuildContext context, IconData iconData, String text, String value) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 30,
        color: Colors.blue, // Warna ikon
      ),
      title: Text(
        text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
      trailing: Radio<String>(
        value: value,
        groupValue: selectedOption,
        onChanged: (String? newValue) {
          setState(() {
            selectedOption = newValue;
          });
        },
        activeColor: Colors.blue,
      ),
    );
  }
}
