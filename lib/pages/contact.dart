import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrithikport/widgets/drawer.dart';
import 'package:hrithikport/widgets/social.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMe extends StatelessWidget {
  final bool isDark;
  final VoidCallback onThemeToggle;

  const ContactMe({
    super.key,
    required this.isDark,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: Colors.transparent,
      endDrawer: CustomDrawer(
        isDark: isDark,
        onItemTap: (route) {
          Navigator.of(context).pop();
        },
        onThemeToggle: onThemeToggle,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'My Contacts',
          style: GoogleFonts.kristi(
            color: textColor,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const AnimatedGradientBackground(),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let's Connect",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ).animate().fadeIn(duration: 800.ms).slideY(),
                  const SizedBox(height: 10),
                  Text(
                    "I'm always open to new projects, ideas, or just a chat!",
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.white70),
                  ).animate().fadeIn(duration: 1000.ms).slideY(),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialIconsAnimatedColumn(isDark: isDark),
                      // _socialIcon(
                      //   FontAwesomeIcons.github,
                      //   "https://github.com/",
                      // ),
                      // _socialIcon(
                      //   FontAwesomeIcons.linkedin,
                      //   "https://linkedin.com/",
                      // ),
                      // _socialIcon(
                      //   FontAwesomeIcons.twitter,
                      //   "https://twitter.com/",
                      // ),
                    ],
                  ).animate().fadeIn(duration: 1200.ms).slideY(),

                  const SizedBox(height: 40),
                  const GlassCard(
                    child: SizedBox(width: 500, child: _ContactForm()),
                  ).animate().fadeIn(duration: 1300.ms).slideY(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //   Widget _socialIcon(IconData icon, String url) {
  //     return Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 10),
  //       child: IconButton(
  //         icon: FaIcon(icon, color: Colors.white),
  //         iconSize: 30,
  //         onPressed: () {
  //
  //       ),
  //     );
  //   }
  // }
}

class GlassCard extends StatelessWidget {
  final Widget child;
  const GlassCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha((0.1 * 255).toInt()),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.white.withAlpha((0.3 * 255).toInt()),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _ContactForm extends StatefulWidget {
  const _ContactForm();

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _msgCtrl = TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameCtrl.text;
      final email = _emailCtrl.text;
      final message = _msgCtrl.text;

      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'saihrithikreddymovva@gmail.com',
        queryParameters: {
          'subject': 'Contact from Portfolio - $name',
          'body': 'Name: $name\nEmail: $email\n\n$message',
        },
      );

      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri);
      }

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Redirected to mail app")));

      // Optional: close any open drawer or modal if this form is used inside one
      Navigator.of(context, rootNavigator: true).maybePop();

      _nameCtrl.clear();
      _emailCtrl.clear();
      _msgCtrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _inputField(_nameCtrl, "Name"),
          const SizedBox(height: 10),
          _inputField(_emailCtrl, "Email"),
          const SizedBox(height: 10),
          _inputField(_msgCtrl, "Message", maxLines: 4),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitForm,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text("Send"),
          ),
        ],
      ),
    );
  }

  Widget _inputField(
    TextEditingController controller,
    String hint, {
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: (value) => value == null || value.isEmpty ? 'Required' : null,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withAlpha((0.8 * 255).toInt()),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class AnimatedGradientBackground extends StatefulWidget {
  const AnimatedGradientBackground({super.key});

  @override
  State<AnimatedGradientBackground> createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> color1;
  late Animation<Color?> color2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: true);

    color1 = ColorTween(
      begin: Colors.deepPurple.shade700,
      end: Colors.blueAccent,
    ).animate(_controller);

    color2 = ColorTween(
      begin: Colors.deepOrange.shade900,
      end: Colors.indigo.shade400,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color1.value!, color2.value!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        );
      },
    );
  }
}
