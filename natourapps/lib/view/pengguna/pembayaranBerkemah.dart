import 'package:flutter/material.dart';
import 'package:natourapps/view/pengguna/pembayaranBerhasil.dart';

class PembayaranBerkemah extends StatefulWidget {
  final String namaLokasi;
  final String alamatLokasi;
  final String deskripsiLokasi;
  final String kapasitas;
  final double hargaLokasi;
  final DateTime selectedDate;
  final int nights;
  final double hargaTotal;
  final int jumlahOrang;

  // Constructor untuk menerima data dari halaman sebelumnya
  PembayaranBerkemah({
    required this.namaLokasi,
    required this.alamatLokasi,
    required this.deskripsiLokasi,
    required this.kapasitas,
    required this.hargaLokasi,
    required this.selectedDate,
    required this.nights,
    required this.hargaTotal,
    required this.jumlahOrang,
  });

  @override
  _PembayaranBerkemahState createState() => _PembayaranBerkemahState();
}

class _PembayaranBerkemahState extends State<PembayaranBerkemah> {
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
                              // Menampilkan gambar Alat
                              // Container(
                              //   color: Colors
                              //       .blueGrey, // Set your desired background color here
                              //   child: SizedBox(
                              //     height: 250,
                              //     width: double.infinity,
                              //     child: Center(
                              //       child: Text(
                              //         '250x250',
                              //         style: TextStyle(
                              //             color: Colors.grey, fontSize: 12),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rp${widget.hargaLokasi / widget.nights}/Orang/Malam',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Text(
                                    '${widget.alamatLokasi}',
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
              padding: EdgeInsets.only(right: 30, left: 30, top: 0, bottom: 15),
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
                                'Nama Lokasi',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(
                                        255, 110, 190, 255)),
                              ),
                              Text(
                                '${widget.namaLokasi}',
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
                                'Rp${widget.hargaLokasi / widget.nights}',
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
                                '${widget.jumlahOrang} Orang',
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
                                '${widget.nights} Malam',
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
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30, bottom: 30, top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PembayaranBerhasil(),
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
