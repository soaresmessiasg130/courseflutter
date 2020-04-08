
// Model Place

class Place {

  final String placeTitle;
  final String placeDescription;

  Place(
    this.placeTitle, 
    this.placeDescription
  );

  @override
  String toString () {
    return '{\n"place":[\n--"placeTitle":"$placeTitle",\n--"placeDescription":"$placeDescription"\n]\n}';
  }
}