import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/utils/asset_image.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:lab12_clubme_mobile/ui/pages/player_page/player_page.dart';
import 'package:lab12_clubme_mobile/core/providers/player_provider.dart';
import 'package:lab12_clubme_mobile/ui/utils/payload_helper.dart';
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
            child: LibGlassmorphism(
              blur: 10,
              opacity: 0.2,
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kRadius),
                topRight: Radius.circular(kRadius),
                bottomLeft: Radius.circular(kRadius),
                bottomRight: Radius.circular(kRadius),
              ),
              child: Container(
                height: 90.0,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 15.0,
                ),
                decoration: BoxDecoration(
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                              provider.song == null ? Container() : PlayerPage(song: provider.song!)
                              )
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: PayloadHelper.imageFromImage(provider.song?.image),
                                      fit: BoxFit.cover,
                                    ),
                                    shape: BoxShape.circle
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                provider.song!.title!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
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
                      child: Icon(CupertinoIcons.xmark, color: kTextColor,),
                      onTap: () {
                        provider.stopPrevSong();
                      },
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
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

