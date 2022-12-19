import 'package:flutter/material.dart';

class OwnMassegeCard extends StatelessWidget {
  const OwnMassegeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: size.width - 45),
        child: Card(
          color: const Color(0xffdcf8c6),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 1,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 5, right: 30, bottom: 20),
                child: Text(
                    "dmlskd ksdlksdk lksd  kdfld ;dfd skd ksdlksdk lksd lsd lsdlskdl lnsdlsd dmlskd ksdlksdk lksd lsd lsdlskdl lnsdlsd "),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      "20:10",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done_all,
                      size: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
