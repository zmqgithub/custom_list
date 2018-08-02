class Data {
  List<dataObject> getList() {
    List<dataObject> list = new List();

    list.add(new dataObject(
        'https://www.hlimg.com/images/stories/738X538/5-2_1426758450i30.jpg',
        'TAJIKISTAN',
        'Tajikistan is one of the best walking places with many spectacular mountains. It receives only 4,000 tourists in a year. The land has a history of having many important Silk Roads and various cultural influences from Hinduism, Islam, Christianity and Buddhism. But the country has one of the world\'s most difficult bureaucratic visa application processes. This also keeps visitors coming in the land. But taking the trouble of getting Tajikistan visa will be worthy.'));

    list.add(new dataObject(
        'https://www.hlimg.com/images/stories/738X538/a_1429533393e11.jpg',
        'Oaxaca',
        'Located in Mexico, this historical city is appropriate to introduce your child with ancient age. Here your children can witness the wonderful pottery works of the age when there was no wheel or modern technology. If you move towards nearby villages, you can witness the fantasy world. Craftsmen create a menagerie of alebrijes like different spike-covered creatures,dragons, dinosaurs, frogs, hummingbirds, fire-breathing.'));

    list.add(new dataObject(
        'https://www.hlimg.com/images/stories/738X538/istanbul_1429533393u20.jpg',
        'Istanbul',
        'World\'s largest miniature park is located here. There are many such activities like learning through playing, visiting the wonderful museums, transparent water reservoir under the floor, the princess island, walking around the balcony of Galata Tower, shopping in the local market and finally have a small ride in nostalgic tram.'));

    list.add(new dataObject(
        'https://www.hlimg.com/images/stories/738X538/london_1429533393u30.jpg',
        'London',
        'There are lot to enjoy for the kids, right from watching movies to spend time in cruise. Funny destinations like Oasis Swimming Pools, Vertical Chill Ice Wall Covent Garden, London Dungeon, Sea Life London Aquarium and famous museums like Madame Tussauds are fabulous. Shakespeares Globe Exhibition and Tour will take you to the past.'));

    list.add(new dataObject(
        'https://www.hlimg.com/images/stories/738X538/5-1jpg_1426758449i21.jpg',
        'KIRIBATI',
        'Kiribati is a land in the Pacific Ocean and famous for being one of the best fishing and diving spots in the world. There are only 3,900 tourists per year. It can also be the best place to celebrate the New Year, because in 1999 it was the first place in the earth to welcome in the present new millennium.'));

    return list;
  }
}

class dataObject {
  String url;
  String placeName;
  String desc;

  dataObject(this.url, this.placeName, this.desc);
}
