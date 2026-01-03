import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 🔷 Header
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            backgroundColor: theme.primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Mon Profil'),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      theme.primaryColor,
                      theme.primaryColor.withOpacity(0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(height: 40),
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 52,
                        backgroundImage:
                        AssetImage('assets/images/Anass.PNG'),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Anass Tanassa',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'anass.tanassa@gmail.com',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 🔷 Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _infoCard(
                    icon: Icons.school_rounded,
                    label: 'Filière',
                    value: 'Informatique Appliquée',
                  ),
                  const SizedBox(height: 12),
                  _infoCard(
                    icon: Icons.calendar_today_rounded,
                    label: 'Année',
                    value: '3ème année',
                  ),
                  const SizedBox(height: 12),
                  _infoCard(
                    icon: Icons.account_balance_rounded,
                    label: 'Université',
                    value: 'Université Mundiapolis',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Info Card
  Widget _infoCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
