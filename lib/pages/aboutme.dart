// ignore_for_file: library_private_types_in_public_api

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrithikport/widgets/drawer.dart';
import 'package:hrithikport/widgets/social.dart';

class Aboutme extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDark;
  const Aboutme({super.key, required this.isDark, required this.onThemeToggle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBackground(isDark: isDark),
        Scaffold(
          endDrawer: CustomDrawer(
            isDark: isDark,
            onItemTap: (route) {
              Navigator.pop(context); // close drawer
              // Handle route change
            },
            onThemeToggle: onThemeToggle,
          ),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'About Me',
              style: GoogleFonts.kristi(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: isDark ? Colors.black : Colors.white,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FrostedCard(child: AboutMeIntroSection(isDark: isDark)),
                const SizedBox(height: 32),
                FrostedCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Skill Proficiency",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      AnimatedSkillBar(
                        skill: "Flutter",
                        level: 0.95,
                        color: Colors.redAccent,
                      ),
                      AnimatedSkillBar(
                        skill: "Firebase",
                        level: 0.85,
                        color: Colors.lime,
                      ),
                      AnimatedSkillBar(
                        skill: "Dart",
                        level: 0.95,
                        color: Colors.blue,
                      ),
                      AnimatedSkillBar(
                        skill: "Kotlin",
                        level: 0.75,
                        color: Colors.orangeAccent,
                      ),
                      AnimatedSkillBar(
                        skill: "Web Dev",
                        level: 0.8,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
                FrostedCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Timeline",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      FrostedCard(child: GrowthTimeline(isDark: isDark)),
                      const SizedBox(height: 16),
                      Text(
                        "Connect With Me",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Here are my social profiles. Feel free to connect! and check out my projects.",
                        style: TextStyle(
                          fontSize: 18,

                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      FrostedCard(
                        child: SocialIconsAnimatedColumn(isDark: isDark),
                      ),
                    ],
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

class AnimatedBackground extends StatefulWidget {
  final bool isDark;
  const AnimatedBackground({super.key, required this.isDark});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<Alignment>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: _animation.value,
              end: Alignment.center,
              colors: widget.isDark
                  ? [Colors.deepPurple.shade900, Colors.black]
                  : [Colors.blue.shade100, Colors.white],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AboutMeIntroSection extends StatelessWidget {
  final bool isDark;

  const AboutMeIntroSection({super.key, required this.isDark});

  TextStyle get headingStyle => TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: isDark ? Colors.white : Colors.black,
  );

  TextStyle get bodyStyle => TextStyle(
    fontSize: 16,
    height: 1.6,
    color: isDark ? Colors.white70 : Colors.black87,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Introduction
        Text(
          "Hi, I'm Sai Hrithik Reddy Movva,",
          style: headingStyle.copyWith(fontSize: 26),
        ),
        const SizedBox(height: 8),
        Text(
          "A passionate Flutter developer and software engineer with a knack for building beautiful, performant apps and websites.",
          style: bodyStyle,
        ),
        const SizedBox(height: 24),

        // Skills
        Text("Skills & Technologies", style: headingStyle),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: [
            _buildSkillChip("Flutter & Dart"),
            _buildSkillChip("Firebase"),
            _buildSkillChip("Web (HTML, CSS, JS)"),
            _buildSkillChip("UI/UX Design"),
            _buildSkillChip("API Integration"),
            _buildSkillChip("Git"),
            _buildSkillChip("Kotlin"),
            _buildSkillChip("IOS Development"),
            _buildSkillChip("Android Development"),
            _buildSkillChip("MongoDB"),
          ],
        ),
        const SizedBox(height: 24),

        // Experience & Achievements
        Text("Experience & Achievements", style: headingStyle),
        const SizedBox(height: 8),
        _buildBullet("Contracted with 5+ companies across India and the USA."),
        _buildBullet("Migrated multiple legacy projects to Flutter"),
        _buildBullet(
          "Built high-traffic web portfolios & apps with dynamic features",
        ),
        const SizedBox(height: 24),

        // Passion
        Text("What Drives Me", style: headingStyle),
        const SizedBox(height: 8),
        Text(
          "I love solving complex problems and bringing ideas to life through code. Creating smooth user experiences is my ultimate goal.",
          style: bodyStyle,
        ),
        const SizedBox(height: 24),

        // Fun Facts
        Text("Fun Facts", style: headingStyle),
        const SizedBox(height: 8),
        Text(
          "When I’m not coding, I’m exploring new music, Cricket, Badminton, Dancing or hiking.",
          style: bodyStyle,
        ),
        const SizedBox(height: 24),

        // Call to Action
        Text("Let’s Connect", style: headingStyle),
        const SizedBox(height: 8),
        Text(
          "Feel free to check out my projects or get in touch!",
          style: bodyStyle,
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }

  Widget _buildSkillChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: isDark
          ? Colors.tealAccent.withAlpha((0.2).toInt())
          : Colors.blue.shade50,
      labelStyle: TextStyle(
        color: isDark ? Colors.tealAccent : Colors.blueAccent,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 18)),
          Expanded(child: Text(text, style: bodyStyle)),
        ],
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
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha((0.1).toInt()),
            border: Border.all(color: Colors.white.withAlpha((0.2).toInt())),
            borderRadius: BorderRadius.circular(24),
          ),
          child: child,
        ),
      ),
    );
  }
}

