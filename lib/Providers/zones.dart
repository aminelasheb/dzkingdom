class Zone {
  final String name;
  final String imgUrl;
  final String description;

  Zone({required this.name, required this.imgUrl, required this.description});
}

class Zones {
  static List<Zone> list = [
    Zone(
        name: 'Zone Commerciale Belfort',
        imgUrl: 'assets/images/belfort.png',
        description: ''),
    Zone(
        name: 'Zone Commerciale El Hamize ',
        imgUrl: 'assets/images/hamiz.jpg',
        description: ''),
    Zone(
        name: 'Zone Commerciale El Eulma ',
        imgUrl: 'assets/images/eulma.png',
        description: ''),
    Zone(
        name: 'Zone Commerciale Koléa  ',
        imgUrl: 'assets/images/kolea.png',
        description: '')
  ];
}
