class Project {
  final String title;
  final String tagline;
  final String description;
  final List<String> tags;
  final String githubUrl;

  const Project({
    required this.title,
    required this.tagline,
    required this.description,
    required this.tags,
    required this.githubUrl,
  });
}