import 'package:flutter/material.dart';
import 'package:spotify/model/playlist_model.dart';

class PlaylistDetailPage extends StatelessWidget {
  final Playlist playlist;
  const PlaylistDetailPage({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          playlist.title,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.8,
            child: Hero(
              child: Image(
                image: AssetImage(playlist.image),
                fit: BoxFit.cover,
              ),
              tag: playlist.title,
            ),
          )
        ],
      ),
    );
  }
}
