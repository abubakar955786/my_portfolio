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
      name: "DLF Thrive",
      description: "DLF THRIVE is your premium wellness companion. A unified platform where movement, recovery, nourishment, and connection come together—effortlessly. Experience a healthier lifestyle with just one tap.",
      imageUrl: "assets/dlf_thrive.jpg",
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.dlf.thriveapp",
      appStoreUrl: "https://apps.apple.com/us/app/dlf-thrive-wellness-app/id6761643604",
    ),
    Project(
      name: "Dettol Swasth Champ",
      description: "Part of the Dettol Banega Swasth India initiative, this app inspires children to build powerful hygiene habits. Through fun challenges, habit tracking, and rewards, it turns everyday activities into meaningful steps toward personal wellbeing.",
      imageUrl: "assets/dettol.jpg",
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.swasth.champ.app",
    ),
    Project(
      name: "VERSION_SENTRY",
      description: "A professional Flutter package to streamline app updates by checking latest versions and prompting users with a customizable UI. Supports flexible configurations for mandatory and optional updates.",
      imageUrl: "assets/version_sentry.png",
      link: "https://pub.dev/packages/version_sentry",
      isPackage: true,
    ),
  ];

  static const String email = "abubakar955786@gmail.com";
  static const String phone = "9557880408";
  static const String address = "Bijnor (Uttar Pradesh)";
  static const String youtubeChannel = "https://youtube.com/@code_craft_";
  static const String resumeUrl = "assets/my_resume.pdf";
  static const String githubUrl = "https://github.com/abubakar955786";
  static const String linkedinUrl = "https://www.linkedin.com/in/abu-bakar-165408252";
}
