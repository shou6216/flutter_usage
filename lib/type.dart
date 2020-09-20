enum SearchType {
  INCOMPLETE,
  INCOMPLETE_KILL,
  INCOMPLETE_HEART,
  NONE_KILL,
  NONE_HEART,
  ALL
}

class SearchTypeHelper {
  static int getId(SearchType searchType) {
    switch (searchType) {
      case SearchType.INCOMPLETE:
        return 1;
      case SearchType.INCOMPLETE_KILL:
        return 2;
      case SearchType.INCOMPLETE_HEART:
        return 3;
      case SearchType.NONE_KILL:
        return 4;
      case SearchType.NONE_HEART:
        return 5;
      case SearchType.ALL:
      default:
        return 6;
    }
  }

  static String getNameKey(SearchType searchType) {
    switch (searchType) {
      case SearchType.INCOMPLETE:
        return 'searchType.incomplete';
      case SearchType.INCOMPLETE_KILL:
        return 'searchType.incomplete_kill';
      case SearchType.INCOMPLETE_HEART:
        return 'searchType.incomplete_heart';
      case SearchType.NONE_KILL:
        return 'searchType.none_kill';
      case SearchType.NONE_HEART:
        return 'searchType.none_heart';
      case SearchType.ALL:
      default:
        return 'searchType.all';
    }
  }
}