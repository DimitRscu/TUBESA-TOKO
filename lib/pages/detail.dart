import 'package:flutter/material.dart';
import 'package:toko_rumah/components/my_detail_facilities.dart';
// import 'package:toko_rumah/components/my_payment.dart';
import 'package:toko_rumah/pages/account.dart';

class MyDetailPage extends StatefulWidget {
  const MyDetailPage({super.key});

  @override
  State<MyDetailPage> createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<MyDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Property Detail"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Start
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/house1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Image End

            // Type and Rating Start
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.house,
                          color: Colors.white,
                          size: 28,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "House",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[800],
                            size: 26,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "4.5",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue,
                              Colors.green
                            ], // Set your gradient colors
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyAccountPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors
                                .transparent, // Make the button transparent as the color is set by the Container's decoration
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Beli",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors
                                    .white, // Set text color to white or any color that contrasts with your gradient
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // Type and Rating End

            // Judul Start
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text(
                "The Lalala Residence",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
            // Judul End

            // Location Start
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Jl. Ahmad Yani, Surabaya",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
// Location End

// Harga Start
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 8),
              child: Text(
                "Rp. 300.500.000",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
            ),
// Harga End

            // Fasilitas Text Start
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Facilities",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            // Fasilitas Text End

            // Fasilitas List Start
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 15, right: 15),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MyDetailFacilities(
                    icon: Icons.king_bed,
                    title: "4 Bedroom",
                  ),
                  MyDetailFacilities(
                    icon: Icons.bathtub,
                    title: "2 Bathroom",
                  ),
                  MyDetailFacilities(
                    icon: Icons.drive_eta,
                    title: "Car Garage",
                  ),
                  MyDetailFacilities(
                    icon: Icons.aspect_ratio,
                    title: "42 m²",
                  ),
                ],
              ),
            ),
            // Fasilitas List End

            // Description Text Start
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "Description",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            // Description Text End

            // Description Start
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Text(
                "Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt, nobis excepturi. Cum ipsum sequi deserunt et. Dolor numquam quas illum explicabo possimus exercitationem laboriosam ipsum doloremque rem autem aliquid, soluta aliquam atque voluptate praesentium cupiditate necessitatibus. Cumque, quos corporis doloremque atque incidunt facere mollitia aliquam exercitationem cupiditate consequuntur. Eligendi ad libero deserunt ipsum ab, nam corrupti minima fugit mollitia ipsam?",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.black,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            // Description End

            // Property Agent Start
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/img/goji.png"),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Bayu Krian",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Icon(
                                Icons.verified,
                                color: Colors.green,
                                size: 20,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Property Agent",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.grey,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.message,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 7),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.phone,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
// Property Agent End

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
