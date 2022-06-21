import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: enqueueTask,
                    child: const Text('Download'),
                  ),
                ],
              ),
              CircularProgressIndicator(value: 0.7,)
            ],
          )
        ),
      ),
    );
  }

  Future enqueueTask() async {
    final taskId = await FlutterDownloader.enqueue(
      url: 'https://speed.hetzner.de/1GB.bin',
      savedDir: 'the path of directory where you want to save downloaded files',
      showNotification: true,
      openFileFromNotification: true,
    );
  }
}
