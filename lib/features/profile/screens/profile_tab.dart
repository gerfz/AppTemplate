import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/providers/auth_provider.dart';
import '../../../core/providers/theme_provider.dart';
import '../../../core/providers/subscription_provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Profile header
            FadeInDown(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person_rounded,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    authProvider.userEmail?.split('@')[0] ?? 'User',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    authProvider.userEmail ?? '',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      gradient: subscriptionProvider.isPremium
                          ? AppColors.primaryGradient
                          : null,
                      color: subscriptionProvider.isPremium
                          ? null
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          subscriptionProvider.isPremium
                              ? Icons.workspace_premium_rounded
                              : Icons.account_circle_rounded,
                          size: 16,
                          color: subscriptionProvider.isPremium
                              ? Colors.white
                              : AppColors.textSecondary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          subscriptionProvider.isPremium ? 'Premium' : 'Free',
                          style: TextStyle(
                            color: subscriptionProvider.isPremium
                                ? Colors.white
                                : AppColors.textSecondary,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Settings
            FadeInUp(
              delay: const Duration(milliseconds: 200),
              child: Column(
                children: [
                  _SettingsItem(
                    icon: Icons.dark_mode_rounded,
                    title: 'Dark Mode',
                    trailing: Switch(
                      value: themeProvider.isDarkMode,
                      onChanged: (_) => themeProvider.toggleTheme(),
                      activeColor: AppColors.primary,
                    ),
                  ),
                  if (!subscriptionProvider.isPremium)
                    _SettingsItem(
                      icon: Icons.workspace_premium_rounded,
                      title: 'Upgrade to Premium',
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      onTap: () => context.push('/paywall'),
                    ),
                  _SettingsItem(
                    icon: Icons.notifications_rounded,
                    title: 'Notifications',
                    trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                    onTap: () {
                      // TODO: Navigate to notifications settings
                    },
                  ),
                  _SettingsItem(
                    icon: Icons.security_rounded,
                    title: 'Privacy & Security',
                    trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                    onTap: () {
                      // TODO: Navigate to privacy settings
                    },
                  ),
                  _SettingsItem(
                    icon: Icons.language_rounded,
                    title: 'Language',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'English',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      ],
                    ),
                    onTap: () {
                      // TODO: Navigate to language settings
                    },
                  ),
                  _SettingsItem(
                    icon: Icons.help_rounded,
                    title: 'Help & Support',
                    trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                    onTap: () {
                      // TODO: Navigate to help
                    },
                  ),
                  _SettingsItem(
                    icon: Icons.info_rounded,
                    title: 'About',
                    trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                    onTap: () {
                      // TODO: Show about dialog
                    },
                  ),
                  const SizedBox(height: 16),
                  _SettingsItem(
                    icon: Icons.logout_rounded,
                    title: 'Logout',
                    iconColor: AppColors.error,
                    titleColor: AppColors.error,
                    onTap: () async {
                      await authProvider.logout();
                      if (context.mounted) {
                        context.go('/login');
                      }
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Version info
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: Text(
                'Version 1.0.0',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? titleColor;

  const _SettingsItem({
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
    this.iconColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: (iconColor ?? AppColors.primary).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: iconColor ?? AppColors.primary,
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: titleColor,
              ),
        ),
        trailing: trailing,
      ),
    );
  }
}

