import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

final _imagePicker = ImagePicker();
final _filePicker = FilePicker.platform;

Future<File> imagePicker() async {
  return File(
      (await _imagePicker.pickImage(source: ImageSource.gallery))!.path);
}

Future<File> filePicker() async {
  return File((await _filePicker.pickFiles(allowedExtensions: ['jpg', 'pdf', 'doc']))!.files.single.path!);
}
