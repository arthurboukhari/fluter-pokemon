class Pokemon {
  final String name;
  final String city;
  final String postcode;

  const Pokemon(this.name, this.city, this.postcode, );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'city': city,
      'postcode': postcode,
    };
  }
}
