import 'package:flutter/material.dart';
import 'package:spotify/model/playlist_model.dart';
import 'package:spotify/pages/playlist_detail_page.dart';

class PlaylistGridItem extends StatelessWidget {
  final Playlist playlist;
  const PlaylistGridItem({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlaylistDetailPage(playlist: playlist)));
      },
      child: Container(
        child: Row(
          children: [
            Hero(
                tag: playlist.title,
                child: Image(
                  image: AssetImage(playlist.image),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: 8,
            ),
            Expanded(
                child: Text(
              playlist.title,
              style: TextStyle(color: Colors.white, fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ))
          ],
        ),
      ),
    );
  }
}
