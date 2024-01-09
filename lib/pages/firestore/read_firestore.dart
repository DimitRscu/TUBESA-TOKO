import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreRead extends StatefulWidget {
  const FirestoreRead({Key? key}) : super(key: key);

  @override
  State<FirestoreRead> createState() => _FirestoreReadState();
}

class _FirestoreReadState extends State<FirestoreRead> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.amber],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/img/goji.png'),
                radius: 24,
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Admin Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                Text(
                  'Hanif Guntur L',
                  style: TextStyle(
                    fontSize: 14,
                    color:  Color.fromARGB(255, 151, 151, 151),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/img/guntur.png',
              width: 90, // Set the width as per your preference
              height: 58, // Set the height as per your preference
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _db.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error fetching data",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            );
          }

          // Extract data
          var userData = snapshot.data!.docs;

          return ListView.builder(
            itemCount: userData.length,
            itemBuilder: (context, index) {
              final firstName = userData[index].data()['first'];
              final lastName = userData[index].data()['last'];
              final bornYear = userData[index].data()['born'];

              return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$firstName $lastName',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Born: $bornYear',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Handle tap on a user item if needed
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a new user
          final newUser = <String, dynamic>{
            "first": "Guntur",
            "last": "Hanif",
            "born": 1945,
          };
          _db.collection("users").add(newUser).then(
                (DocumentReference doc) =>
                    print('DocumentSnapshot added with ID: ${doc.id}'),
              );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.amber[400],
      ),
    );
  }
}
