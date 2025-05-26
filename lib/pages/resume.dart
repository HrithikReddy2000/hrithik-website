import 'package:flutter/material.dart';
import 'package:hrithikport/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Resume extends StatefulWidget {
  final bool isDark;
  final VoidCallback onThemeToggle;
  const Resume({super.key, required this.isDark, required this.onThemeToggle});

  @override
  ResumeState createState() => ResumeState();
}

class ResumeState extends State<Resume> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _contentAnimation;
  late Animation<double> _buttonScaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    _contentAnimation = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.7, curve: Curves.easeOut),
    );
    _buttonScaleAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 1.05,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.05,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50,
      ),
    ]).animate(CurvedAnimation(parent: _controller, curve: Interval(0.7, 1.0)));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _downloadResume() async {
    const url =
        'https://hrithikreddy2000.github.io/hrithik-website/assets/assets/animations/resume.pdf'; // Replace with your actual resume URL
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not open resume link')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDark;

    final bgColor = isDark ? Colors.black : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black;
    final buttonColor = isDark ? Colors.tealAccent : Colors.blue;

    return Scaffold(
      backgroundColor: bgColor,
      endDrawer: CustomDrawer(
        isDark: isDark,
        onItemTap: (route) {
          Navigator.of(context).pop();
        },
        onThemeToggle: widget.onThemeToggle,
      ),
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text('My Resume', style: TextStyle(color: textColor)),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
      ),
      body: FadeTransition(
        opacity: _contentAnimation,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(
                'Sai Hrithik Reddy Movva',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Application Developer | Flutter Engineer | Software Developer',
                style: TextStyle(
                  fontSize: 18,
                  color: textColor.withAlpha((0.7 * 255).toInt()),
                ),
              ),
              Text(
                'Email: saihrithikreddymovva@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: textColor.withAlpha((255 * 0.7).toInt()),
                ),
              ),
              Text(
                'Phone: 646-262-1330',
                style: TextStyle(
                  fontSize: 16,
                  color: textColor.withAlpha((255 * 0.7).toInt()),
                ),
              ),
              Divider(
                height: 40,
                color: textColor.withAlpha((255 * 0.5).toInt()),
              ),
              Text(
                'Summary',
                style: TextStyle(
                  fontSize: 22,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Passionate developer with expertise in Flutter, Firebase, and web technologies. Experienced in building scalable apps and beautiful portfolios.',
                style: TextStyle(
                  fontSize: 16,
                  color: textColor.withAlpha((0.8 * 255).toInt()),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Education',
                style: TextStyle(
                  fontSize: 22,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 6),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'University Of North Texas, Aug 2022 - May 2024',
                  style: TextStyle(color: textColor),
                ),
                subtitle: Text(
                  'Master of Science in InterDisciplinary Studies\t\tGPA: 3.0/4.0',
                  style: TextStyle(
                    color: textColor.withAlpha((0.8 * 255).toInt()),
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                subtitle: Text(
                  'Master of Science in Computer Engineering\t\tGPA: 3.0/4.0',
                  style: TextStyle(
                    color: textColor.withAlpha((0.8 * 255).toInt()),
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Gokaraju Rangaraju Institute of Engineering and Technology, June 2018 - May 2022',
                  style: TextStyle(color: textColor),
                ),
                subtitle: Text(
                  'Bachelor of Technology in Electrical and Electronics Engineering\t\tGPA: 8.34/10.0',
                  style: TextStyle(
                    color: textColor.withAlpha((0.8 * 255).toInt()),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Professional Experience',
                style: TextStyle(
                  fontSize: 22,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Application Developer - Informatics Inc, (remote), Denton, TX \t\tMay 2024 - Present',
                  style: TextStyle(color: textColor),
                ),
                subtitle: Text(
                  '● Working on the whole lifecycle of a project.\n● Developed a Flutter application for a client in the healthcare industry, integrating Firebase for backend services.\n● Implemented responsive design principles to ensure optimal user experience across devices.\n● Collaborated with cross-functional teams to deliver high-quality software solutions.',
                  style: TextStyle(
                    color: textColor.withAlpha((0.8 * 255).toInt()),
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Research Assitant - University of North Texas, Denton, TX \t\tAug 2022 - Present',
                  style: TextStyle(color: textColor),
                ),
                subtitle: Text(
                  '● Worked on a Project required by the university ‘Developing an Application of AI managed shopping online mart’ with guidance of my professor.',
                  style: TextStyle(
                    color: textColor.withAlpha((0.8 * 255).toInt()),
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Free Lancer - Hyderabad, India and Texas, USA \t\tFeb 2019 - Present',
                  style: TextStyle(color: textColor),
                ),
                subtitle: Text(
                  '● Developed Multiple Applications using Flutter and React for my clients.\n● Developed code and Designs on various requests.',
                  style: TextStyle(
                    color: textColor.withAlpha((0.8 * 255).toInt()),
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Teaching Assistant - Hyderabad, India \t\tMay 2021 - July 2022',
                  style: TextStyle(color: textColor),
                ),
                subtitle: Text(
                  '● Developed Codes and T echniques for 25 Junior Students and taught classes based on programming skills',
                  style: TextStyle(
                    color: textColor.withAlpha((0.8 * 255).toInt()),
                  ),
                ),
              ),
              Text(
                'Technical Skills',
                style: TextStyle(
                  fontSize: 22,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 6),
              SkillsSection(isDark: isDark),
              SizedBox(height: 20),
              Center(
                child: ScaleTransition(
                  scale: _buttonScaleAnimation,
                  child: ElevatedButton.icon(
                    onPressed: _downloadResume,
                    icon: Icon(
                      Icons.download,
                      color: isDark ? Colors.black : Colors.white,
                    ),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 24,
                      ),
                      child: Text(
                        'Download My Resume',
                        style: TextStyle(
                          fontSize: 18,
                          color: isDark ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: StadiumBorder(),
                      elevation: 8,
                      shadowColor: buttonColor.withAlpha((0.6 * 255).toInt()),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  final bool isDark;

  const SkillsSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final List<String> skills = [
      'Flutter',
      'Dart',
      'Firebase',
      'REST APIs',
      'Git',
      'CI/CD',
      'UI/UX Design',
      'Kotlin',
      'Java',
      'JavaScript',
      'HTML',
      'CSS',
      'Responsive Web Design',
      'PHP',
      'MySQL',
      'IOS Development',
      'Problem Solving',
      'Team Collaboration',
      'Communication',
      'Time Management',
      'Adaptability',
      'Attention to Detail',
      'Critical Thinking',
      'Creativity',
      'Debugging',
      'Testing',
      'Version Control',
      'Code Review',
      'Responsive Design',
      'State Management',
      'Animations',
      'Performance Optimization',
      'Cross-Platform Development',
      'Web Development',
      'Mobile Development',
      'API Integration',
      'Database Management',
      'Cloud Services',
      'Software Development Life Cycle (SDLC)',
      'Agile Methodologies',
      'Scrum',
      'Kanban',
      'Problem Analysis',
      'Solution Design',
      'Technical Documentation',
      'Project Management',
    ];

    final List<List<Color>> gradients = [
      [Colors.purple, Colors.deepPurple],
      [Colors.orange, Colors.deepOrange],
      [Colors.teal, Colors.green],
      [Colors.blue, Colors.lightBlue],
      [Colors.pink, Colors.redAccent],
      [Colors.indigo, Colors.cyan],
      [Colors.amber, Colors.yellow],
      [Colors.blueGrey, Colors.indigoAccent],
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: skills.asMap().entries.map((entry) {
          final index = entry.key;
          final skill = entry.value;
          final gradient = gradients[index % gradients.length];

          return HoverGradientChip(
            label: skill,
            hoverGradient: gradient,
            normalColor: isDark ? Colors.grey[850]! : Colors.grey[300]!,
            textColor: isDark ? Colors.white : Colors.black,
          );
        }).toList(),
      ),
    );
  }
}

class HoverGradientChip extends StatefulWidget {
  final String label;
  final List<Color> hoverGradient;
  final Color normalColor;
  final Color textColor;

  const HoverGradientChip({
    required this.label,
    required this.hoverGradient,
    required this.normalColor,
    required this.textColor,
    super.key,
  });

  @override
  State<HoverGradientChip> createState() => _HoverGradientChipState();
}

class _HoverGradientChipState extends State<HoverGradientChip> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          gradient: _hovering
              ? LinearGradient(colors: widget.hoverGradient)
              : null,
          color: _hovering ? null : widget.normalColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: _hovering
              ? [
                  BoxShadow(
                    color: widget.hoverGradient.first.withAlpha(
                      (255 * 0.4).toInt(),
                    ),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: widget.textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
