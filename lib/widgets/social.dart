import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimatedSocialIcon extends StatefulWidget {
  final IconData icon;
  final Color color;
  final Color hoverColor;
  final String url;
  final double size;

  const AnimatedSocialIcon({
    required this.icon,
    required this.color,
    required this.hoverColor,
    required this.url,
    this.size = 30,
    super.key,
  });

  @override
  State<AnimatedSocialIcon> createState() => _AnimatedSocialIconState();
}

class _AnimatedSocialIconState extends State<AnimatedSocialIcon> {
  bool _hovering = false;

  void _launchUrl() async {
    final Uri uri = Uri.parse(widget.url);
    if (!await launchUrl(uri)) {
      // ignore: avoid_print
      print('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: _launchUrl,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _hovering
                ? widget.hoverColor.withAlpha((255 * 0.2).toInt())
                : Colors.transparent,
          ),
          child: AnimatedScale(
            scale: _hovering ? 1.3 : 1.0,
            duration: Duration(milliseconds: 250),
            child: Icon(
              widget.icon,
              size: widget.size,
              color: _hovering ? widget.hoverColor : widget.color,
            ),
          ),
        ),
      ),
    );
  }
}

class SocialIconsAnimatedColumn extends StatefulWidget {
  final bool isDark;
  const SocialIconsAnimatedColumn({super.key, required this.isDark});

  @override
  State<SocialIconsAnimatedColumn> createState() =>
      _SocialIconsAnimatedColumnState();
}

class _SocialIconsAnimatedColumnState extends State<SocialIconsAnimatedColumn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(0.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
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
              hoverColor: Colors.black,
              url: 'https://x.com/movva_sai58334',
            ),
            SizedBox(width: 16),
            AnimatedSocialIcon(
              icon: Icons.email,
              color: Colors.red,
              hoverColor: Colors.redAccent,
              url: 'mailto:saihrithikreddymovva@gmail.com',
            ),
            SizedBox(width: 16),
            AnimatedSocialIcon(
              icon: FontAwesomeIcons.github,
              color: Colors.black,
              hoverColor: Colors.black,
              url: 'https://github.com/HrithikReddy2000',
            ),
            SizedBox(width: 16),
            AnimatedSocialIcon(
              icon: FontAwesomeIcons.instagram,
              color: Colors.lightBlue,
              hoverColor: Colors.pink,
              url: 'https://instagram.com/yourprofile',
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
