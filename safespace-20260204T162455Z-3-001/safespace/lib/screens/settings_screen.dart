import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _dailyReportsEnabled = true;
  bool _screenTimeAlerts = true;
  bool _bedtimeReminders = true;
  double _dailyScreenTimeLimit = 4.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildProfileSection(),
          const SizedBox(height: 8),
          _buildSectionTitle('Screen Time Limits'),
          _buildScreenTimeLimitsSection(),
          const SizedBox(height: 8),
          _buildSectionTitle('Notifications'),
          _buildNotificationsSection(),
          const SizedBox(height: 8),
          _buildSectionTitle('Child Accounts'),
          _buildChildAccountsSection(),
          const SizedBox(height: 8),
          _buildSectionTitle('App Settings'),
          _buildAppSettingsSection(),
          const SizedBox(height: 8),
          _buildSectionTitle('Support'),
          _buildSupportSection(),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppTheme.primaryPurple.withOpacity(0.2),
            child: Icon(
              Icons.person,
              size: 30,
              color: AppTheme.primaryPurple,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sarah Johnson',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'sarah.johnson@email.com',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Edit profile coming soon!')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildScreenTimeLimitsSection() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Daily Screen Time Limit',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${_dailyScreenTimeLimit.toInt()}h ${((_dailyScreenTimeLimit % 1) * 60).toInt()}m',
                      style: TextStyle(
                        color: AppTheme.primaryPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Slider(
                  value: _dailyScreenTimeLimit,
                  min: 1,
                  max: 8,
                  divisions: 14,
                  activeColor: AppTheme.primaryPurple,
                  onChanged: (value) {
                    setState(() => _dailyScreenTimeLimit = value);
                  },
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          _buildSettingsTile(
            icon: Icons.nightlight_round,
            title: 'Bedtime',
            subtitle: '9:00 PM - 7:00 AM',
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Bedtime settings coming soon!')),
              );
            },
          ),
          const Divider(height: 1),
          _buildSettingsTile(
            icon: Icons.block,
            title: 'Blocked Apps',
            subtitle: '3 apps blocked',
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('App blocking coming soon!')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsSection() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildSwitchTile(
            icon: Icons.notifications,
            title: 'Push Notifications',
            subtitle: 'Receive alerts on your device',
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() => _notificationsEnabled = value);
            },
          ),
          const Divider(height: 1),
          _buildSwitchTile(
            icon: Icons.summarize,
            title: 'Daily Reports',
            subtitle: 'Get daily activity summaries',
            value: _dailyReportsEnabled,
            onChanged: (value) {
              setState(() => _dailyReportsEnabled = value);
            },
          ),
          const Divider(height: 1),
          _buildSwitchTile(
            icon: Icons.timer,
            title: 'Screen Time Alerts',
            subtitle: 'Alert when limit is reached',
            value: _screenTimeAlerts,
            onChanged: (value) {
              setState(() => _screenTimeAlerts = value);
            },
          ),
          const Divider(height: 1),
          _buildSwitchTile(
            icon: Icons.bedtime,
            title: 'Bedtime Reminders',
            subtitle: 'Remind child before bedtime',
            value: _bedtimeReminders,
            onChanged: (value) {
              setState(() => _bedtimeReminders = value);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChildAccountsSection() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildChildTile(
            name: 'Alex',
            age: '12 years old',
            isActive: true,
          ),
          const Divider(height: 1),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Icon(Icons.add, color: Colors.grey[600]),
            ),
            title: Text(
              'Add Child Account',
              style: TextStyle(color: AppTheme.primaryPurple),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Add child coming soon!')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChildTile({
    required String name,
    required String age,
    required bool isActive,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Text(
          name[0],
          style: TextStyle(
            color: Colors.blue[700],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(age),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isActive ? Colors.green[50] : Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              isActive ? 'Active' : 'Inactive',
              style: TextStyle(
                color: isActive ? Colors.green[700] : Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right),
        ],
      ),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Manage $name\'s account coming soon!')),
        );
      },
    );
  }

  Widget _buildAppSettingsSection() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildSettingsTile(
            icon: Icons.palette,
            title: 'Appearance',
            subtitle: 'Light mode',
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Theme settings coming soon!')),
              );
            },
          ),
          const Divider(height: 1),
          _buildSettingsTile(
            icon: Icons.language,
            title: 'Language',
            subtitle: 'English',
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Language settings coming soon!')),
              );
            },
          ),
          const Divider(height: 1),
          _buildSettingsTile(
            icon: Icons.security,
            title: 'Privacy & Security',
            subtitle: 'Manage your data',
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Privacy settings coming soon!')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSupportSection() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildSettingsTile(
            icon: Icons.help_outline,
            title: 'Help Center',
            subtitle: 'FAQs and guides',
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Help center coming soon!')),
              );
            },
          ),
          const Divider(height: 1),
          _buildSettingsTile(
            icon: Icons.feedback_outlined,
            title: 'Send Feedback',
            subtitle: 'Help us improve',
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Feedback form coming soon!')),
              );
            },
          ),
          const Divider(height: 1),
          _buildSettingsTile(
            icon: Icons.info_outline,
            title: 'About',
            subtitle: 'Version 1.0.0',
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'SafeSpace',
                applicationVersion: '1.0.0',
                applicationIcon: Icon(
                  Icons.shield,
                  size: 48,
                  color: AppTheme.primaryPurple,
                ),
                children: [
                  const Text('A digital wellness app for families.'),
                ],
              );
            },
          ),
          const Divider(height: 1),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red[400]),
            title: Text(
              'Sign Out',
              style: TextStyle(color: Colors.red[400]),
            ),
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle),
      trailing: Switch(
        value: value,
        activeColor: AppTheme.primaryPurple,
        onChanged: onChanged,
      ),
    );
  }
}
