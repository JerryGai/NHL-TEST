class TeamIcons {
  static Map<String, String> iconList = {
    '2': 'res/NYI_light.png',
    '4': 'res/PHI_light.png',
    '6': 'res/BOS_light.png',
    '8': 'res/MTL_light.png',
    '12': 'res/CAR_light.png',
    '14': 'res/TBL_light.png',
    '15': 'res/WSH_light.png',
    '16': 'res/CHI_light.png',
    '19': 'res/STL_light.png',
    '20': 'res/CGY_light.png',
    '21': 'res/COL_light.png',
    '23': 'res/VAN_light.png',
    '25': 'res/DAL_light.png',
    '29': 'res/CBJ_light.png',
    '53': 'res/ARI_light.png',
    '54': 'res/VGK_light.png',
  };

  String getIcon(String id) {
    if (iconList.containsKey(id)) {
      return iconList[id]!;
    } else {
      return 'res/nhl.png';
    }
  }
}
