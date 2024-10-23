class Recipe {
  final String title;
  final String imageUrl;
  final String ingredients;
  final String steps;
  final int duration;

  const Recipe({
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
  });
}