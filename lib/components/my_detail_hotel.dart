import 'package:flutter/material.dart';
import 'package:toko_rumah/pages/detaildua.dart';
import 'package:toko_rumah/pages/firestore/read_firestore.dart';

class MyDetailHotel extends StatelessWidget{
  const MyDetailHotel({
    super.key,
    required this.detail,
    });
    
    final Widget detail;

  @override
Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Start
          Container(
            height: 205.0,
            width: 375.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: const Color(0xff111111),
              image: const DecorationImage(
                image: AssetImage("assets/img/rumah1.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 15,
                right: 15,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.house,
                          color: Colors.green,
                          size: 28,
                        ),
                        Text(
                          "House",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.favorite_outline,
                        color: Colors.grey,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Gambar End

          // Judul Start
          Container(
            width: MediaQuery.of(context).size.width - 36,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Prime House",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                      size: 26,
                    ),
                    const Text(
                      "4,5",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // Judul End

          // Lokasi Start
          const Padding(
            padding: EdgeInsets.only(left: 21, top: 3),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.grey,
                ),
                Text(
                  "Jl. Wonokromo, Surabaya",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // Lokasi End

          // Jumlah & Harga Start
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 13, bottom: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 76,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.bed_outlined),
                        const Text(
                          "4",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 0.5,
                          color: Colors.grey,
                        ),
                        const Icon(Icons.bathtub_outlined),
                        const Text(
                          "2",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Rp. 300.500.000",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          // Jumlah & Harga End
        ],
      ),
    );
  }
}
