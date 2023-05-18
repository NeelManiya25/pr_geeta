
import 'package:flutter/material.dart';
import 'package:geeta/models/chapter_model.dart';

class ShlokDetailPage extends StatefulWidget {
  const ShlokDetailPage({Key? key}) : super(key: key);

  @override
  State<ShlokDetailPage> createState() => _ShlokDetailPageState();
}

class _ShlokDetailPageState extends State<ShlokDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(allShloks[shlokIndex].verse),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                allShloks[shlokIndex].sanskrit,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "English Translation",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                allShloks[shlokIndex].english,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                "Hindi Translation",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                allShloks[shlokIndex].hindi,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                "Gujarati Translation",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(allShloks[shlokIndex].gujarati),
            ],
          ),
        ),
      ),
    );
  }
}
