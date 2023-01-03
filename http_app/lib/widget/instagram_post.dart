import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:http_app/model/pixabay_image.dart';
import 'package:http_app/widget/hastag_widget.dart';

class InstagramPost extends StatelessWidget {
  final PixabayImage post;
  final String? hashtag;
  InstagramPost({required this.post, this.hashtag});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final newHashtag = HashtagWidget.of(context).hashtag;

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
                    post.userImageUrl,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Text(post.user),
              ],
            ),
            Icon(Icons.more_horiz)
          ],
        ),

        SizedBox(height: 10),

        /// Post's main image
        // Image.network(imageUrl),
        // FadeInImage(
        //   placeholder: AssetImage("asset/images/placeholder.png"),
        //   image: NetworkImage(post.largeImageUrl),
        // ),
        CachedNetworkImage(
          imageUrl: post.largeImageUrl,
          errorWidget: (context, image, errror) => Text("Could not load image"),
          placeholder: (context, image) => Container(
            color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
                Random().nextInt(255), 0.7),
            height: 200,
            width: double.infinity,
          ),
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
                InkWell(
                  onTap: () {
                    print("Do you want to share?");
                  },
                  child: Icon(Feather.send),
                ),
                // IconButton(
                //     onPressed: () {
                //       print("icon button");
                //     },
                //     icon: Icon(Icons.ac_unit_outlined)),
                // Image.asset(
                //   "asset/icons/send.png",
                //   height: 15,
                //   width: 15,
                // ),

                // SvgPicture.asset('asset/icons/google.svg')
              ],
            ),
            Icon(Icons.bookmark_outline)
          ],
        ),
        SizedBox(height: 10),

        /// Like count
        Text("${post.likes} likes"),
        SizedBox(height: 6),

        Row(
          children: [
            /// caption
            Text("${post.tags}"),
            Text(hashtag!, style: TextStyle(color: Colors.blue)),
            Expanded(
              child: Text(
                newHashtag,
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
