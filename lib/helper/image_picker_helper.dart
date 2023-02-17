import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';

var imageListPath = <Uint8List>[];

Future<List<Uint8List>> showImagePicker(int maxImage) async {
  var unit8List = <Uint8List>[];
  final pickedFile = await MultiImagePicker.pickImages(
      enableCamera: true,
      maxImages: maxImage,
      materialOptions: MaterialOptions(
          selectionLimitReachedText: "You can't select any more."),
      cupertinoOptions: CupertinoOptions(selectionCharacter: "✓"));
  for (var asset in pickedFile) {
    var byte = await asset.getByteData();
    var imageByte = byte.buffer.asUint8List();
    unit8List.add(imageByte);
  }
  return unit8List;
}

Future<Uint8List> showImagePickerFile(int maxImage) async {
  final pickedFile = await MultiImagePicker.pickImages(
      enableCamera: true,
      maxImages: maxImage,
      materialOptions: MaterialOptions(
          selectionLimitReachedText: "You can't select any more."),
      cupertinoOptions: CupertinoOptions(selectionCharacter: "✓"));
  var file = await getImageFileFromAssets(pickedFile[0]);
  var unit8List = resizeImage(file);
  return unit8List;
}

Future<File> getImageFileFromAssets(Asset asset) async {
  final byteData = await asset.getByteData();

  final tempFile =
      File("${(await getTemporaryDirectory()).path}/${asset.name}");
  final file = await tempFile.writeAsBytes(
    byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
  );

  return file;
}

Future<File> getImageFileFromAssets2(ByteData byteData, Asset asset) async {
  final tempFile = File("${(await getTemporaryDirectory()).path}/$asset");
  final file = await tempFile.writeAsBytes(
    byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
  );

  return file;
}

Future<Uint8List> resizeImage(File data) async {
  ImageProperties properties =
      await FlutterNativeImage.getImageProperties(data.path);
  File compressedFile = await FlutterNativeImage.compressImage(data.path,
      quality: 80,
      targetWidth: 600,
      targetHeight: (properties.height! * 600 / properties.width!).round());

  var byte = compressedFile.readAsBytesSync();
  return byte;
}

Future<File> showImagePickerOnefile() async {
  final pickedFile = await MultiImagePicker.pickImages(
      enableCamera: true,
      maxImages: 1,
      materialOptions: MaterialOptions(
          selectionLimitReachedText: "You can't select any more."),
      cupertinoOptions: CupertinoOptions(selectionCharacter: "✓"));
  var byte = await pickedFile[0].getByteData();
  File file = await writeToFile(byte);
  return file;
}

Future<File> writeToFile(ByteData data) async {
  File file = await writeToFile(data);
  return file;
}

Future<Uint8List?> showCamera() async {
  final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
  if (pickedFile != null) {
    var byte = await pickedFile.readAsBytes();
    return byte;
  } else {
    return null;
  }
}

Future<File> writeToFile2(Uint8List data, String path) {
  final buffer = data.buffer;
  return new File(path)
      .writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
}

Future<Uint8List?> showCameraResize() async {
  final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
  if (pickedFile != null) {
    var byteDate = await pickedFile.readAsBytes();
    File file = await writeToFile2(byteDate, pickedFile.path);
    var byte = resizeImage(file);
    return byte;
  } else
    return null;
}

Future saveImage(Image image, String imageName) async {
  try {
    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    await ImageGallerySaver.saveImage(pngBytes, quality: 80, name: imageName);
  } catch (e) {
    print(e.toString());
  }
}

//  showImagePickerDialog(BuildContext context) {
//     if (imageListPath.length < maxImage) {
//       imagePickerDialog(context, () => openCamera(),
//           () => openImagePicker(maxImage - imageListPath.length));
//     } else {
//       normalDialog(context, "Your image reach maximum limit.");
//     }
//   }