import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http_app/bloc/pixabay_image/image_cubit.dart';
import 'package:http_app/bloc/posts/posts_bloc.dart';
import 'package:http_app/utils/env.dart';
import 'package:http_app/widget/hastag_widget.dart';

import 'navigation/route_generator.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HashtagWidget(
      hashtag: "#happynewyear",
      env: Env.devEnv,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ImageCubit>(create: (ctx) => ImageCubit()),
          BlocProvider<PostBloc>(create: (ctx) => PostBloc()),
        ],
        child: MaterialApp(
          title: "Api App",
          initialRoute: "images_bloc",
          onGenerateRoute: customRouteGenerator,
          theme: ThemeData(
            fontFamily: "Montserrat",
            textTheme: TextTheme(
              headline6:
                  GoogleFonts.sevillana(fontSize: 18, color: Color(0xff1f1f1f)),
            ),
          ),
          // home: Homepage(),
        ),
      ),
    );
  }
}
