import 'package:flutter/material.dart';
import 'package:spotify/model/playlist_model.dart';
import 'package:spotify/widgets/playlist_grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Playlist> homePlaylist = [
    Playlist(title: "Daily Mix 1", desc: "", image: "lib/assets/1.png"),
    Playlist(title: "Daily Mix 2", desc: "", image: "lib/assets/2.png"),
    Playlist(title: "Daily Mix 3", desc: "", image: "lib/assets/3.png"),
    Playlist(title: "Today's Top Hits", desc: "", image: "lib/assets/4.png"),
    Playlist(title: "Discover Weekly", desc: "", image: "lib/assets/5.png"),
    Playlist(title: "Tastebreakers", desc: "", image: "lib/assets/6.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          _appBarTitle(),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => PlaylistGridItem(
                        playlist: homePlaylist[index],
                      ),
                  childCount: homePlaylist.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3.5,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                _buildSectionTitle("Picked for You"),
                SizedBox(
                  height: 10,
                ),
                _buildPickWidget()
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildPickWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Colors.grey[800], borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child:
                  // Image(
                  //   image: AssetImage('/lib/assets/7.png'),
                  //   width: 80,
                  //   height: 80,
                  // )
                  Image.asset(
                'lib/assets/7.png',
                width: 80,
                height: 80,
              ),
            ),
            const Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Album',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Artist Name',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }

  String _appBarTitle() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}
