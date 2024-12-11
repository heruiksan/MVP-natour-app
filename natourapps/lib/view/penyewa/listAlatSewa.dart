import 'package:flutter/material.dart';

class listAlatSewa extends StatefulWidget {
  @override
  _listAlatSewaState createState() => _listAlatSewaState();
}

class _listAlatSewaState extends State<listAlatSewa> {
  final List<Map<String, dynamic>> items = [
    {
      "title": "Eiger Tent",
      "capacity": "4 capacity tent",
      "price": "Rp35.000/day",
      "rating": 5.0,
      "location": "Wonosobo, Jawa Tengah",
      "imageUrl": "https://via.placeholder.com/150",
    },
    {
      "title": "Arei Tent",
      "capacity": "4 capacity tent",
      "price": "Rp30.000/day",
      "rating": 5.0,
      "location": "Wonosobo, Jawa Tengah",
      "imageUrl": "https://via.placeholder.com/150",
    },
    {
      "title": "Arei Tent",
      "capacity": "4 capacity tent",
      "price": "Rp27.000/day",
      "rating": 4.9,
      "location": "Wonosobo, Jawa Tengah",
      "imageUrl": "https://via.placeholder.com/150",
    },
    {
      "title": "Eiger Tent",
      "capacity": "3 capacity tent",
      "price": "Rp25.000/day",
      "rating": 4.7,
      "location": "Wonosobo, Jawa Tengah",
      "imageUrl": "https://via.placeholder.com/150",
    },
    {
      "title": "Consina Tent",
      "capacity": "4 capacity tent",
      "price": "Rp27.000/day",
      "rating": 4.7,
      "location": "Wonosobo, Jawa Tengah",
      "imageUrl": "https://via.placeholder.com/150",
    },
  ];

  void _editItem(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Edit item: ${items[index]['title']}')),
    );
  }

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Deleted item: ${items[index]['title']}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/profile.png'),
              backgroundColor: Colors.blue,
            ),
            SizedBox(width: 8),
            Text(
              "Penyewaan",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Tombol Posting Baru
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Posting baru",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Expanded untuk ListView agar diskroll
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Clicked on ${item['title']}")),
                      );
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                            child: Image.network(
                              item['imageUrl'],
                              width: 150,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        item['title'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      PopupMenuButton<String>(
                                        onSelected: (value) {
                                          if (value == 'Edit') {
                                            _editItem(index);
                                          } else if (value == 'Delete') {
                                            _deleteItem(index);
                                          }
                                        },
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                            value: 'Edit',
                                            child: Text('Edit'),
                                          ),
                                          PopupMenuItem(
                                            value: 'Delete',
                                            child: Text('Delete'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Text(item['capacity'],
                                      style: TextStyle(fontSize: 12)),
                                  Text(
                                    item['price'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          size: 14, color: Colors.amber),
                                      SizedBox(width: 4),
                                      Text(item['rating'].toString(),
                                          style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                  Text(item['location'],
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
