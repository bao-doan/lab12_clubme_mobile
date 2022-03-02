import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:lab12_clubme_mobile/player_page/player_page.dart';
import 'package:lab12_clubme_mobile/providers/player_provider.dart';
import 'package:provider/provider.dart';

class LibQuickPlayPanel extends StatelessWidget {
  const LibQuickPlayPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, provider, child) {
        return HeroMode(
          enabled: false,
          child: Hero(
            tag: 'player',
            child: Container(
              height: 100.0,
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kRadius),
                  topRight: Radius.circular(kRadius),
                ),
              ),
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => PlayerPage(song:
                        //     ))
                        // );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(provider.song!.albumArt),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Text(
                      provider.song!.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  provider.playing
                      ? GestureDetector(
                          child: Icon(Icons.pause, color: kTextColor,),
                          onTap: () {
                            provider.onPressPlay();
                        },
                      )
                      : GestureDetector(
                          child: Icon(Icons.play_arrow, color: kTextColor,),
                          onTap: () {
                            provider.onPressPlay();
                        },
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    child: Icon(Icons.crop_square_rounded, color: kTextColor,),
                    onTap: () {
                      provider.stopPrevSong();
                    },
                  ),
                  SizedBox(width: 10,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class LibQuickPlayButton extends StatefulWidget {
  final bool playing;
  final ValueChanged<bool>? onChanged;
  const LibQuickPlayButton({
    Key? key,
    required this.playing,
    this.onChanged,
  }) : super(key: key);

  @override
  State<LibQuickPlayButton> createState() => _LibQuickPlayButtonState();
}

class _LibQuickPlayButtonState extends State<LibQuickPlayButton> {
  late bool _playing;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _playing = widget.playing;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _playing = !_playing;
        });
        (widget.onChanged ?? (value) {})(_playing);
      },
      child: Icon(
        _playing ? Icons.pause : Icons.play_arrow,
        color: kTextColor,
      ),
    );
  }
}

