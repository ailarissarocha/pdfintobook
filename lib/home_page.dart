import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'pdf_viewer_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _pdfPath;

  Future<void> _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _pdfPath = result.files.single.path;
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFViewerPage(pdfPath: _pdfPath!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Reader App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _pickPDF,
          child: Text('Pick and Read PDF'),
        ),
      ),
    );
  }
}
