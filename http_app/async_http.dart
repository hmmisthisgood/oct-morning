main() async {
  print("1.");

  final data = await serverRequest();

  serverRequest().then((data) {
    print(data);
  }).catchError((e) {});

  print("5.");
}

Future<List> serverRequest() async {
  print("2.");

  await Future.delayed(Duration(seconds: 2), () {
    print("3. this is delayed");
  });

  print("4.");
  return [];
}

// async: 
/// - network requets (api call)
// IO, file reading ,file writing
// Permissions



/// Future

/// then , catchError 
// async , await  


/// try catcch