class AnimatedSkillBar extends StatelessWidget {
  final String skill;
  final double level;
  final Color color;

  const AnimatedSkillBar({
    super.key,
    required this.skill,
    required this.level,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: level),
      duration: const Duration(seconds: 2),
      builder: (context, value, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(skill, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: value,
            minHeight: 10,
            backgroundColor: Colors.grey.shade300,
            color: color,
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class GrowthTimeline extends StatelessWidget {
  final bool isDark;

  const GrowthTimeline({super.key, required this.isDark});

  final List<_Milestone> milestones = const [
    _Milestone(year: '2019', description: 'Started learning Flutter & Dart'),
    _Milestone(year: '2020', description: 'Built first freelance app'),
    _Milestone(year: '2021', description: 'Freelanced with tech companies'),
    _Milestone(
      year: '2022',
      description: 'Migrated legacy projects to Flutter',
    ),
    _Milestone(
      year: '2023',
      description:
          'Researched multiple apps along with University of North Texas Faculty.',
    ),
    _Milestone(
      year: '2024',
      description: 'Deployed multiple web portfolios & apps',
    ),
    _Milestone(
      year: '2025',
      description: 'Developing multiple web portfolios & apps',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: milestones.map((m) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              // Year circle
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isDark ? Colors.tealAccent : Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  m.year,
                  style: TextStyle(
                    color: isDark ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Description
              Expanded(
                child: Text(
                  m.description,
                  style: TextStyle(
                    color: isDark ? Colors.white70 : Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _Milestone {
  final String year;
  final String description;

  const _Milestone({required this.year, required this.description});
}

// class SkillProgressBars extends StatelessWidget {
//   final bool isDark;

//   const SkillProgressBars({super.key, required this.isDark});

//   final List<_Skill> skills = const [
//     _Skill(name: 'Flutter & Dart', level: 0.9),
//     _Skill(name: 'Firebase', level: 0.75),
//     _Skill(name: 'Web Development', level: 0.7),
//     _Skill(name: 'UI/UX Design', level: 0.65),
//     _Skill(name: 'API Integration', level: 0.8),
//     _Skill(name: 'Git & Version Control', level: 0.85),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: skills.map((skill) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 skill.name,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                   color: isDark ? Colors.white : Colors.black87,
//                 ),
//               ),
//               const SizedBox(height: 6),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(6),
//                 child: LinearProgressIndicator(
//                   value: skill.level,
//                   minHeight: 12,
//                   backgroundColor: isDark
//                       ? Colors.white12
//                       : Colors.grey.shade300,
//                   valueColor: AlwaysStoppedAnimation<Color>(
//                     isDark ? Colors.tealAccent : Colors.blueAccent,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

// class _Skill {
//   final String name;
//   final double level; // 0.0 to 1.0

//   const _Skill({required this.name, required this.level});
// }
