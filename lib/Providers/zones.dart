class Zone {
  final String id;
  final String name;
  final String imgUrl;
  final String description;

  Zone( {required this.id,required this.name, required this.imgUrl, required this.description});
}

class Zones {
  static List<Zone> list = [
    Zone(
        id:'Zbelfort',
        name: 'Zone Commerciale Belfort',
        imgUrl: 'assets/images/belfort.png',
        description: 'Description '),
    Zone(
        id:'Zhamize',
        name: 'Zone Commerciale El Hamize ',
        imgUrl: 'assets/images/hamiz.jpg',
        description: 'Description'),
    Zone(
        id:'Zeulma',
        name: 'Zone Commerciale El Eulma ',
        imgUrl: 'assets/images/eulma.png',
        description: 'Description'),
    Zone(
        id: 'Zkolea',
        name: 'Zone Commerciale Koléa  ',
        imgUrl: 'assets/images/kolea.png',
        description: 'Description')
  ];
}
