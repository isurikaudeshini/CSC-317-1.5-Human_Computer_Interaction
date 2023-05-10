import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:path/path.dart' as p;
import 'package:http/http.dart' as http;

import '../utils/colors.dart';

class SizePrediction extends StatefulWidget {
  const SizePrediction({super.key, required this.title});
  final String title;

  @override
  State<SizePrediction> createState() => _SizePredictionState();
}

class _SizePredictionState extends State<SizePrediction> {
  File? imageFile;
  String? _textData;
  double? parsedValue;
  bool isLoading = false;
  bool afterLoading = false;

  Future sendImageToServer() async {
    print('Sending Image to Server... ============');

    var url = 'http://ec2-3-90-50-142.compute-1.amazonaws.com/image';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files
        .add(await http.MultipartFile.fromPath('img', imageFile!.path));
    var response = await request.send();

    print('Response status: ${response.statusCode}');

    response.stream.transform(utf8.decoder).listen((value) {
      setState(() {
        isLoading = false;
        _textData = value;
        parsedValue = double.parse(_textData!.split(":")[1].trim());
        afterLoading = true;
      });
    });
  }

  Future resetPage() async {
    setState(() {
      afterLoading = false;
      isLoading = false;
      imageFile = null;
      _textData = 'Loading...';
    });
  }

  Future pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: source,
        imageQuality: 50,
      );
      if (pickedFile == null) return;

      var imageTemp = File(pickedFile.path);
      imageTemp = await compressImage(imageTemp.path, 50);

      setState(() {
        isLoading = true;
        imageFile = imageTemp;
      });

      try {
        await sendImageToServer();
      } catch (e) {
        print(e);
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> compressImage(String path, int quality) async {
    final newPath = p.join((await getTemporaryDirectory()).path,
        '${DateTime.now()}.${p.extension(path)}');

    final result = await FlutterImageCompress.compressAndGetFile(path, newPath,
        quality: quality);

    return result!;
  }

  double getUS(double cm) {
    if (cm <= 23.5) return 6;
    if (cm <= 24.1) return 6.5;
    if (cm <= 24.4) return 7;
    if (cm <= 24.8) return 7.5;
    if (cm <= 25.4) return 8;
    if (cm <= 25.7) return 8.5;
    if (cm <= 26) return 9;
    if (cm <= 26.7) return 9.5;
    if (cm <= 27) return 10;
    if (cm <= 27.3) return 10.5;
    if (cm <= 27.9) return 11;
    if (cm <= 28.3) return 11.5;
    if (cm <= 28.6) return 12;
    if (cm <= 29.4) return 13;
    if (cm <= 30.2) return 14;
    if (cm <= 31) return 15;
    return -1;
  }

  double getEURO(double cm) {
    if (cm <= 23.5) return 39;
    if (cm <= 24.1) return 39;
    if (cm <= 24.4) return 40;
    if (cm <= 24.8) return 40.5;
    if (cm <= 25.4) return 41;
    if (cm <= 25.7) return 41.5;
    if (cm <= 26) return 42;
    if (cm <= 26.7) return 42.5;
    if (cm <= 27) return 43.5;
    if (cm <= 27.3) return 43.75;
    if (cm <= 27.9) return 44.5;
    if (cm <= 28.3) return 44.5;
    if (cm <= 28.6) return 45.5;
    if (cm <= 29.4) return 46.5;
    if (cm <= 30.2) return 47.5;
    if (cm <= 31) return 48.5;
    return -1;
  }

  double getUK(double cm) {
    if (cm <= 23.5) return 5.5;
    if (cm <= 24.1) return 6;
    if (cm <= 24.4) return 6.5;
    if (cm <= 24.8) return 7;
    if (cm <= 25.4) return 7.5;
    if (cm <= 25.7) return 8;
    if (cm <= 26) return 8.5;
    if (cm <= 26.7) return 9;
    if (cm <= 27) return 9.5;
    if (cm <= 27.3) return 10;
    if (cm <= 27.9) return 10.5;
    if (cm <= 28.3) return 11;
    if (cm <= 28.6) return 11.5;
    if (cm <= 29.4) return 12.5;
    if (cm <= 30.2) return 13.5;
    if (cm <= 31) return 14.5;
    return -1;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        backgroundColor: const Color.fromARGB(255, 229, 232, 234),
        body: Column(
          children: [
            const Spacer(),
            imageFile == null
                ? const Text(
                    'No Image Selected',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Column(
                    children: [
                      Image.file(
                        imageFile!,
                        width: MediaQuery.of(context).size.width * 0.65,
                        height: MediaQuery.of(context).size.height * 0.4,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 15),
                      isLoading
                          ? const SpinKitThreeBounce(
                              color: Colors.white,
                              size: 35.0,
                            )
                          : DataTable(columns: const [
                              DataColumn(label: Text('Unit')),
                              DataColumn(label: Text('Value'))
                            ], rows: [
                              DataRow(cells: [
                                const DataCell(Text('US')),
                                DataCell(Text(getUS(parsedValue!).toString()))
                              ]),
                              DataRow(cells: [
                                const DataCell(Text('Euro')),
                                DataCell(Text(getEURO(parsedValue!).toString()))
                              ]),
                              DataRow(cells: [
                                const DataCell(Text('UK')),
                                DataCell(Text(getEURO(parsedValue!).toString()))
                              ]), DataRow(cells: [
                                const DataCell(Text('cm')),
                                DataCell(Text(parsedValue!.toStringAsFixed(2)))
                              ])
                            ]),

                      // Text(parsedValue.toString()),
                    ],
                  ),
            const Spacer(),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Image Upload and Get Prediction',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            afterLoading
                ? const SizedBox()
                : SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: buildButton(
                      title: 'Pick Gallery Image',
                      icon: Icons.image_outlined,
                      onClicked: () => pickImage(ImageSource.gallery),
                    ),
                  ),
            const SizedBox(height: 12),
            afterLoading
                ? const SizedBox()
                : SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: buildButton(
                      title: 'Pick Camera Image',
                      icon: Icons.camera_alt_outlined,
                      onClicked: () => pickImage(ImageSource.camera),
                    ),
                  ),
            afterLoading
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: buildButton(
                      title: 'Back to Check Page',
                      icon: Icons.camera_alt_outlined,
                      onClicked: () => resetPage(),
                    ),
                  )
                : const SizedBox(),
            const Spacer()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text("Guide to using the module"),
                      content: SingleChildScrollView(
                        child: ListBody(children: const <Widget>[
                          Text('Step 1:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Place an A4 size paper on the floor.'),
                          SizedBox(height: 8.0),
                          Text('Step 2:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                              'Place your feet on the paper, with the bottom of your feet aligned with the bottom edge of the paper.'),
                          SizedBox(height: 8.0),
                          Text('Step 3:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                              'Take a picture of the paper along with your feet. Repeat until satisfied.'),
                          SizedBox(height: 8.0),
                          Text('Step 4:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                              'Click on the proceed icon to get your calculated shoe size.'),
                        ]),
                      ),
                    ));
          },
          tooltip: 'popup',
          child: const Icon(Icons.help),
        ));
  }
}

Widget buildButton({
  required String title,
  required IconData icon,
  required VoidCallback onClicked,
}) {
  return ElevatedButton(
    onPressed: onClicked,
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(56),
      backgroundColor: Colors.white,
      foregroundColor: color[800],
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    child: Row(
      children: [
        Icon(icon),
        const SizedBox(width: 16),
        Text(title),
      ],
    ),
  );
}
