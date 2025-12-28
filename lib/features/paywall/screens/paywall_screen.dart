import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/providers/subscription_provider.dart';

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  int _selectedPlanIndex = 1; // Default to Premium

  final List<SubscriptionPlan> _plans = [
    SubscriptionPlan(
      tier: SubscriptionTier.basic,
      name: 'Basic',
      price: '\$4.99',
      period: 'month',
      features: [
        'Ad-free experience',
        'Basic features',
        'Email support',
        '10 projects limit',
      ],
      color: AppColors.info,
      isPopular: false,
    ),
    SubscriptionPlan(
      tier: SubscriptionTier.premium,
      name: 'Premium',
      price: '\$9.99',
      period: 'month',
      features: [
        'Everything in Basic',
        'All premium features',
        'Priority support',
        'Unlimited projects',
        'Advanced analytics',
        'Team collaboration',
      ],
      color: AppColors.primary,
      isPopular: true,
    ),
  ];

  Future<void> _purchaseSubscription() async {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context, listen: false);
    
    try {
      await subscriptionProvider.purchaseSubscription(_plans[_selectedPlanIndex].tier);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Successfully subscribed to ${_plans[_selectedPlanIndex].name}!'),
            backgroundColor: AppColors.success,
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Purchase failed: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  Future<void> _restorePurchases() async {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context, listen: false);
    
    try {
      await subscriptionProvider.restorePurchases();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Purchases restored successfully!'),
            backgroundColor: AppColors.success,
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Restore failed: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<SubscriptionProvider>(
          builder: (context, subscriptionProvider, _) {
            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    // Header
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () => context.pop(),
                                ),
                                TextButton(
                                  onPressed: _restorePurchases,
                                  child: const Text('Restore'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            FadeInDown(
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  gradient: AppColors.primaryGradient,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.workspace_premium_rounded,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            FadeInUp(
                              delay: const Duration(milliseconds: 200),
                              child: Text(
                                'Unlock Premium',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            FadeInUp(
                              delay: const Duration(milliseconds: 300),
                              child: Text(
                                'Get unlimited access to all features',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Plans
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final plan = _plans[index];
                            final isSelected = _selectedPlanIndex == index;
                            
                            return FadeInUp(
                              delay: Duration(milliseconds: 400 + (index * 100)),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedPlanIndex = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.only(bottom: 16),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? plan.color.withOpacity(0.1)
                                        : Theme.of(context).cardTheme.color,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: isSelected
                                          ? plan.color
                                          : Colors.grey.shade300,
                                      width: isSelected ? 2 : 1,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    plan.name,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge
                                                        ?.copyWith(
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                  ),
                                                  if (plan.isPopular) ...[
                                                    const SizedBox(width: 8),
                                                    Container(
                                                      padding: const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 4,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        gradient: AppColors.primaryGradient,
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      child: const Text(
                                                        'POPULAR',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ],
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    plan.price,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineSmall
                                                        ?.copyWith(
                                                          fontWeight: FontWeight.bold,
                                                          color: plan.color,
                                                        ),
                                                  ),
                                                  Text(
                                                    '/${plan.period}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                          color: AppColors.textSecondary,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          AnimatedContainer(
                                            duration: const Duration(milliseconds: 300),
                                            width: 28,
                                            height: 28,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: isSelected
                                                    ? plan.color
                                                    : Colors.grey.shade400,
                                                width: 2,
                                              ),
                                              color: isSelected
                                                  ? plan.color
                                                  : Colors.transparent,
                                            ),
                                            child: isSelected
                                                ? const Icon(
                                                    Icons.check,
                                                    size: 18,
                                                    color: Colors.white,
                                                  )
                                                : null,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      const Divider(),
                                      const SizedBox(height: 16),
                                      ...plan.features.map((feature) => Padding(
                                            padding: const EdgeInsets.only(bottom: 12.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.check_circle,
                                                  size: 20,
                                                  color: plan.color,
                                                ),
                                                const SizedBox(width: 12),
                                                Expanded(
                                                  child: Text(
                                                    feature,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          childCount: _plans.length,
                        ),
                      ),
                    ),

                    // Bottom spacing
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 100),
                    ),
                  ],
                ),

                // Subscribe button
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: subscriptionProvider.isLoading
                            ? null
                            : _purchaseSubscription,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _plans[_selectedPlanIndex].color,
                        ),
                        child: subscriptionProvider.isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text('Subscribe to ${_plans[_selectedPlanIndex].name}'),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class SubscriptionPlan {
  final SubscriptionTier tier;
  final String name;
  final String price;
  final String period;
  final List<String> features;
  final Color color;
  final bool isPopular;

  SubscriptionPlan({
    required this.tier,
    required this.name,
    required this.price,
    required this.period,
    required this.features,
    required this.color,
    this.isPopular = false,
  });
}

