abstract class DataProviderInterface<T, R> {
  late R restClient;
  late List<T> items;
  late List<T> list;
  late bool fetched;
  late bool waiting;
  Future fetch();
}