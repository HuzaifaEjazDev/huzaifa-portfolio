import { useEffect, useRef, useState } from "react";

export default function App() {
  const [activeProject, setActiveProject] = useState(0);
  const [mousePos, setMousePos] = useState({ x: 0, y: 0 });
  const heroRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const handleMouse = (e: MouseEvent) => {
      setMousePos({ x: e.clientX, y: e.clientY });
    };
    window.addEventListener("mousemove", handleMouse);
    return () => window.removeEventListener("mousemove", handleMouse);
  }, []);

  useEffect(() => {
    document.title = "Huzaifa Ejaz — Flutter Developer";
  }, []);

  const projects = [
    {
      name: "FeynLearn",
      tag: "AI-Powered Learning",
      desc: "Converts PDFs & audio into structured study materials using Google Gemini LLM. Built with Clean Architecture, Riverpod, and Firebase sync. Reduced API costs 20% via local caching.",
      tech: ["Flutter", "Dart", "Firebase", "Gemini AI", "Riverpod"],
      color: "from-violet-600 to-fuchsia-600",
      stat: "10k+ learning sessions",
      icon: (
        <svg viewBox="0 0 24 24" fill="none" className="w-5 h-5">
          <path d="M12 2L14.5 8.5H21L15.75 12.5L18 19L12 15L6 19L8.25 12.5L3 8.5H9.5L12 2Z" fill="currentColor" />
        </svg>
      ),
    },
    {
      name: "Invoice Maker",
      tag: "Offline-First Business",
      desc: "Complete offline-first invoice app with dynamic tax engine, PDF export, and multi-format sharing. SQLite persistence ensures zero data loss.",
      tech: ["Flutter", "SQLite", "PDF", "Dart"],
      color: "from-cyan-500 to-teal-600",
      stat: "100% offline reliable",
      icon: (
        <svg viewBox="0 0 24 24" fill="none" className="w-5 h-5">
          <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8l-6-6z" stroke="currentColor" strokeWidth="1.5" fill="none" />
          <path d="M14 2v6h6" stroke="currentColor" strokeWidth="1.5" />
        </svg>
      ),
    },
    {
      name: "RecipeFlow",
      tag: "Smart Management",
      desc: "Feature-rich recipe app with Firebase auth, cloud sync, favorites, ratings & advanced search. Optimized for low-end Android devices.",
      tech: ["Flutter", "Firebase", "Local DB", "Riverpod"],
      color: "from-orange-500 to-pink-600",
      stat: "Optimized 30% faster",
      icon: (
        <svg viewBox="0 0 24 24" fill="none" className="w-5 h-5">
          <path d="M8 21h8M12 3v18M6 10c-1 0-4-1-4-4s3-4 4-4 4 1 4 4-3 4-4 4zm12 0c1 0 4-1 4-4s-3-4-4-4-4 1-4 4 3 4 4 4z" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" />
        </svg>
      ),
    },
  ];

  const skills = [
    { cat: "Core", items: ["Dart", "Flutter", "Java", "Android SDK"] },
    { cat: "State", items: ["Riverpod", "Provider", "Clean Architecture", "MVVM"] },
    { cat: "Backend", items: ["Firebase", "Firestore", "REST APIs", "Gemini AI"] },
    { cat: "Data", items: ["SQLite", "Sqflite", "Offline-First", "SharedPrefs"] },
    { cat: "Tooling", items: ["CI/CD", "Play Console", "ASO", "GitHub"] },
  ];

  return (
    <div className="relative min-h-screen bg-[#050816] text-white overflow-x-hidden selection:bg-fuchsia-500/30 selection:text-fuchsia-100">
      {/* Background */}
      <div className="pointer-events-none fixed inset-0">
        <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_top,_rgba(2,86,155,0.25),transparent_60%),radial-gradient(ellipse_at_bottom_right,_rgba(124,58,237,0.2),transparent_50%),radial-gradient(ellipse_at_bottom_left,_rgba(6,182,212,0.18),transparent_50%)]" />
        <div className="absolute inset-0 opacity-[0.035] [background-image:linear-gradient(white_1px,transparent_1px),linear-gradient(90deg,white_1px,transparent_1px)] [background-size:64px_64px]" />
        {/* Flutter-inspired blob */}
        <div
          className="absolute -top-40 -left-40 h-[520px] w-[520px] rounded-full blur-[120px] transition-transform duration-300"
          style={{
            background: "radial-gradient(closest-side, #02569B, transparent)",
            transform: `translate3d(${mousePos.x * 0.02}px, ${mousePos.y * 0.02}px, 0)`,
          }}
        />
        <div className="absolute top-1/3 -right-40 h-[480px] w-[480px] rounded-full blur-[120px] bg-[radial-gradient(closest-side,#7c3aed,transparent)]" />
      </div>

      {/* Nav */}
      <header className="sticky top-0 z-40 backdrop-blur-xl border-b border-white/5 bg-[#050816]/60">
        <div className="mx-auto max-w-[1200px] px-6 h-[68px] flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="relative">
              <div className="absolute -inset-2 rounded-2xl bg-[#02569B]/30 blur-xl" />
              <div className="relative h-9 w-9 rounded-2xl bg-gradient-to-br from-[#02569B] to-cyan-400 grid place-items-center shadow-[0_0_30px_rgba(2,86,155,0.5)]">
                {/* Flutter logo simplified */}
                <svg width="18" height="18" viewBox="0 0 256 317" fill="white">
                  <path d="M157.66 0L0 157.66l79.75 79.75L157.66 159.5 79.75 81.59l77.91-77.9v-3.7z" opacity=".8"/>
                  <path d="M255.94 98.12l-98.28 98.28-57.43-57.43 19.9-19.9 37.53 37.54 59.55-59.55z"/>
                </svg>
              </div>
            </div>
            <div className="leading-tight">
              <div className="text-[13px] tracking-[0.2em] text-white/50 font-medium">PORTFOLIO</div>
              <div className="font-semibold -mt-1">huzaifa.dev</div>
            </div>
          </div>
          <nav className="hidden md:flex items-center gap-1.5 text-[13px]">
            {["Work", "Skills", "Experience", "Contact"].map((l) => (
              <a
                key={l}
                href={`#${l.toLowerCase()}`}
                className="px-3.5 py-2 rounded-full text-white/70 hover:text-white hover:bg-white/5 transition"
              >
                {l}
              </a>
            ))}
            <a
              href="mailto:huzaifaejazdev@gmail.com"
              className="ml-2 inline-flex items-center gap-2 rounded-full bg-white text-black px-4 py-2 font-medium hover:bg-white/90 transition"
            >
              <span>Hire me</span>
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                <path d="M7 17L17 7M17 7H7m10 0v10" />
              </svg>
            </a>
          </nav>
        </div>
      </header>

      {/* Hero */}
      <section ref={heroRef} className="relative">
        <div className="mx-auto max-w-[1200px] px-6 pt-14 pb-10 md:pt-24 md:pb-16">
          <div className="grid lg:grid-cols-[1.15fr_0.85fr] gap-12 items-start">
            <div>
              <div className="inline-flex items-center gap-2 rounded-full border border-white/10 bg-white/[0.03] px-3 py-1.5 text-[12px] text-white/70 backdrop-blur">
                <span className="relative flex h-2 w-2">
                  <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
                  <span className="relative inline-flex rounded-full h-2 w-2 bg-emerald-400"></span>
                </span>
                Available for Flutter projects — Gujranwala, Pakistan
              </div>

              <h1 className="mt-6 text-[clamp(40px,7vw,84px)] font-[750] leading-[0.9] tracking-[-0.02em]">
                <span className="block">HUZAIFA</span>
                <span className="block text-white/60">EJAZ KAHLON</span>
              </h1>

              <div className="mt-6 flex flex-wrap items-center gap-3">
                <div className="inline-flex items-center gap-2 rounded-2xl bg-gradient-to-r from-[#02569B] to-cyan-400 px-4 py-2 text-[13px] font-medium text-black shadow-[0_8px_40px_rgba(2,86,155,0.35)]">
                  <svg width="16" height="16" viewBox="0 0 256 317" fill="black" className="opacity-80">
                    <path d="M157.66 0L0 157.66l79.75 79.75L157.66 159.5 79.75 81.59l77.91-77.9v-3.7z"/>
                  </svg>
                  Flutter Developer
                </div>
                <div className="text-white/60 text-sm">Android & Cross-Platform • 10+ production apps</div>
              </div>

              <p className="mt-6 max-w-[60ch] text-[15px] leading-relaxed text-white/70">
                I build production-grade Flutter apps with Clean Architecture, Riverpod, and Firebase. I love offline-first systems, AI integrations (Gemini, STT), and shipping fast to Play Store with CI/CD and ASO. Performance wins: ~30% faster responsiveness through smart state management and pagination.
              </p>

              <div className="mt-8 flex flex-wrap gap-3">
                <a href="#work" className="group inline-flex items-center gap-2 rounded-xl bg-white px-5 py-3 text-sm font-medium text-black transition hover:translate-y-[-1px] hover:shadow-[0_10px_30px_rgba(255,255,255,0.15)]">
                  View Projects
                  <svg className="transition group-hover:translate-x-0.5" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M5 12h14M13 5l7 7-7 7"/></svg>
                </a>
                <a href="tel:+923250019905" className="inline-flex items-center gap-2 rounded-xl border border-white/15 bg-white/5 px-5 py-3 text-sm font-medium text-white/90 backdrop-blur hover:bg-white/10 transition">
                  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.75"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
                  +92 325 0019905
                </a>
              </div>

              <div className="mt-10 grid grid-cols-3 gap-4 max-w-[520px]">
                {[
                  { k: "Apps Shipped", v: "10+" },
                  { k: "Perf Gain", v: "30%" },
                  { k: "API Cost Cut", v: "20%" },
                ].map((s) => (
                  <div key={s.k} className="group relative overflow-hidden rounded-2xl border border-white/10 bg-gradient-to-b from-white/[0.07] to-white/[0.02] p-4 backdrop-blur">
                    <div className="absolute inset-0 opacity-0 group-hover:opacity-100 transition bg-[radial-gradient(120px_80px_at_80%_-10%,rgba(124,58,237,0.25),transparent)]"/>
                    <div className="text-[11px] uppercase tracking-widest text-white/50">{s.k}</div>
                    <div className="mt-1 text-2xl font-semibold">{s.v}</div>
                  </div>
                ))}
              </div>
            </div>

            {/* Phone mockup with Flutter code */}
            <div className="relative lg:mt-4">
              <div className="relative mx-auto w-[320px] md:w-[360px]">
                <div className="absolute -inset-6 rounded-[40px] bg-gradient-to-b from-[#02569B]/30 to-fuchsia-600/20 blur-3xl" />
                <div className="relative rounded-[36px] border border-white/15 bg-[#0a0f1f]/80 p-3 shadow-[0_30px_80px_rgba(0,0,0,0.6)] backdrop-blur-2xl">
                  <div className="rounded-[26px] bg-[#050816] border border-white/10 overflow-hidden">
                    {/* Phone notch */}
                    <div className="relative h-10 bg-[#0b1226] border-b border-white/5">
                      <div className="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 h-5 w-28 rounded-full bg-black/70 border border-white/10" />
                    </div>
                    {/* Screen */}
                    <div className="aspect-[9/19.5] relative overflow-hidden">
                      <div className="absolute inset-0">
                        <div className="absolute inset-0 bg-[radial-gradient(400px_200px_at_50%_0%,rgba(2,86,155,0.35),transparent_60%)]"/>
                        <div className="p-5">
                          <div className="flex items-center justify-between">
                            <div className="flex items-center gap-2">
                              <div className="h-8 w-8 rounded-xl bg-gradient-to-br from-[#02569B] to-cyan-400 grid place-items-center">
                                <svg width="14" height="14" viewBox="0 0 256 317" fill="black" className="opacity-80"><path d="M157.66 0L0 157.66l79.75 79.75L157.66 159.5 79.75 81.59l77.91-77.9v-3.7z"/></svg>
                              </div>
                              <div>
                                <div className="text-[11px] text-white/50 leading-none">feynlearn.app</div>
                                <div className="text-sm font-medium -mt-0.5">FeynLearn</div>
                              </div>
                            </div>
                            <div className="h-6 w-6 rounded-lg bg-white/10 grid place-items-center">
                              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><circle cx="12" cy="12" r="1"/><circle cx="19" cy="12" r="1"/><circle cx="5" cy="12" r="1"/></svg>
                            </div>
                          </div>

                          <div className="mt-5 rounded-2xl border border-white/10 bg-white/[0.03] p-4">
                            <div className="text-[11px] text-white/50">AI Summary</div>
                            <div className="mt-1 text-[13px] leading-snug text-white/85">PDF → structured notes with Gemini. Cached locally for offline study.</div>
                            <div className="mt-3 flex gap-1.5">
                              {["Riverpod","Clean Arch","Firebase"].map(t=>(
                                <span key={t} className="text-[10px] px-2 py-1 rounded-full bg-white/10 border border-white/10">{t}</span>
                              ))}
                            </div>
                          </div>

                          {/* Code snippet */}
                          <div className="mt-4 rounded-2xl overflow-hidden border border-white/10 bg-[#0b1226]">
                            <div className="flex items-center gap-1.5 px-3 py-2 border-b border-white/5 bg-white/[0.02]">
                              <span className="h-2.5 w-2.5 rounded-full bg-red-500/80" />
                              <span className="h-2.5 w-2.5 rounded-full bg-yellow-500/80" />
                              <span className="h-2.5 w-2.5 rounded-full bg-green-500/80" />
                              <span className="ml-2 text-[10px] text-white/50">lib/features/study/provider.dart</span>
                            </div>
                            <pre className="p-3 text-[11px] leading-[1.5] text-white/80 overflow-x-auto">
{`final studyProvider = 
  StateNotifierProvider<StudyCtrl, AsyncValue<Study>>((ref) {
    final repo = ref.watch(studyRepoProvider);
    return StudyCtrl(repo)..init();
});

class StudyCtrl extends StateNotifier<AsyncValue<Study>> {
  StudyCtrl(this._repo): super(const AsyncLoading());
  final StudyRepo _repo;

  Future<void> init() async {
    state = await AsyncValue.guard(() => _repo.loadLocal());
    final remote = await _repo.sync();
    if (remote != null) state = AsyncData(remote);
  }
}`}
                            </pre>
                          </div>

                          <div className="mt-4 grid grid-cols-3 gap-2">
                            {["Offline","Sync","Fast"].map((x,i)=>(
                              <div key={x} className="rounded-xl border border-white/10 bg-white/[0.03] p-3 text-center">
                                <div className="text-[10px] text-white/50">{x}</div>
                                <div className="text-sm font-medium">{["100%","Realtime","30%"][i]}</div>
                              </div>
                            ))}
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                {/* floating chips */}
                <div className="absolute -left-10 top-16 hidden md:block">
                  <div className="rounded-2xl border border-white/10 bg-white/5 px-3 py-2 text-[11px] backdrop-blur shadow-[0_10px_30px_rgba(0,0,0,0.4)]">Riverpod • StateNotifier</div>
                </div>
                <div className="absolute -right-8 bottom-20 hidden md:block">
                  <div className="rounded-2xl border border-white/10 bg-white/5 px-3 py-2 text-[11px] backdrop-blur shadow-[0_10px_30px_rgba(0,0,0,0.4)]">SQLite • Offline-first</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Work */}
      <section id="work" className="relative border-t border-white/5">
        <div className="mx-auto max-w-[1200px] px-6 py-16 md:py-24">
          <div className="flex items-end justify-between gap-6">
            <div>
              <div className="text-[12px] tracking-[0.18em] text-white/50">SELECTED WORK</div>
              <h2 className="mt-2 text-[28px] md:text-[40px] font-semibold tracking-[-0.01em]">Built with Flutter 💙</h2>
            </div>
            <div className="hidden md:flex items-center gap-2 text-[12px] text-white/60">
              <span>Clean Architecture</span>
              <span>•</span>
              <span>Riverpod</span>
              <span>•</span>
              <span>Firebase</span>
            </div>
          </div>

          {/* Bento */}
          <div className="mt-10 grid grid-cols-1 md:grid-cols-12 gap-4 auto-rows-[180px]">
            {/* Featured */}
            <button
              onClick={() => setActiveProject(0)}
              className="group relative md:col-span-8 md:row-span-2 overflow-hidden rounded-[28px] border border-white/10 bg-gradient-to-b from-white/[0.07] to-white/[0.02] p-[1px] text-left"
            >
              <div className="relative h-full w-full rounded-[27px] bg-[#0a0f1f]/70 backdrop-blur-xl overflow-hidden">
                <div className="absolute inset-0 opacity-60 mix-blend-screen" style={{background: "radial-gradient(500px 200px at 20% -10%, rgba(124,58,237,0.35), transparent)"}}/>
                <div className="relative z-10 h-full p-6 md:p-8 flex flex-col">
                  <div className="flex items-center justify-between">
                    <div className={`inline-flex items-center gap-2 rounded-full bg-gradient-to-r ${projects[0].color} px-3 py-1 text-[11px] font-medium text-black`}>
                      {projects[0].icon}
                      {projects[0].tag}
                    </div>
                    <div className="text-[11px] text-white/50">{projects[0].stat}</div>
                  </div>
                  <h3 className="mt-4 text-[26px] md:text-[32px] font-semibold tracking-tight">{projects[0].name}</h3>
                  <p className="mt-2 max-w-[60ch] text-[14px] leading-relaxed text-white/70">{projects[0].desc}</p>
                  <div className="mt-auto flex flex-wrap gap-1.5">
                    {projects[0].tech.map(t=>(
                      <span key={t} className="rounded-full border border-white/10 bg-white/5 px-2.5 py-1 text-[11px] text-white/80">{t}</span>
                    ))}
                  </div>
                </div>
                <div className="pointer-events-none absolute -right-10 -bottom-10 h-56 w-56 rounded-full bg-fuchsia-500/20 blur-[60px] transition group-hover:scale-110"/>
              </div>
            </button>

            {/* Project 2 */}
            <button onClick={() => setActiveProject(1)} className="group relative md:col-span-4 overflow-hidden rounded-[28px] border border-white/10 bg-gradient-to-b from-white/[0.06] to-transparent p-[1px] text-left">
              <div className="relative h-full rounded-[27px] bg-[#0a0f1f]/70 backdrop-blur-xl p-6">
                <div className={`inline-flex items-center gap-2 rounded-full bg-gradient-to-r ${projects[1].color} px-3 py-1 text-[11px] font-medium text-black`}>
                  {projects[1].icon}
                  {projects[1].tag}
                </div>
                <h4 className="mt-3 text-[20px] font-semibold">{projects[1].name}</h4>
                <p className="mt-1.5 text-[13px] text-white/65 line-clamp-3">{projects[1].desc}</p>
              </div>
            </button>

            {/* Project 3 */}
            <button onClick={() => setActiveProject(2)} className="group relative md:col-span-4 overflow-hidden rounded-[28px] border border-white/10 bg-gradient-to-b from-white/[0.06] to-transparent p-[1px] text-left">
              <div className="relative h-full rounded-[27px] bg-[#0a0f1f]/70 backdrop-blur-xl p-6">
                <div className={`inline-flex items-center gap-2 rounded-full bg-gradient-to-r ${projects[2].color} px-3 py-1 text-[11px] font-medium text-black`}>
                  {projects[2].icon}
                  {projects[2].tag}
                </div>
                <h4 className="mt-3 text-[20px] font-semibold">{projects[2].name}</h4>
                <p className="mt-1.5 text-[13px] text-white/65 line-clamp-3">{projects[2].desc}</p>
              </div>
            </button>

            {/* Code preview */}
            <div className="relative md:col-span-8 overflow-hidden rounded-[28px] border border-white/10 bg-[#0a0f1f]/70 backdrop-blur-xl">
              <div className="absolute inset-0 opacity-[0.04] [background-image:linear-gradient(white_1px,transparent_1px),linear-gradient(90deg,white_1px,transparent_1px)] [background-size:32px_32px]"/>
              <div className="relative h-full p-6 md:p-7">
                <div className="flex items-center justify-between">
                  <div className="text-[12px] text-white/50">Active project • Dart</div>
                  <div className="text-[11px] rounded-full border border-white/10 bg-white/5 px-2.5 py-1">Flutter 3.x</div>
                </div>
                <pre className="mt-4 overflow-x-auto text-[12.5px] leading-[1.65] text-white/85">
{activeProject===0 ? `// feynlearn: pdf -> notes with Gemini
class StudyRepo {
  Future<Study> loadLocal() => db.read();
  Future<Study?> sync() async {
    final remote = await api.summarize(pdfBytes);
    await db.cache(remote);
    return remote;
  }
}` : activeProject===1 ? `// invoice maker: offline-first
class InvoiceRepo {
  final db = SqfliteDb();
  Stream<List<Invoice>> watch() => db.watchInvoices();
  Future<String> exportPdf(Invoice i) => pdfEngine.render(i);
}` : `// recipeflow: low-end optimization
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
}`}
                </pre>
                <div className="mt-5 flex gap-2">
                  {projects[activeProject].tech.slice(0,4).map(t=>(
                    <span key={t} className="text-[11px] rounded-lg border border-white/10 bg-white/5 px-2 py-1">{t}</span>
                  ))}
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Skills */}
      <section id="skills" className="relative border-t border-white/5">
        <div className="mx-auto max-w-[1200px] px-6 py-16 md:py-20">
          <div className="flex items-baseline justify-between">
            <h3 className="text-[24px] md:text-[30px] font-semibold">Technical skills</h3>
            <div className="text-[12px] text-white/50">Dart • Flutter • Clean Architecture</div>
          </div>

          <div className="mt-8 grid md:grid-cols-5 gap-4">
            {skills.map((group)=>(
              <div key={group.cat} className="rounded-[22px] border border-white/10 bg-white/[0.03] p-4 backdrop-blur">
                <div className="text-[11px] uppercase tracking-widest text-white/50">{group.cat}</div>
                <div className="mt-3 flex flex-wrap gap-1.5">
                  {group.items.map(item=>(
                    <span key={item} className="inline-flex items-center gap-1.5 rounded-full border border-white/10 bg-[#0b1226] px-2.5 py-1 text-[12px] text-white/85 hover:bg-white/10 transition">
                      <span className="h-1.5 w-1.5 rounded-full bg-gradient-to-r from-[#02569B] to-cyan-400"/>
                      {item}
                    </span>
                  ))}
                </div>
              </div>
            ))}
          </div>

          {/* Stats strip */}
          <div className="mt-10 grid grid-cols-2 md:grid-cols-4 gap-3">
            {[
              {l:"Architecture",v:"Clean / MVVM / SOLID"},
              {l:"State Mgmt",v:"Riverpod • Provider"},
              {l:"Backend",v:"Firebase • REST"},
              {l:"AI",v:"Gemini • Speech-to-Text"},
            ].map(s=>(
              <div key={s.l} className="rounded-2xl border border-white/10 bg-gradient-to-b from-white/[0.06] to-white/[0.02] p-4">
                <div className="text-[11px] text-white/50">{s.l}</div>
                <div className="mt-1 text-[14px] font-medium">{s.v}</div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Experience */}
      <section id="experience" className="relative border-t border-white/5">
        <div className="mx-auto max-w-[1200px] px-6 py-16 md:py-24">
          <h3 className="text-[24px] md:text-[30px] font-semibold">Experience</h3>
          <div className="mt-8 relative">
            <div className="absolute left-4 md:left-1/2 top-0 bottom-0 w-px bg-gradient-to-b from-white/20 via-white/10 to-transparent md:-translate-x-px" />
            <div className="space-y-10">
              {/* Job 1 */}
              <div className="relative grid md:grid-cols-2 gap-6 md:gap-12">
                <div className="md:text-right md:pr-12">
                  <div className="inline-flex items-center gap-2 text-[12px] text-white/60">
                    <span className="h-1.5 w-1.5 rounded-full bg-emerald-400"/>
                    Aug 2025 – Present
                  </div>
                  <h4 className="mt-1 text-[20px] font-semibold">Flutter Developer — Techroz Solutions</h4>
                  <p className="mt-2 text-[14px] leading-relaxed text-white/70">Designed & deployed 10+ production Flutter apps using Clean Architecture, Riverpod, Firebase & REST. Built offline-first with SQLite, integrated Gemini & STT, optimized responsiveness by 30%.</p>
                </div>
                <div className="relative md:pl-12">
                  <div className="absolute left-4 md:-left-[9px] top-1 h-[18px] w-[18px] rounded-full border border-white/20 bg-[#050816] grid place-items-center">
                    <span className="h-2 w-2 rounded-full bg-[#02569B] shadow-[0_0_20px_rgba(2,86,155,0.8)]"/>
                  </div>
                  <div className="rounded-2xl border border-white/10 bg-white/[0.03] p-4 backdrop-blur">
                    <ul className="text-[13px] text-white/75 space-y-1.5 list-disc list-inside">
                      <li>Full-cycle Play Store deployments, CI/CD, versioning, ASO</li>
                      <li>Pagination, memory management, efficient state</li>
                      <li>AI workflows, third-party REST integrations</li>
                    </ul>
                  </div>
                </div>
              </div>
              {/* Job 2 */}
              <div className="relative grid md:grid-cols-2 gap-6 md:gap-12">
                <div className="md:order-2 md:pl-12">
                  <div className="inline-flex items-center gap-2 text-[12px] text-white/60">
                    <span className="h-1.5 w-1.5 rounded-full bg-cyan-400"/>
                    Mar 2025 – Jun 2025
                  </div>
                  <h4 className="mt-1 text-[20px] font-semibold">Flutter Intern — Dev Valley (NAVTTC)</h4>
                  <p className="mt-2 text-[14px] leading-relaxed text-white/70">Led a 3-member team to deliver a book-sharing platform 15% ahead of schedule. Enforced Clean Architecture & SOLID via code reviews.</p>
                </div>
                <div className="relative md:order-1 md:text-right md:pr-12">
                  <div className="absolute left-4 md:right-[-9px] md:left-auto top-1 h-[18px] w-[18px] rounded-full border border-white/20 bg-[#050816] grid place-items-center">
                    <span className="h-2 w-2 rounded-full bg-cyan-400 shadow-[0_0_20px_rgba(34,211,238,0.8)]"/>
                  </div>
                  <div className="rounded-2xl border border-white/10 bg-white/[0.03] p-4 backdrop-blur inline-block">
                    <ul className="text-[13px] text-white/75 space-y-1.5 list-disc list-inside text-left">
                      <li>Agile sprints, task delegation</li>
                      <li>Architecture design, prototyping</li>
                      <li>Production-ready delivery</li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Education + Contact */}
      <section id="contact" className="relative border-t border-white/5">
        <div className="mx-auto max-w-[1200px] px-6 py-16 md:py-20">
          <div className="grid lg:grid-cols-[1.1fr_0.9fr] gap-10 items-start">
            <div>
              <h3 className="text-[24px] md:text-[30px] font-semibold">Education & Certifications</h3>
              <div className="mt-6 space-y-4">
                <div className="rounded-[22px] border border-white/10 bg-white/[0.03] p-5 backdrop-blur">
                  <div className="flex items-start justify-between gap-4">
                    <div>
                      <div className="text-[13px] text-white/60">2021 – 2025</div>
                      <div className="mt-1 text-[18px] font-medium">BSc Information Technology</div>
                      <div className="text-white/70 text-[13px]">Punjab University, Lahore • CGPA 3.14/4.00</div>
                    </div>
                    <span className="rounded-full border border-white/10 bg-white/5 px-2.5 py-1 text-[11px]">Mobile App Dev • SE • OOP • DB • DSA</span>
                  </div>
                </div>
                <div className="rounded-[22px] border border-white/10 bg-white/[0.03] p-5 backdrop-blur">
                  <div className="flex items-start justify-between gap-4">
                    <div>
                      <div className="text-[13px] text-white/60">2025</div>
                      <div className="mt-1 text-[18px] font-medium">Flutter Mobile Development — NAVTTC</div>
                      <div className="text-white/70 text-[13px]">Govt. of Pakistan • via Dev Valley</div>
                    </div>
                    <span className="rounded-full border border-white/10 bg-white/5 px-2.5 py-1 text-[11px]">Merit-based</span>
                  </div>
                </div>
              </div>
            </div>

            <div className="lg:pl-6">
              <div className="relative overflow-hidden rounded-[28px] border border-white/10 bg-gradient-to-b from-[#0b1226] to-[#050816] p-[1px]">
                <div className="rounded-[27px] bg-[#070c1a]/80 backdrop-blur-xl p-6">
                  <div className="flex items-center justify-between">
                    <h4 className="text-[20px] font-semibold">Let’s build your Flutter app</h4>
                    <div className="h-8 w-8 rounded-xl bg-gradient-to-br from-[#02569B] to-cyan-400 grid place-items-center">
                      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="black" strokeWidth="2"><path d="M22 2L11 13M22 2l-7 20-4-9-9-4 20-7z"/></svg>
                    </div>
                  </div>
                  <p className="mt-2 text-[14px] text-white/70">Fast, offline-first, AI-ready apps with clean architecture and Play Store expertise.</p>
                  <div className="mt-5 grid gap-2.5">
                    <a href="mailto:huzaifaejazdev@gmail.com" className="group flex items-center justify-between rounded-xl border border-white/10 bg-white/5 px-4 py-3 hover:bg-white/10 transition">
                      <div className="flex items-center gap-3">
                        <div className="h-8 w-8 rounded-lg bg-white/10 grid place-items-center">
                          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.75"><path d="M4 4h16v16H4z" opacity=".2"/><path d="M22 6l-10 7L2 6"/></svg>
                        </div>
                        <div>
                          <div className="text-[12px] text-white/50 leading-none">Email</div>
                          <div className="text-[14px] font-medium">huzaifaejazdev@gmail.com</div>
                        </div>
                      </div>
                      <svg className="opacity-60 group-hover:translate-x-0.5 transition" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M9 18l6-6-6-6"/></svg>
                    </a>
                    <div className="grid grid-cols-2 gap-2.5">
                      <a href="https://github.com" target="_blank" className="flex items-center gap-2 rounded-xl border border-white/10 bg-white/5 px-4 py-3 hover:bg-white/10 transition text-[13px]">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M12 .5a12 12 0 0 0-3.79 23.4c.6.11.82-.26.82-.58v-2.02c-3.34.73-4.04-1.61-4.04-1.61-.55-1.4-1.34-1.77-1.34-1.77-1.1-.75.08-.74.08-.74 1.22.09 1.86 1.25 1.86 1.25 1.08 1.85 2.83 1.31 3.52 1 .11-.78.42-1.31.76-1.61-2.67-.3-5.47-1.34-5.47-5.95 0-1.31.47-2.38 1.24-3.22-.12-.3-.54-1.52.12-3.17 0 0 1.01-.32 3.3 1.23a11.5 11.5 0 0 1 6 0c2.29-1.55 3.3-1.23 3.3-1.23.66 1.65.24 2.87.12 3.17.77.84 1.24 1.91 1.24 3.22 0 4.62-2.8 5.64-5.48 5.94.43.37.81 1.1.81 2.22v3.29c0 .32.22.7.83.58A12 12 0 0 0 12 .5z"/></svg>
                        GitHub
                      </a>
                      <a href="https://linkedin.com" target="_blank" className="flex items-center gap-2 rounded-xl border border-white/10 bg-white/5 px-4 py-3 hover:bg-white/10 transition text-[13px]">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M4.98 3.5C4.98 4.88 3.86 6 2.5 6S0 4.88 0 3.5 1.12 1 2.5 1 4.98 2.12 4.98 3.5zM0 8h5v16H0zM8 8h4.8v2.2h.07c.67-1.27 2.3-2.6 4.73-2.6 5.06 0 6 3.33 6 7.66V24h-5v-7.1c0-1.7-.03-3.88-2.36-3.88-2.36 0-2.72 1.84-2.72 3.75V24H8z"/></svg>
                        LinkedIn
                      </a>
                    </div>
                  </div>
                  <div className="mt-5 rounded-xl border border-white/10 bg-[#0b1226] p-3 text-[12px] text-white/70">
                    Based in Gujranwala, Pakistan • Open to remote Flutter contracts
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="border-t border-white/5">
        <div className="mx-auto max-w-[1200px] px-6 h-[72px] flex items-center justify-between text-[12px] text-white/50">
          <div className="flex items-center gap-2">
            <span className="h-1.5 w-1.5 rounded-full bg-[#02569B]"/>
            © {new Date().getFullYear()} Huzaifa Ejaz Kahlon — Flutter Developer
          </div>
          <div className="hidden md:flex items-center gap-4">
            <span>Clean Architecture</span>
            <span>•</span>
            <span>Riverpod</span>
            <span>•</span>
            <span>Firebase</span>
            <span>•</span>
            <span>Offline-first</span>
          </div>
        </div>
      </footer>

      {/* subtle grid overlay on hover */}
      <style>{`
        @media (prefers-reduced-motion: no-preference) {
          * { scroll-behavior: smooth; }
        }
      `}</style>
    </div>
  );
}
// Zod Schema
export const Schema = {
    "commentary": "Built a top 1% Flutter developer portfolio with React that FEELS like a native Flutter web app. Implemented dark, animated design with Flutter blue (#02569B) gradients, glassmorphism, and bento-grid layout. Features interactive phone mockup showing real Dart/Riverpod code from CV projects, animated background orbs, timeline experience, and rich micro-interactions. All content pulled directly from Huzaifa's CV - 10+ apps, 30% perf gains, FeynLearn/Invoice Maker/RecipeFlow projects. Designed to showcase Clean Architecture, Riverpod, Firebase expertise with Flutter-inspired aesthetics.",
    "template": "next-forge",
    "title": "Huzaifa Ejaz — Flutter Developer Portfolio",
    "description": "A premium, animated portfolio for Huzaifa Ejaz Kahlon, Flutter Developer specializing in Clean Architecture, Riverpod, and Firebase. Features 10+ production apps including AI-powered FeynLearn, offline-first Invoice Maker, and RecipeFlow. Showcases 1 year experience with 30% performance optimizations, Play Store deployments, and CI/CD expertise. Built with Flutter-inspired design system, dark mode, and interactive project showcases.",
    "additional_dependencies": [],
    "has_additional_dependencies": false,
    "install_dependencies_command": "",
    "port": 3000,
    "file_path": "pages/index.tsx",
    "code": "<see code above>"
}