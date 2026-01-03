import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

// Noir & blanc theme colors (safe for null-safety)
    final Color backgroundColor =
    isDark ? Colors.black : Colors.white;

    final Color surfaceColor =
    isDark ? Colors.grey.shade900 : Colors.grey.shade50;

    final Color textPrimary =
    isDark ? Colors.white : Colors.black;

    final Color textSecondary =
    isDark ? Colors.grey.shade400 : Colors.grey.shade700;

    final Color textTertiary =
    isDark ? Colors.grey.shade600 : Colors.grey.shade500;

    final Color dividerColor =
    isDark ? Colors.grey.shade800 : Colors.grey.shade200;

    final Color iconColor =
    isDark ? Colors.white : Colors.black;


    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: iconColor,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  color: surfaceColor,
                  border: Border(
                    bottom: BorderSide(
                      color: dividerColor,
                      width: 1,
                    ),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: iconColor,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.school_rounded,
                          size: 40,
                          color: iconColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'À propos',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App Name
                  Text(
                    'Smart Student Assistant',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Version 1.0.0',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: textTertiary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Description
                  Text(
                    'Description',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Une application intelligente développée dans le cadre du module de développement mobile Flutter. '
                        'Elle aide les étudiants à mieux organiser leurs études et à accéder rapidement à des informations utiles.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: textSecondary,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Features
                  Text(
                    'Fonctionnalités',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: surfaceColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: dividerColor,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        _FeatureItem(
                          text: 'Interface utilisateur moderne et intuitive',
                          iconColor: iconColor,
                          textColor: textPrimary,
                        ),
                        const SizedBox(height: 12),
                        _FeatureItem(
                          text: 'Navigation simple via menu latéral',
                          iconColor: iconColor,
                          textColor: textPrimary,
                        ),
                        const SizedBox(height: 12),
                        _FeatureItem(
                          text: 'Chatbot intelligent connecté à une API',
                          iconColor: iconColor,
                          textColor: textPrimary,
                        ),
                        const SizedBox(height: 12),
                        _FeatureItem(
                          text: 'Gestion du profil étudiant',
                          iconColor: iconColor,
                          textColor: textPrimary,
                        ),
                        const SizedBox(height: 12),
                        _FeatureItem(
                          text: 'Paramètres personnalisables',
                          iconColor: iconColor,
                          textColor: textPrimary,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Tech Stack
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: surfaceColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: dividerColor,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Technologies utilisées',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: textPrimary,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _TechItem(
                              icon: Icons.flutter_dash,
                              text: 'Flutter',
                              iconColor: iconColor,
                              textColor: textPrimary,
                            ),
                            const SizedBox(width: 40),
                            _TechItem(
                              icon: Icons.code,
                              text: 'Dart',
                              iconColor: iconColor,
                              textColor: textPrimary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Footer
                  Divider(
                    color: dividerColor,
                    thickness: 1,
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: Text(
                      '© 2024 Smart Student Assistant',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: textTertiary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String text;
  final Color iconColor;
  final Color textColor;

  const _FeatureItem({
    required this.text,
    required this.iconColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          margin: const EdgeInsets.only(top: 2),
          child: Icon(
            Icons.check_circle,
            color: iconColor,
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: textColor,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

class _TechItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color textColor;

  const _TechItem({
    required this.icon,
    required this.text,
    required this.iconColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: iconColor.withOpacity(0.3),
              width: 2,
            ),
          ),
          child: Icon(
            icon,
            size: 36,
            color: iconColor,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ],
    );
  }
}