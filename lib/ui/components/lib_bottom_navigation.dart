import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';

class LibBottomNavigation extends StatefulWidget {
  const LibBottomNavigation({Key? key}) : super(key: key);

  @override
  _LibBottomNavigationState createState() => _LibBottomNavigationState();
}

class _LibBottomNavigationState extends State<LibBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return LibGlassmorphism(
      blur: 10,
      opacity: 0.2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          selectedItemColor: Colors.lightGreenAccent,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.disc_full_outlined),
                label: 'Playlist'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings'
            ),
          ],
        ),
      ),
    );
  }
}



