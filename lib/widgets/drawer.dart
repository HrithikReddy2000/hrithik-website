import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrithikport/pages/aboutme.dart';
import 'package:hrithikport/pages/contact.dart';
import 'package:hrithikport/pages/homepage.dart';
import 'package:hrithikport/pages/projects.dart';
import 'package:hrithikport/pages/resume.dart';
import 'package:hrithikport/widgets/social.dart';

class CustomDrawer extends StatelessWidget {
  final bool isDark;
  final VoidCallback onThemeToggle;
  final Function(String route) onItemTap;

  const CustomDrawer({
    super.key,
    required this.isDark,
    required this.onItemTap,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.white.withAlpha((0.05).toInt())
                  : Colors.black.withAlpha((0.05).toInt()),
              border: Border.all(color: Colors.white.withAlpha((0.2).toInt())),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Navigate My Portfolio",
                    style: GoogleFonts.montserrat(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.tealAccent,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                HoverDrawerItem(
                  title: "Home",
                  icon: Icons.home,
                  isDark: isDark,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => HomePage(
                          onThemeToggle: onThemeToggle,
                          themeMode: ThemeMode.system,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                HoverDrawerItem(
                  title: "About Me",
                  icon: Icons.person,
                  isDark: isDark,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => Aboutme(
                          isDark: isDark,
                          onThemeToggle: onThemeToggle,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                HoverDrawerItem(
                  title: "Projects",
                  icon: Icons.work,
                  isDark: isDark,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => Projects(
                          isDark: isDark,
                          onThemeToggle: onThemeToggle,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                HoverDrawerItem(
                  title: "Resume",
                  icon: Icons.file_copy,
                  isDark: isDark,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => Resume(
                          isDark: isDark,
                          onThemeToggle: onThemeToggle,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                HoverDrawerItem(
                  title: "Contact",
                  icon: Icons.phone,
                  isDark: isDark,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ContactMe(
                          isDark: isDark,
                          onThemeToggle: onThemeToggle,
                        ),
                      ),
                    );
                  },
                ),
                const Spacer(),
                Text(
                  "Made with ❤️ in Flutter",
                  style: TextStyle(
                    color: isDark ? Colors.white54 : Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AnimatedSocialIcon(
                        icon: FontAwesomeIcons.github,
                        color: Colors.black,
                        hoverColor: Colors.white,
                        url: 'https://github.com/HrithikReddy2000',
                      ),
                      SizedBox(width: 16),
                      AnimatedSocialIcon(
                        icon: FontAwesomeIcons.linkedin,
                        color: Colors.blue[900]!,
                        hoverColor: Colors.lightBlue,
                        url:
                            'https://www.linkedin.com/in/sai-hrithik-reddy-movva-a7a8a8199/',
                      ),
                      SizedBox(width: 16),
                      AnimatedSocialIcon(
                        icon: FontAwesomeIcons.x,
                        color: Colors.black,
                        hoverColor: Colors.white,
                        url: 'https://x.com/movva_sai58334',
                      ),
                      SizedBox(width: 16),
                      AnimatedSocialIcon(
                        icon: Icons.email,
                        color: Colors.red,
                        hoverColor: Colors.redAccent,
                        url: 'mailto:saihrithikreddymovva@gmail.com',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HoverDrawerItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool isDark;
  final Function() onTap;

  const HoverDrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isDark,
    required this.onTap,
  });

  @override
  State<HoverDrawerItem> createState() => _HoverDrawerItemState();
}

class _HoverDrawerItemState extends State<HoverDrawerItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isHovered
              ? (widget.isDark
                    ? Colors.white.withAlpha((0.05 * 255).toInt())
                    : Colors.black.withAlpha((0.05 * 255).toInt()))
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Colors.cyanAccent.withAlpha((0.4 * 255).toInt()),
                    blurRadius: 8,
                  ),
                ]
              : [],
        ),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: isHovered
                    ? Colors.limeAccent
                    : widget.isDark
                    ? Colors.white70
                    : Colors.black87,
              ),
              const SizedBox(width: 16),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
                  color: isHovered
                      ? Colors.redAccent
                      : widget.isDark
                      ? Colors.white
                      : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
