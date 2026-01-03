import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _notifications = true;
  bool _soundEnabled = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle('Préférences'),
          _settingsCard([
            _switchTile(
              icon: Icons.dark_mode_outlined,
              title: 'Mode sombre',
              subtitle: 'Activer le thème sombre',
              value: _darkMode,
              onChanged: (v) => setState(() => _darkMode = v),
            ),
            _switchTile(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              subtitle: 'Recevoir les notifications',
              value: _notifications,
              onChanged: (v) => setState(() => _notifications = v),
            ),
            _switchTile(
              icon: Icons.volume_up_outlined,
              title: 'Sons',
              subtitle: 'Activer les sons',
              value: _soundEnabled,
              onChanged: (v) => setState(() => _soundEnabled = v),
            ),
          ]),

          const SizedBox(height: 24),

          _sectionTitle('Compte'),
          _settingsCard([
            _actionTile(
              icon: Icons.lock_outline,
              title: 'Changer le mot de passe',
              color: theme.primaryColor,
              onTap: () {},
            ),
            _actionTile(
              icon: Icons.email_outlined,
              title: 'Modifier l’email',
              color: theme.primaryColor,
              onTap: () {},
            ),
            _actionTile(
              icon: Icons.delete_outline,
              title: 'Supprimer le compte',
              color: Colors.red,
              onTap: () {},
            ),
          ]),
        ],
      ),
    );
  }

  // 🔹 Section title
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // 🔹 Card wrapper
  Widget _settingsCard(List<Widget> children) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(children: children),
    );
  }

  // 🔹 Switch tile
  Widget _switchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      secondary: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  // 🔹 Action tile
  Widget _actionTile({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
