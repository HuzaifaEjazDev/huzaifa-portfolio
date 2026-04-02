import 'package:flutter/material.dart';

class Project {
  final String name;
  final String tag;
  final String description;
  final List<String> tech;
  final List<Color> gradientColors;
  final String stat;
  final String code;
  final List<String>? images; // Support for multiple images
  final String? githubUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? webUrl;

  Project({
    required this.name,
    required this.tag,
    required this.description,
    required this.tech,
    required this.gradientColors,
    required this.stat,
    required this.code,
    this.images,
    this.githubUrl,
    this.playStoreUrl,
    this.appStoreUrl,
    this.webUrl,
  });
}

final List<Project> projectsData = [
  Project(
    name: "FeynLearn",
    tag: "AI-Powered Learning",
    description: "Converts PDFs & audio into structured study materials using Google Gemini LLM. Built with Clean Architecture, Riverpod, and Firebase sync. Reduced API costs 20% via local caching. Features offline-first study modes and real-time cross-device synchronization.",
    tech: ["Flutter", "Dart", "Firebase", "Gemini AI", "Riverpod", "SQLite"],
    gradientColors: [const Color(0xFF7C3AED), const Color(0xFFD946EF)],
    stat: "10k+ sessions",
    code: """// feynlearn: pdf -> notes
class StudyRepo {
  Future<Study> loadLocal() => db.read();
  Future<Study?> sync() async {
    final remote = await api.summarize(pdf);
    await db.cache(remote);
    return remote;
  }
}""",
    githubUrl: "https://github.com/HuzaifaEjaz-Dev",
    playStoreUrl: "https://play.google.com/store/apps",
    appStoreUrl: "https://apps.apple.com/app",
    webUrl: "https://feynlearn.app",
    images: [
      "assets/feynlearn_project/1.jpeg",
      "assets/feynlearn_project/2.jpeg",
      "assets/feynlearn_project/3.jpeg",
      "assets/feynlearn_project/4.jpeg",
      "assets/feynlearn_project/5.jpeg",
      "assets/feynlearn_project/6.jpeg",
      "assets/feynlearn_project/7.jpeg",
      "assets/feynlearn_project/8.jpeg",
    ],
  ),
  Project(
    name: "Invoice Maker",
    tag: "Offline-First Business",
    description: "Complete offline-first invoice app with dynamic tax engine, PDF export, and multi-format sharing. SQLite persistence ensures zero data loss. Efficient for freelancers and small businesses with local storage and cloud backup.",
    tech: ["Flutter", "SQLite", "PDF", "Dart", "Clean Arch"],
    gradientColors: [const Color(0xFF06B6D4), const Color(0xFF0D9488)],
    stat: "100% reliable",
    code: """// invoice maker: offline-first
class InvoiceRepo {
  final db = SqfliteDb();
  Stream<List<Invoice>> watch() => 
      db.watchInvoices();
  Future<String> exportPdf(Invoice i) => 
      pdfEngine.render(i);
}""",
    githubUrl: "https://github.com/HuzaifaEjaz-Dev",
    appStoreUrl: "https://apps.apple.com/us/app/invoice-maker-receipt-maker/id6752768091",
    webUrl: "https://invoice-maker.example.com",
  ),
  Project(
    name: "RecipeFlow",
    tag: "Smart Management",
    description: "Feature-rich recipe app with Firebase auth, cloud sync, favorites, ratings & advanced search. Optimized for low-end Android devices. High-performance image loading and complex filtering features.",
    tech: ["Flutter", "Firebase", "Local DB", "Riverpod", "Cloud sync"],
    gradientColors: [const Color(0xFFF97316), const Color(0xFFDB2777)],
    stat: "30% faster",
    code: """// recipeflow: optimization
class RecipeList extends ConsumerWidget {
  @override
  Widget build(ctx, ref) {
    final items = ref.watch(pagedRecipes);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, i) => RecipeCard(items[i]),
        childCount: items.length,
      ),
    );
  }
}""",
    githubUrl: "https://github.com/HuzaifaEjaz-Dev",
    appStoreUrl: "https://apps.apple.com/us/app/recipeflow-recipe-manager/id6754388204",
  ),
  Project(
    name: "Dot Flow",
    tag: "Life Tracker",
    description: "Minimalist life-tracking app that visualizes your year as 365 dots. Track daily moods, add notes, manage long-term projects, and now set your life grid as a live wallpaper. Designed for clarity, aesthetics, and mindful productivity.",
    tech: ["Flutter", "sqflite", "Provider", "GetIt", "Local DB", "Custom UI", "Android Native"],
    gradientColors: [const Color(0xFF6366F1), const Color(0xFF8B5CF6)],
    stat: "365-day visualization",
    code: """// dotflow: life grid wallpaper logic
class DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final today = DateTime.now().difference(
      DateTime(DateTime.now().year, 1, 1),
    ).inDays + 1;

    final paint = Paint()..isAntiAlias = true;

    const totalDots = 365;
    final cols = 19;
    final spacing = size.width / cols;
    final radius = spacing * 0.3;

    for (int i = 0; i < totalDots; i++) {
      final row = i ~/ cols;
      final col = i % cols;

      if (i + 1 < today) {
        paint.color = Colors.white;
      } else if (i + 1 == today) {
        paint.color = Colors.yellow;
      } else {
        paint.color = Colors.grey;
      }

      final dx = col * spacing + spacing / 2;
      final dy = row * spacing + spacing / 2;

      canvas.drawCircle(Offset(dx, dy), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}""",
    githubUrl: "https://github.com/HuzaifaEjaz-Dev",
    playStoreUrl: "https://play.google.com/store/apps/details?id=com.devorbix.dot_life",
    images: [
      "assets/dot_flow_project/1.png",
      "assets/dot_flow_project/2.png",
      "assets/dot_flow_project/3.png",
      "assets/dot_flow_project/4.png",
      "assets/dot_flow_project/5.png",
      "assets/dot_flow_project/6.png",
      "assets/dot_flow_project/7.jpeg",
    ],
  ),
  Project(
    name: "PDF Tools",
    tag: "Productivity Utility",
    description: "All-in-one PDF utility app enabling image to PDF conversion, merging, splitting, compression, rotation, and password protection. Designed with clean UI, offline processing, and optimized performance for seamless document handling.",
    tech: ["Flutter", "Dart", "PDF Processing", "Local Storage", "File Handling"],
    gradientColors: [const Color(0xFF2563EB), const Color(0xFF7C3AED)],
    stat: "All-in-one",
    code: """// pdf tools: merge & process
Future<File> mergePdf(List<File> files) async {
  final PdfDocument document = PdfDocument();
  for (final file in files) {
    final PdfDocument input = PdfDocument(inputBytes: file.readAsBytesSync());
    for (int i = 0; i < input.pages.count; i++) {
      document.pages.add().graphics.drawPdfTemplate(
        input.pages[i].createTemplate(),
        Offset.zero,
      );
    }
  }
  final bytes = document.saveSync();
  document.dispose();
  return File('merged.pdf')..writeAsBytesSync(bytes);
}""",
    githubUrl: "https://github.com/HuzaifaEjaz-Dev",
    playStoreUrl: "https://play.google.com/store/apps/details?id=com.devorbix.pdf_tools",
    images: [
      "assets/pdf_tools_project/1.jpeg",
      "assets/pdf_tools_project/2.jpeg",
      "assets/pdf_tools_project/3.jpeg",
      "assets/pdf_tools_project/4.jpeg",
      "assets/pdf_tools_project/5.jpeg",
    ],
  ),
  Project(
    name: "QR Scanner & Generator",
    tag: "Utility Tool",
    description: "Fast and minimal QR scanner & generator app with real-time camera scanning, gallery support, and multi-type QR creation (URL, WiFi, contact, text, email). Includes scan history, vibration & sound feedback, and privacy-focused on-device processing. Optimized for smooth performance and clean UI experience.",
    tech: ["Flutter", "Mobile Camera", "QR Libraries", "Local Storage"],
    gradientColors: [const Color(0xFF0F172A), const Color(0xFF334155)],
    stat: "Instant scan",
    code: """// qr scanner: scan logic
class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  void onDetect(BarcodeCapture capture) {
    final barcode = capture.barcodes.first;
    if (barcode.rawValue != null) {
      // handle scanned result
      print(barcode.rawValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      onDetect: onDetect,
    );
  }
}""",
    githubUrl: "https://github.com/HuzaifaEjaz-Dev",
    playStoreUrl: "https://play.google.com/store/apps/details?id=com.devorbix.qr_scanner",
  ),

];
