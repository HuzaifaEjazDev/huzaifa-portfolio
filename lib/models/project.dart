import 'package:flutter/material.dart';

class Project {
  final String name;
  final String tag;
  final String description;
  final List<String> tech;
  final List<Color> gradientColors;
  final String stat;
  final String code;

  Project({
    required this.name,
    required this.tag,
    required this.description,
    required this.tech,
    required this.gradientColors,
    required this.stat,
    required this.code,
  });
}

final List<Project> projectsData = [
  Project(
    name: "FeynLearn",
    tag: "AI-Powered Learning",
    description: "Converts PDFs & audio into structured study materials using Google Gemini LLM. Built with Clean Architecture, Riverpod, and Firebase sync. Reduced API costs 20% via local caching.",
    tech: ["Flutter", "Dart", "Firebase", "Gemini AI", "Riverpod"],
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
  ),
  Project(
    name: "Invoice Maker",
    tag: "Offline-First Business",
    description: "Complete offline-first invoice app with dynamic tax engine, PDF export, and multi-format sharing. SQLite persistence ensures zero data loss.",
    tech: ["Flutter", "SQLite", "PDF", "Dart"],
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
  ),
  Project(
    name: "RecipeFlow",
    tag: "Smart Management",
    description: "Feature-rich recipe app with Firebase auth, cloud sync, favorites, ratings & advanced search. Optimized for low-end Android devices.",
    tech: ["Flutter", "Firebase", "Local DB", "Riverpod"],
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
  ),
];
