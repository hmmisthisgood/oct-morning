import 'dart:io';

import 'package:file_picker/file_picker.dart';

pickFile() async {
  final result = await FilePicker.platform.pickFiles();
  List<PlatformFile> files = [];
  if (result != null) {
    files = result.files;
    final totalCount = result.count;

    final PlatformFile firstFile = files[0];

    /// this is dart native file
    final File imagefile = File(firstFile.path!);
  }
  return files;
}
