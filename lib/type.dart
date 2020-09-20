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

enum KillType { INCOMPLETE, COMPLETE, NONE }

class KillTypeHelper {
  static int getId(KillType killType) {
    switch (killType) {
      case KillType.INCOMPLETE:
        return 0;
      case KillType.NONE:
        return 1;
      case KillType.COMPLETE:
      default:
        return 2;
    }
  }

  static String getFullNameKey(KillType killType) {
    switch (killType) {
      case KillType.INCOMPLETE:
        return 'killType.full.incomplete';
      case KillType.NONE:
        return 'killType.full.none';
      case KillType.COMPLETE:
      default:
        return 'killType.full.complete';
    }
  }

  static String getShortName(int killTypeId) {
    switch (killTypeId) {
      case 1:
        return '―';
      case 2:
        return '〇';
      case 0:
      default:
        return '✕';
    }
  }
}

enum HeartType { INCOMPLETE, COMPLETE, NONE }

class HeartTypeHelper {
  static int getId(HeartType heartType) {
    switch (heartType) {
      case HeartType.INCOMPLETE:
        return 0;
      case HeartType.NONE:
        return 1;
      case HeartType.COMPLETE:
      default:
        return 2;
    }
  }

  static String getFullNameKey(HeartType heartType) {
    switch (heartType) {
      case HeartType.INCOMPLETE:
        return 'heartType.full.incomplete';
      case HeartType.NONE:
        return 'heartType.full.none';
      case HeartType.COMPLETE:
      default:
        return 'heartType.full.complete';
    }
  }

  static String getShortName(int heartTypeId) {
    switch (heartTypeId) {
      case 1:
        return '―';
      case 2:
        return '〇';
      case 0:
      default:
        return '✕';
    }
  }
}