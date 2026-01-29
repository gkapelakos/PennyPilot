import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

import 'widgets/glass_card.dart';
import 'widgets/animated_eagle.dart';
import 'widgets/animated_magic_flow.dart';
import 'theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _storage = const FlutterSecureStorage();
  bool _isBiometricEnabled = false;

  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    final onboarded = await _storage.read(key: 'onboarded');
    if (onboarded == 'true' && mounted) {
      context.go('/dashboard');
    }
  }

  Future<void> _completeOnboarding() async {
    await _storage.write(key: 'onboarded', value: 'true');
    await _storage.write(
        key: 'biometric_enabled', value: _isBiometricEnabled.toString());
    if (mounted) {
      context.go('/dashboard');
    }
  }

  void _triggerHaptic() {
    HapticFeedback.mediumImpact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient Waves
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF001A33), // Eagle-blue
                  Color(0xFF0A0A0A),
                ],
              ),
            ),
          ),

          // Background "Waves" - Subtle Blurred Orbs
          Positioned(
            top: -100,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primaryBlue.withOpacity(0.15),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),

          IntroductionScreen(
            globalBackgroundColor: Colors.transparent,
            allowImplicitScrolling: true,
            onDone: _completeOnboarding,
            onSkip: _completeOnboarding,
            onChange: (index) => _triggerHaptic(),
            showSkipButton: true,
            skip: const Text("Skip", style: TextStyle(color: Colors.white60)),
            next: const Icon(Icons.arrow_forward, color: Colors.white),
            done: const Text("Get Started",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.white)),
            dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: AppTheme.primaryBlue,
              color: Colors.white24,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            pages: [
              // SCREEN 1: PRIVACY PLEDGE
              PageViewModel(
                titleWidget:
                    _buildGradientText("Your data NEVER leaves this device"),
                bodyWidget: Column(
                  children: [
                    const Text(
                      "Local OCR • No cloud • Full control",
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                    const SizedBox(height: 40),
                    GlassCard(
                      child: Column(
                        children: [
                          _buildStatRow(
                              Icons.lock_outline, "🔒 AES-256 Encryption"),
                          const Divider(color: Colors.white10),
                          _buildStatRow(
                              Icons.fingerprint, "📱 Biometric Security"),
                          const Divider(color: Colors.white10),
                          _buildStatRow(
                              Icons.delete_sweep_outlined, "🗑️ Wipe anytime"),
                        ],
                      ),
                    ),
                  ],
                ),
                image: const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: AnimatedEagle(),
                ),
                decoration: _pageDecoration(),
              ),

              // SCREEN 2: MAGIC FLOW
              PageViewModel(
                titleWidget: _buildGradientText("Emails → Receipts → Insights"),
                bodyWidget: Column(
                  children: [
                    const Text(
                      "The ultimate local pipeline",
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildTimelineStep("1", "Import"),
                        _buildTimelineStep("2", "Scan"),
                        _buildTimelineStep("3", "Grow"),
                      ],
                    ),
                    const SizedBox(height: 40),
                    GlassCard(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Monthly Spending",
                                  style: TextStyle(color: Colors.white70)),
                              Text("€12,450",
                                  style: TextStyle(
                                      color: AppTheme.primaryBlue,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 8,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: 0.6,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    AppTheme.primaryBlue,
                                    Colors.cyan
                                  ]),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                image: const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: AnimatedMagicFlow(),
                ),
                decoration: _pageDecoration(),
              ),

              // SCREEN 3: INSTANT START
              PageViewModel(
                titleWidget: _buildGradientText("Ready to start?"),
                bodyWidget: Column(
                  children: [
                    const SizedBox(height: 20),
                    // Pulsing FAB Prototype
                    TweenAnimationBuilder<double>(
                        tween: Tween(begin: 1.0, end: 1.1),
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        onEnd: () {},
                        builder: (context, value, child) {
                          return Transform.scale(
                            scale: value,
                            child: InkWell(
                              onTap: _completeOnboarding,
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 16),
                                decoration:
                                    AppTheme.glassDecoration(borderRadius: 50)
                                        .copyWith(
                                  color: AppTheme.primaryBlue.withOpacity(0.3),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.qr_code_scanner,
                                        color: Colors.white),
                                    SizedBox(width: 12),
                                    Text("Scan My Gmail (Local)",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    const SizedBox(height: 40),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _OptionChip(label: "Gmail", icon: Icons.mail_outline),
                          SizedBox(width: 12),
                          _OptionChip(
                              label: "Outlook", icon: Icons.alternate_email),
                          SizedBox(width: 12),
                          _OptionChip(label: "Manual", icon: Icons.edit_note),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    GlassCard(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Lock with FaceID",
                              style: TextStyle(fontSize: 16)),
                          Switch(
                            value: _isBiometricEnabled,
                            activeColor: AppTheme.primaryBlue,
                            onChanged: (val) {
                              setState(() => _isBiometricEnabled = val);
                              _triggerHaptic();
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: _completeOnboarding,
                      child: const Text("Skip → Add later",
                          style: TextStyle(color: Colors.white38)),
                    ),
                  ],
                ),
                image: const Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Icon(Icons.rocket_launch_outlined,
                      size: 120, color: AppTheme.primaryBlue),
                ),
                decoration: _pageDecoration(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGradientText(String text) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Colors.white, Color(0xFF99C2FF)],
      ).createShader(bounds),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: -0.5,
        ),
      ),
    );
  }

  Widget _buildStatRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primaryBlue, size: 24),
          const SizedBox(width: 16),
          Text(text, style: const TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildTimelineStep(String step, String label) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.primaryBlue),
            color: AppTheme.primaryBlue.withOpacity(0.1),
          ),
          alignment: Alignment.center,
          child: Text(step,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppTheme.primaryBlue)),
        ),
        const SizedBox(height: 8),
        Text(label,
            style: const TextStyle(fontSize: 12, color: Colors.white60)),
      ],
    );
  }

  PageDecoration _pageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 18),
      pageColor: Colors.transparent,
      imagePadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.only(top: 40, bottom: 20),
      bodyPadding: EdgeInsets.symmetric(horizontal: 24),
    );
  }
}

class _OptionChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const _OptionChip({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: AppTheme.glassDecoration(borderRadius: 16),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.white70),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
