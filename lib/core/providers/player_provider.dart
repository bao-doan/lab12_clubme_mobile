import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/models/song_model.dart';
// import 'package:lab12_clubme_mobile/core/data/music_data.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';

class PlayerProvider extends ChangeNotifier {
  late AudioPlayer _player = AudioPlayer(
    mode: PlayerMode.MEDIA_PLAYER,
    playerId: 'provider_player_id',
  );
  late AudioCache _cache = AudioCache(
    prefix: '',
    fixedPlayer: _player,
  );
  Duration _position = Duration(seconds: 0);
  Duration _duration = Duration(seconds: 0);
  bool _playing = false;
  Song? _song;

  AudioPlayer get player => _player;
  Duration get position => _position;
  Duration get duration => _duration;
  bool get playing => _playing;
  Song? get song => _song;
  // String? get songId => _song != null ? _song!.uid : '';
  String? get songId => _song?.uid ?? '';

  List<Song> _list = [];
  List<Song> get list => _list;

  // fetchList() async {
  //   print('PROVIDER.LIST.FETCH');
  //   await Future.delayed(Duration(seconds: 3));
  //   _list = sampleSongs;
  //   notifyListeners();
  //   print('PROVIDER.LIST.LENGTH ${_list.length}');
  // }

  void setPlaying(bool playing) {
    _playing = playing;
    notifyListeners();
  }

  void setSong(Song song) {
    _song = song;
    // _player.setUrl(song.fileUrl);
  }

  PlayerProvider() {
    // fetchList();
    setupPlayer();
  }

  void setupPlayer()  {
    _duration = Duration(seconds: 0);
    _position = Duration(seconds: 0);
    // _player = AudioPlayer(
    //   mode: PlayerMode.MEDIA_PLAYER,
    //   playerId: 'provider_player_id',
    // );
    // _cache = AudioCache(
    //   prefix: '',
    //   fixedPlayer: _player,
    // );

    print('player_id ${_player.playerId}');
    /** Listen to duration of a song */
    _player.onDurationChanged.listen((event) {
      // print('PROVIDER duration $event');
      _duration = event;
      notifyListeners();
    });
    /** Listen to current position */
    _player.onAudioPositionChanged.listen((Duration event) {
      // print('PROVIDER position $event');
      _position = event;
      notifyListeners();
    });
    /**  Listen to the current state */
    _player.onPlayerStateChanged.listen((PlayerState event) {
      print('PROVIDER event $event');
      setPlaying(event == PlayerState.PLAYING);
    });
  }


  void onSeektoSec(int secs) {
    _position = Duration(seconds: secs);
    print('PROVIDER onSeektoSec position $_position');
    _player.seek(_position);
    notifyListeners();
  }

  onPressPlay() {
    final state = _player.state;
    print('PROVIDER onPressPlay $state');
    switch (state) {
      case PlayerState.PLAYING: {
        pause();
        break;
      }
      case PlayerState.PAUSED: {
        resume();
        break;
      }
      case PlayerState.STOPPED: {
        play();
        break;
      }
      case PlayerState.COMPLETED: {
        restart();
        break;
      }
    }
  }

  void play({String? path}) {
    // print('PROVIDER song ${song!.fileUrl}');
    // if (song != null) {
      // _cache.play(_song!.file);
      path != null ? _player.play(path) : _player.resume();
      _playing = true;
      notifyListeners();
    // }
  }

  playNewSong({required Song song}) async {
    _song = song;
    await _player.play(song.audio!.secure_url!);
    _playing = true;
    notifyListeners();
  }

  stopPrevSong() async{
    // if (_playing) {
      print('PROVIDER stopPrevSong');
      await _player.stop();
      await _player.release();
      _duration = Duration(seconds: 0);
      _position = Duration(seconds: 0);
      _song = null;
      print('PROVIDER stopPrevSong duration $_duration');
      print('PROVIDER stopPrevSong position $_position');
      _playing = false;
      notifyListeners();
    // }
  }

  void pause() {
    _playing = false;
    _player.pause();
    notifyListeners();
  }

  void resume() {
    _playing = true;
    _player.resume();
    notifyListeners();
  }

  void stop() {
    _playing = false;
    _player.stop();
    // _cache.play(_song!.file);
    notifyListeners();
  }

  void restart() {
    _playing = true;
    _player.seek(Duration(seconds: 0));
    _player.resume();
    notifyListeners();
  }

  void dispose() {
    _player.dispose();
    _cache.clearAll();
  }
}