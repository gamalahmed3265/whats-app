// import 'dart:io';

// import 'package:revirew/constent.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';

// class PhotoCanera extends StatefulWidget {
//   PhotoCanera({Key? key}) : super(key: key);

//   @override
//   _PhotoCaneraState createState() => _PhotoCaneraState();
// }

// class _PhotoCaneraState extends State<PhotoCanera> {
//   File? image;
//   Future PickeGallary(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return;
//       // final imageTemporty = File(image!.path);
//       final imageTemporty = await saveImageTemporty(image!.path);
//       setState(() => this.image = imageTemporty);
//     } on PlatformException catch (e) {
//       print("Falid Pick Image ${e.message}");
//     }
//   }

//   Future<File> saveImageTemporty(String imagePath) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final name = basename(imagePath);
//     final iamge = File('${directory.path}\${name}');
//     return File(imagePath).copy(image!.path);
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Container(
//       width: size.width,
//       margin: EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           image != null
//               ? Image.file(
//                   image!,
//                   width: 160,
//                   height: 160,
//                   fit: BoxFit.cover,
//                 )
//               : Container(),
//           ButonRow(
//               icon: Icons.image_outlined,
//               title: "Picke Gallary",
//               onPressed: () => PickeGallary(ImageSource.gallery)),
//           ButonRow(
//               icon: Icons.camera_alt_outlined,
//               title: "Picke Camera",
//               onPressed: () => PickeGallary(ImageSource.camera)),
//         ],
//       ),
//     );
//   }

//   ElevatedButton ButonRow(
//       {required String title,
//       required IconData icon,
//       required VoidCallback onPressed}) {
//     return ElevatedButton(
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all(accentColorg),
//           padding: MaterialStateProperty.all(const EdgeInsets.all(25)),
//         ),
//         onPressed: onPressed,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               flex: 1,
//               child: Icon(
//                 icon,
//                 size: 25,
//               ),
//             ),
//             const SizedBox(
//               width: 20,
//             ),
//             Expanded(
//               flex: 5,
//               child: Text(
//                 "$title",
//                 style: const TextStyle(
//                   fontSize: 25,
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
