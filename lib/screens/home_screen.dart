// import 'package:basic_app/screens/note_editor.dart';
// import 'package:basic_app/screens/note_reader.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'afterlogin.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       appBar: AppBar(
//         elevation: 0.0,
//         title: const Text("Predictions"),
//         centerTitle: true,
//         backgroundColor: Colors.blueGrey,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Your Data",
//               style: GoogleFonts.roboto(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 22,
//               ),
//             ),
//             const SizedBox(
//               height: 20.0,
//             ),
//             Expanded(
//               child: StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection("predictions")
//                     .snapshots(),
//                 builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   if (snapshot.hasData) {
//                     return GridView(
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2),
//                       children: snapshot.data!.docs
//                           .map((note) => noteCard(() {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           NoteReaderScreen(note),
//                                     ));
//                               }, note))
//                           .toList(),
//                     );
//                   }
//                   return Text(
//                     "No Notes present",
//                     style: GoogleFonts.nunito(color: Colors.white),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => AfterLogin()));
//         },
//         label: const Text("Add Notes"),
//         icon: const Icon(Icons.add),
//       ),
//     );
//   }
// }
