class Flavor {
  const Flavor({
    required this.type,
  });

  Flavor.development() : type = FlavorType.development;

  Flavor.staging() : type = FlavorType.staging;

  Flavor.production() : type = FlavorType.production;

  final FlavorType type;
}

enum FlavorType {
  /// Flavor for the build that target staging environment
  development,

  /// Flavor for the build that target staging environment
  staging,

  /// Flavor for the build that target production environment
  production,
}
