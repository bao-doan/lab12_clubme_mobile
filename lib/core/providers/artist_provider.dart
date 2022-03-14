import 'package:flutter/foundation.dart';
import 'package:lab12_clubme_mobile/core/api/resources/artist_rest.dart';
import 'package:lab12_clubme_mobile/core/models/artist_model.dart';
import 'package:lab12_clubme_mobile/core/providers/data_provider_interface.dart';

class ArtistProvider extends ChangeNotifier implements DataProviderInterface<Artist, ArtistRest> {
  @override
  ArtistRest restClient = ArtistRest();

  @override
  bool fetched = false;

  @override
  List<Artist> _items = [];

  @override
  List<Artist> _list = [];

  @override
  List<Artist> get items => _items;

  @override
  List<Artist> get list => _list;

  @override
  bool waiting = false;

  ArtistProvider() {
    fetch();
  }

  @override
  fetch() async {
    if (!fetched) {
      try {
        waiting = true;
        final List<Artist> data = await restClient.fetchMultiple();
        _items = data;
        waiting = false;
        fetched = true;
        notifyListeners();
      }
      catch (e) {
        print('ArtistProvider ${e.toString()} $e');
      }

    }
  }

  @override
  set items(List<Artist> _items) {
    // TODO: implement items
    _items = _items;
  }

  @override
  set list(List<Artist> _list) {
    // TODO: implement list
    _items = _items;
  }

}