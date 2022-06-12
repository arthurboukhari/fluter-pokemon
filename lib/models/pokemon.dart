class Pokemon {
  final String id;
  final String name;
  final String skin;
  final String skin_shiny;
  final dynamic types;
  final List<StatsBaseStats> ?stats_base_stats;

  const Pokemon(this.id, this.name, this.skin, this.skin_shiny, this.types, this.stats_base_stats);

  factory Pokemon.fromGeoJson(Map<String, dynamic> json) {

    final String id = json['id'];
    final String name = json['name'];

    final Map<String, dynamic> sprites = json['sprites'] ?? {};
    final String skin = sprites['back_default'];
    final String skin_shiny = sprites['back_shiny'];

    final Map<String, dynamic> types = json['types'] ?? {};

    final Map<String, dynamic> stats = json['stats'] ?? {};
    // final List<StatsBaseStats> stats_base_stats = stats.forEach((item)=>
    //   new StatsBaseStats(item.stat.name, item.base_stat)
    // );

    return Pokemon(id, name, skin, skin_shiny , types, null);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'skin': skin,
      'skin_shiny': skin_shiny,
      'types': types,
      'stats_base_stats': stats_base_stats,
    };
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(json['id'], json['name'], json['skin'], json['skin_shiny'],json['types'], json['stats_base_stats']);
  }
  
}
class StatsBaseStats {
  final String name;
  final int value;

  StatsBaseStats(this.name, this.value);
}