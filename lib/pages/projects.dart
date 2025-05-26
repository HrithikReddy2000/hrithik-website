import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrithikport/widgets/drawer.dart';

class Projects extends StatelessWidget {
  final bool isDark;
  final VoidCallback onThemeToggle;
  const Projects({
    super.key,
    required this.isDark,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedProjectsBackground(isDark: isDark),
        Scaffold(
          extendBodyBehindAppBar: false,
          endDrawer: CustomDrawer(
            isDark: isDark,
            onItemTap: (route) {
              Navigator.of(context).pop();
            },
            onThemeToggle: onThemeToggle,
          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "Projects",
              style: GoogleFonts.kristi(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Intro Text
                Text(
                  "Showcasing My Work",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: isDark ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Here are some of the applications and websites I've built using Flutter, Firebase, and other modern tech stacks. Click to explore more!",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),

                const SizedBox(height: 32),

                // Completed Projects Grid (or ongoing first if you want)
                GridView.builder(
                  physics:
                      const NeverScrollableScrollPhysics(), // Important to disable scrolling here
                  shrinkWrap: true, // Important to take minimum height needed
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: demoProjects.length,
                  itemBuilder: (context, index) => AnimatedProjectCard(
                    project: demoProjects[index],
                    isDark: isDark,
                  ),
                ),

                const SizedBox(height: 48),

                // Ongoing Projects Section
                const Text(
                  "Ongoing Projects",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                Text(
                  "These are exciting projects that are currently in progress and evolving.",
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),

                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: ongoingProjects.length,
                  itemBuilder: (context, index) => AnimatedProjectCard(
                    project: ongoingProjects[index],
                    isDark: isDark,
                  ),
                ),

                const SizedBox(height: 48),

                // Completed Projects Section
                const Text(
                  "Completed Projects",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: demoProjects.length,
                  itemBuilder: (context, index) => AnimatedProjectCard(
                    project: demoProjects[index],
                    isDark: isDark,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Sample ongoing projects list (create your own similar to demoProjects)
final List<Project> ongoingProjects = [
  Project(
    title: "Sports Club App",
    description:
        "Building a smart AI sports club app to enhance customer support for club support.",
    imagePath: "assets/images/ecclogo.jpeg",
  ),
  Project(
    title: "College  App",
    description:
        "A cross-platform mobile app to help students with college events and stats.",
    imagePath: "assets/images/griet.png",
  ),
  Project(
    title: "Restaurent Tracker App",
    description: "A cross-platform mobile app to help workers track orders.",
    imagePath: "assets/images/ontop.png",
  ),
];

class AnimatedProjectsBackground extends StatelessWidget {
  final bool isDark;
  const AnimatedProjectsBackground({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [Colors.indigo.shade900, Colors.black]
              : [Colors.lime.shade100, Colors.white],
        ),
      ),
    );
  }
}

class AnimatedProjectCard extends StatefulWidget {
  final Project project;
  final bool isDark;

  const AnimatedProjectCard({
    super.key,
    required this.project,
    required this.isDark,
  });

  @override
  State<AnimatedProjectCard> createState() => _AnimatedProjectCardState();
}

class _AnimatedProjectCardState extends State<AnimatedProjectCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _scaleAnim = Tween(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnim,
        child: FrostedCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Stack(
                    children: [
                      Image.asset(
                        widget.project.imagePath,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black26, Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                widget.project.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: widget.isDark ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.project.description,
                style: TextStyle(
                  color: widget.isDark ? Colors.white70 : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FrostedCard extends StatelessWidget {
  final Widget child;
  const FrostedCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha((0.1).toInt()),
            border: Border.all(color: Colors.white.withAlpha((0.2).toInt())),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}

class Project {
  final String title;
  final String description;
  final String imagePath;

  Project({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

final List<Project> demoProjects = [
  Project(
    title: "Portfolio Website",
    description:
        "A personal site built with Flutter Web and hosted with animations, responsive layout, and smooth navigation.",
    imagePath: "assets/images/myportfolio.png",
  ),
  Project(
    title: "Business Website",
    description:
        "An business website dashboard featuring dynamic Firebase-backed metrics and interactive animations.",
    imagePath: "assets/images/logo1.png",
  ),
  Project(
    title: "Sports Club App",
    description:
        "A full-featured Flutter sports club app including users, login, API integration, and animations.",
    imagePath: "assets/images/ecclogo.jpeg",
  ),
  Project(
    title: "College App",
    description:
        "College Application using custom NLP & Rive animations, embedded on business sites for support automation.",
    imagePath: "assets/images/griet.png",
  ),
];
