import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrithikport/pages/aboutme.dart';
import 'package:hrithikport/pages/contact.dart';
import 'package:hrithikport/pages/projects.dart';
import 'package:hrithikport/pages/resume.dart';
import 'package:hrithikport/widgets/social.dart';
import 'package:rive/rive.dart' hide LinearGradient, RadialGradient;

class HomePage extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final ThemeMode themeMode;

  const HomePage({
    super.key,
    required this.onThemeToggle,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        SideGlowBackdrop(isDark: isDark),
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Scaffold(
            extendBodyBehindAppBar: false,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: false,
              title: Text(
                'Hrithik Reddy\'s Page',
                style: GoogleFonts.kristi(fontSize: 28),
              ),
              backgroundColor: isDark ? Colors.black : Colors.white,
              elevation: 0,
              actions: [
                TextButton(
                  child: Text('Home', style: GoogleFonts.kristi(fontSize: 28)),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text(
                    'About Me',
                    style: GoogleFonts.kristi(fontSize: 28),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (_) => Aboutme(
                              isDark: isDark,
                              onThemeToggle: onThemeToggle,
                            ),
                      ),
                    );
                  },
                ),
                TextButton(
                  child: Text(
                    'Projects',
                    style: GoogleFonts.kristi(fontSize: 28),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (_) => Projects(
                              isDark: isDark,
                              onThemeToggle: onThemeToggle,
                            ),
                      ),
                    );
                  },
                ),
                TextButton(
                  child: Text(
                    'Resume',
                    style: GoogleFonts.kristi(fontSize: 28),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (_) => Resume(
                              isDark: isDark,
                              onThemeToggle: onThemeToggle,
                            ),
                      ),
                    );
                  },
                ),
                TextButton(
                  child: Text(
                    'Contact',
                    style: GoogleFonts.kristi(fontSize: 28),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (_) => ContactMe(
                              isDark: isDark,
                              onThemeToggle: onThemeToggle,
                            ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(
                    themeMode == ThemeMode.dark
                        ? Icons.wb_sunny
                        : Icons.nightlight,
                  ),
                  onPressed: onThemeToggle,
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Stack(
                children: [
                  CustomPaint(
                    painter: ProAbstractPainter(isDark: isDark),
                    size: Size.infinite,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final isWide = constraints.maxWidth > 600;
                          return isWide
                              ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Expanded(
                                    flex: 1,
                                    child: AnimatedProfileInfo(),
                                  ),
                                  const SizedBox(width: 32),
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      height: 300,
                                      child: RiveAnimation.asset(
                                        isDark
                                            ? 'assets/animations/mobile_app_development_trans.riv'
                                            : 'assets/animations/mobile_app_development_trans.riv',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                              : const AnimatedProfileInfo();
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SocialIconsAnimatedColumn(isDark: isDark),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AbstractPage extends StatelessWidget {
  const AbstractPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(double.infinity, double.infinity),
            painter: ProAbstractPainter(isDark: isDark),
          ),
          Center(
            child: Text(
              'Welcome to My Portfolio',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProAbstractPainter extends CustomPainter {
  late final bool isDark;
  ProAbstractPainter({required this.isDark});
  @override
  void paint(Canvas canvas, Size size) {
    // Gradient Paint 1 - Background Wave
    final rect1 = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint1 =
        Paint()
          ..shader = LinearGradient(
            colors:
                isDark
                    ? [
                      Color(0xFF0F2027),
                      Color(0xFF3B2BFF),
                      Colors.white,
                    ] // dark blue shades
                    : [Color(0xFF6C63FF), Color(0xFF3B2BFF), Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(rect1)
          ..style = PaintingStyle.fill
          ..isAntiAlias = true;

    final path1 =
        Path()
          ..moveTo(0, size.height * 0.7)
          ..quadraticBezierTo(
            size.width * 0.25,
            size.height * 0.6,
            size.width * 0.5,
            size.height * 0.8,
          )
          ..quadraticBezierTo(
            size.width * 0.75,
            size.height * 0.95,
            size.width,
            size.height * 0.7,
          )
          ..lineTo(size.width, size.height)
          ..lineTo(0, size.height)
          ..close();
    canvas.drawPath(path1, paint1);

    // Gradient Paint 2 - Upper Blob
    final paint2 =
        Paint()
          ..shader = RadialGradient(
            colors:
                isDark
                    ? [Color(0xFF00F5A0), Color(0xFF00D9F5)] // neon teal-cyan
                    : [Color(0xFFFF6584), Color(0xFFFF89A9)],
            center: Alignment.center,
            radius: 0.8,
          ).createShader(rect1)
          ..style = PaintingStyle.fill
          ..isAntiAlias = true;

    final path2 =
        Path()
          ..moveTo(size.width * 0.8, size.height * 0.3)
          ..cubicTo(
            size.width * 0.6,
            size.height * 0.1,
            size.width * 0.4,
            size.height * 0.5,
            size.width * 0.2,
            size.height * 0.25,
          )
          ..cubicTo(
            size.width * 0.0,
            size.height * 0.0,
            size.width * 0.3,
            0,
            size.width * 0.5,
            size.height * 0.1,
          )
          ..close();
    canvas.drawPath(path2, paint2);

    // Green soft circle
    final paint3 =
        Paint()
          ..color =
              isDark
                  ? Color(0xFF00FF9C)
                  : Color(0xFF43E97B).withAlpha((0.2 * 255).toInt());
    canvas.drawCircle(
      Offset(size.width * 0.15, size.height * 0.15),
      120,
      paint3,
    );

    // Yellow accent circle
    final paint4 =
        Paint()
          ..color = (isDark ? Color(0xFFFFD700) : Color(0xFFFFD700)).withBlue(
            (0.18 * 255).toInt(),
          );
    canvas.drawCircle(Offset(size.width * 0.85, size.height * 0.1), 90, paint4);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class AnimatedTextReveal extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const AnimatedTextReveal({
    required this.child,
    this.delay = const Duration(milliseconds: 300),
    super.key,
  });

  @override
  State<AnimatedTextReveal> createState() => _AnimatedTextRevealState();
}

class _AnimatedTextRevealState extends State<AnimatedTextReveal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: FadeTransition(opacity: _opacityAnimation, child: widget.child),
    );
  }
}

class AnimatedProfileInfo extends StatefulWidget {
  const AnimatedProfileInfo({super.key});

  @override
  State<AnimatedProfileInfo> createState() => _AnimatedProfileInfoState();
}

class _AnimatedProfileInfoState extends State<AnimatedProfileInfo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const RotatingGradientAvatar(),
            const SizedBox(height: 16),
            AnimatedTextReveal(
              delay: Duration(milliseconds: 200),
              child: Text(
                "Sai Hrithik Reddy Movva",
                style: GoogleFonts.montserrat().merge(
                  Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: isDark ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),
            TypewriterText(
              text:
                  "Flutter Developer | Application Developer | Software Developer\n"
                  "Responsive apps | UI/UX | Legacy migrations.",
              style: TextStyle(
                fontSize: 18,
                color: isDark ? Colors.white70 : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;

  const TypewriterText({
    super.key,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 60),
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  String _visibleText = '';
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() async {
    while (_currentIndex < widget.text.length) {
      await Future.delayed(widget.duration);
      if (!mounted) return;
      setState(() {
        _visibleText += widget.text[_currentIndex];
        _currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(_visibleText, style: widget.style);
  }
}

class RotatingGradientAvatar extends StatefulWidget {
  const RotatingGradientAvatar({super.key});

  @override
  State<RotatingGradientAvatar> createState() => _RotatingGradientAvatarState();
}

class _RotatingGradientAvatarState extends State<RotatingGradientAvatar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * pi,
                child: child,
              );
            },
            child: ShaderMask(
              shaderCallback: (rect) {
                return SweepGradient(
                  colors: const [
                    Colors.red,
                    Colors.yellow,
                    Colors.lime,
                    Colors.indigo,
                    Colors.green,
                    Colors.cyan,
                    Colors.pink,
                  ],
                  startAngle: 0.0,
                  endAngle: 2 * pi,
                  tileMode: TileMode.clamp,
                ).createShader(rect);
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/images/myimage.jpeg'),
          ),
        ],
      ),
    );
  }
}

class SideGlowBackdrop extends StatelessWidget {
  final bool isDark;

  const SideGlowBackdrop({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      bottom: 0,
      width: 100,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  isDark
                      ? Colors.red.withAlpha((0.2 * 255).toInt())
                      : Colors.redAccent.withAlpha((0.2 * 255).toInt()),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
              child: Container(color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}
