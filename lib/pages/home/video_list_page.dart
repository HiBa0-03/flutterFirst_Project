import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:hib_testflu/pages/home/video_player_screen.dart';

class VideoListPage extends StatelessWidget {
  final String language;
  final String level;
  final String category;

  const VideoListPage({
    super.key,
    required this.language,
    required this.level,
    required this.category,
  });

  Future<List<dynamic>> _loadVideos() async {
    final jsonString = await rootBundle.loadString('assets/json/videos.json');
    final data = json.decode(jsonString);
    return data[language][level][category];
  }

  @override
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${category.toUpperCase()} Videos"),
        backgroundColor: Color.fromARGB(255, 236, 103, 161),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink[50]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder(
          future: _loadVideos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final videos = snapshot.data!;
              return ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: videos.length,
                itemBuilder: (context, index) => Card(
                  elevation: 4,
                  margin: EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: Icon(Icons.play_circle_fill, 
                               color:Color.fromARGB(255, 236, 103, 161)),
                    title: Text(videos[index]["title"],
                             style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("Cliquez pour regarder",
                             style: TextStyle(color: Colors.grey)),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPlayerScreen(
                          url: videos[index]["url"]),
                      ),
                    ),
                  ),
                ),
              );
            }
            return Center(child: CircularProgressIndicator(color: Colors.pink));
          },
        ),
      ),
    );
  }
}