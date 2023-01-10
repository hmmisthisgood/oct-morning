import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:start_app/util/file_utils.dart';
import 'package:start_app/util/permissions.dart';
import '../util/strings.dart';

class IgPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    await handleCameraPermission();
                    final files = await pickFile();
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(personImage,
                        height: 50, width: 50, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 10),
                Text("westly.winder"),
              ],
            ),
            InkWell(
              onTap: () {},
              child: Icon(Icons.more_horiz),
            )
          ],
        ),

        // Image.network(imageUrl),
        // Image.asset("asset/images/pool.jpg"),
        // Image.asset("asset/images/pieces.jpg"),

        FadeInImage(
          placeholder: AssetImage("asset/images/placeholder.png"),
          image: NetworkImage(imageUrl),
        ),
        // Image.asset("asset/images/supernova.jpg"),

        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.favorite_border_rounded, size: 32),
                SizedBox(width: 10),
                Icon(Fontisto.comment, size: 28),
                SizedBox(width: 10),
                Icon(Feather.send, size: 28),
              ],
            ),
            Icon(FontAwesome.bookmark_o, size: 32),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Text("Hiii !!!!!"),
            SizedBox(width: 10),
            Text("#hashtag", style: TextStyle(color: Colors.blue))
          ],
        ),
      ]),
    );
  }
}
