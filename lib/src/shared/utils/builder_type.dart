enum LoanAndReturnType {
  religion('Religion'),
  academique('Académique'),
  culturel('Culturel'),
  news('Nouveauté'),
  besSell('Meilleures ventes');

  final String value;
  const LoanAndReturnType(this.value);

  static LoanAndReturnType fromString(String value) {
    return LoanAndReturnType.values.firstWhere(
      (context) => context.value == value,
      orElse: () => LoanAndReturnType.besSell,
    );
  }

  @override
  String toString() => value;
}