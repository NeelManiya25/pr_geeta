import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geeta/controllers/providers/theme_provider.dart';
import 'package:geeta/models/all_chapters_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? data;

  @override
  void initState() {
    super.initState();
    loadJSON();
  }

  Future<void> loadJSON() async {
    data = await rootBundle.loadString('lib/utils/json/all_chapters.json');

    List decodedList = jsonDecode(data!);
    setState(() {});

    allChapters = decodedList
        .map(
          (e) => AllChapterModel.fromMap(
            data: e,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text("Bhagavad Geeta"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            icon: (Provider.of<ThemeProvider>(context).themeModel.isDark)
                ? const Icon(Icons.mode_night)
                : const Icon(Icons.light_mode_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          itemCount: allChapters.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                chapterIndex = i;
                Navigator.of(context).pushNamed("chapter_detail_page");
              },
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/${allChapters[i].imageName}.jpg"),
                        fit: BoxFit.fill,
                      ),
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(allChapters[i].nameHindi),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
