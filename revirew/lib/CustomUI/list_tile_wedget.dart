import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Widget ListTileWedget(
//   String name,
//   String status,
//   String icon,
//   Color color,
//  Function()? onPressed,
// ) {
//   return InkWell(
//     onTap: onPressed,
//     child: ListTile(
//       title: Text("${name}"),
//       subtitle: Text("${status}"),
//       leading: CircleAvatar(
//         backgroundColor: color,
//         radius: 25,
//         child: SvgPicture.asset(
//           "assets/icons/${icon}",
//           height: 37,
//           width: 37,
//           color: Colors.white,
//         ),
//       ),
//     ),
//   );
// }

class ListTileWedget extends StatelessWidget {
  final String name;
  final String status;
  final String icon;
  final Color color;
  final Function()? onPressed;
  // final Function(bool) onPressed;
  const ListTileWedget(
      {required this.name,
      this.status = "",
      this.icon = "person_black_36dp.svg",
      this.color = Colors.grey,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        title: Text("${name}"),
        subtitle: Text("${status}"),
        leading: CircleAvatar(
          backgroundColor: color,
          radius: 25,
          child: SvgPicture.asset(
            "assets/icons/${icon}",
            height: 37,
            width: 37,
            color: Colors.white,
          ),
        ),
      ),
    );
    ;
  }
}
