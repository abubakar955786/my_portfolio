class Project {
  final String name;
  final String description;
  final String imageUrl;
  final String? link;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final bool isPackage;

  Project({
    required this.name,
    required this.description,
    required this.imageUrl,
    this.link,
    this.playStoreUrl,
    this.appStoreUrl,
    this.isPackage = false,
  });
}
