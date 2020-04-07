class Place {
  final String placeTitle;
  final String placeDescription;
  Place(this.placeTitle, this.placeDescription);
  @override
  String toString () {
    return '{"place":["placeTitle":"$placeTitle","placeDescription":"$placeDescription"]}';
  }
}