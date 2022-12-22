import 'package:flutter/material.dart';
import 'package:http_app/utils/api_service.dart';
import '../widget/instagram_post.dart';

class FutureBScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiService.fetchImages(),
        builder: (context, snapshot) {
          print(snapshot.connectionState);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error!.toString()),
            );
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final data = snapshot.data!;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final oneImage = data[index];

                return InstagramPost(post: oneImage);
              },
            );
          }

          return Text("Unknown state encounted");
        },
      ),
    );
  }
}
