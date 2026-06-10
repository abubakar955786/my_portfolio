import '../models/project.dart';
import '../models/experience.dart';

class PortfolioData {
  static const String name = "ABUBAKAR ANSARI";
  static const String title = "Flutter & Node.js Developer";
  static const String aboutMe = "I am a certified Flutter developer with over 4 years of experience, combining technical expertise with creative design skills. Proficient in Flutter's capabilities and up-to-date with design trends, I craft user-friendly and visually stunning mobile apps. I have worked on projects such as DLF Thrive, Dettol Swasth Champ, and JobMinglr, delivering high-quality solutions tailored to client needs.";
  
  static const List<String> skills = [
    "Dart", "Flutter", "AI Tools", "Caching", "MVVM", "GetX",
    "Provider", "Firebase", "Hive", "Flutter Bloc", "Node.js", "MongoDB"
  ];

  static List<Experience> experiences = [
    Experience(
      company: "The Marcom Avenue",
      role: "Flutter Developer",
      period: "May 2025 - Present",
      location: "Gurugram",
    ),
    Experience(
      company: "XiCom Technologies",
      role: "Flutter Developer",
      period: "April 2024 - April 2025",
      location: "Delhi",
    ),
    Experience(
      company: "TRRev Technology",
      role: "Flutter Developer",
      period: "May 2022 - April 2024",
      location: "Mumbai",
    ),
  ];

  static List<Project> projects = [
    Project(
      name: "VERSION_SENTRY",
      description: "A professional Flutter package to streamline app updates by checking latest versions and prompting users with a customizable UI.",
      imageUrl: "https://pub.dev/static/img/pub-dev-logo-2x.png",
      link: "https://pub.dev/packages/version_sentry",
      isPackage: true,
    ),
    Project(
      name: "DLF Thrive",
      description: "A premium lifestyle app for DLF residents with community features, service bookings, and event management.",
      imageUrl: "https://via.placeholder.com/400x200/2196F3/FFFFFF?text=DLF+Thrive",
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.dlf.thrive",
      appStoreUrl: "https://apps.apple.com/app/dlf-thrive/id123456789",
    ),
    Project(
      name: "Dettol Swasth Champ",
      description: "An educational app focused on hygiene and health for school-aged children, featuring interactive learning modules.",
      imageUrl: "https://via.placeholder.com/400x200/4CAF50/FFFFFF?text=Dettol+Swasth+Champ",
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.dettol.swasth",
    ),
    Project(
      name: "JobMinglr",
      description: "A comprehensive job portal connecting employers with potential candidates through an intuitive matching algorithm.",
      imageUrl: "https://via.placeholder.com/400x200/FF9800/FFFFFF?text=JobMinglr",
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.jobminglr",
    ),
  ];

  static const String email = "abubakar955786@gmail.com";
  static const String phone = "9557880408";
  static const String address = "Bijnor (Uttar Pradesh)";
  static const String youtubeChannel = "https://youtube.com/@AbubakarAnsari";
  static const String resumeUrl = "https://example.com/resume.pdf";
  static const String githubUrl = "https://github.com/abubakar955786";
  static const String linkedinUrl = "https://linkedin.com/in/abubakar-ansari";
}
