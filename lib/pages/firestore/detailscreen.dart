import 'package:flutter/material.dart';
import 'package:toko_rumah/components/my_detail_facilities.dart';
// import 'package:toko_rumah/components/my_recomen_property.dart';

// class _MyDetailPageState extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Property Details"),
//       ),
//       body: _MyDetailPageState(),
//     );
//   }
// }

class MyDetailPage extends StatefulWidget {
  const MyDetailPage({Key? key}) : super(key: key);

  @override
  State<MyDetailPage> createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<MyDetailPage> {
  @override
   Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image Start
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/house1.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        // Image End

        // Type and Rating Start
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
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
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow[800],
                    size: 26,
                  ),
                  const SizedBox(width: 5),
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
        // Type and Rating End

        // Judul Start
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 5),
          child: Text(
            "The Lalala Residence",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
          ),
        ),
        // Judul End

        // Location Start
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 8),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.grey,
              ),
              Text(
                "Jl. Ahmad Yani, Surabaya",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        // Location End

        // Fasilitas Text Start
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Facilities",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
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
        const SingleChildScrollView(
          padding: EdgeInsets.only(left: 20, right: 20),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              MyDetailFacilities(
                icon: Icons.bed_outlined,
                title: "4 Bedroom",
              ),
              MyDetailFacilities(
                icon: Icons.bathtub_outlined,
                title: "2 Bathroom",
              ),
              MyDetailFacilities(
                icon: Icons.garage_outlined,
                title: "Car Garage",
              ),
              MyDetailFacilities(
                icon: Icons.aspect_ratio,
                title: "42 meter\u00b2",
              ),
            ],
          ),
        ),
        // Fasilitas List End

        // Description Text Start
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
          child: Text(
            "Description",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        // Description Text End

        // Description Start
        const Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
          ),
          child: Text(
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt, nobis excepturi. Cum ipsum sequi deserunt et. Dolor numquam quas illum explicabo possimus exercitationem laboriosam ipsum doloremque rem autem aliquid, soluta aliquam atque voluptate praesentium cupiditate necessitatibus. Cumque, quos corporis doloremque atque incidunt facere mollitia aliquam exercitationem cupiditate consequuntur. Eligendi ad libero deserunt ipsum ab, nam corrupti minima fugit mollitia ipsam?",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.grey,
              letterSpacing: 0.3,
            ),
          ),
        ),
        // Description End

        // Property Agent Start
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/img/goji.png"),
                  ),
                  SizedBox(width: 10),
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
                          SizedBox(width: 5),
                          Icon(
                            Icons.verified,
                            color: Colors.green,
                            size: 20,
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
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
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 16.5,
                      ),
                      child: Icon(
                        Icons.message,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 7),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 16.5,
                      ),
                      child: Icon(
                        Icons.phone,
                        size: 30,
                      ),
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
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: _MyDetailPageState(),
//   ));
// }
