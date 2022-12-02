import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../util/strings.dart';

class InstagramPost extends StatelessWidget {
  final String username;

  InstagramPost({required this.username});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        /// top user's name and photo section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.network(
                    personImage,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Text(username),
              ],
            ),
            Icon(Icons.more_horiz)
          ],
        ),

        SizedBox(height: 10),

        /// Post's main image
        // Image.network(imageUrl),
        FadeInImage(
          placeholder: AssetImage("asset/images/placeholder.png"),
          image: NetworkImage(imageUrl),
        ),

        /// Like, comment, share , save buttons
        SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(EvilIcons.heart),
                SizedBox(width: 10),
                Icon(EvilIcons.comment),
                SizedBox(width: 10),
                // InkWell(
                //   onTap: () {
                //     print("Do you want to share?");
                //   },
                //   child: Icon(Feather.send),
                // ),
                // IconButton(
                //     onPressed: () {
                //       print("icon button");
                //     },
                //     icon: Icon(Icons.ac_unit_outlined)),
                Image.asset(
                  "asset/icons/send.png",
                  height: 15,
                  width: 15,
                ),

                // SvgPicture.asset('asset/icons/google.svg')
              ],
            ),
            Icon(Icons.bookmark_outline)
          ],
        ),
        SizedBox(height: 10),

        /// Like count
        Text("2875 likes"),
        SizedBox(height: 6),

        Row(
          children: [
            /// caption
            Text("maria  Hi!    q"),
            Text(
              "#worldcup",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ]),
    );
  }
}
