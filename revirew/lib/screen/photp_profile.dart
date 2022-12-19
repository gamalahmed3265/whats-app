import 'package:flutter/material.dart';

class PhotoProfile extends StatelessWidget {
  const PhotoProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Image.network(
          "https://cdn.pixabay.com/photo/2021/09/03/15/14/woman-6596029_1280.jpg",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
