import 'package:flutter/material.dart';
import '../widgets/faq_tile.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: const Text(
          'Help & FAQ',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: const Icon(Icons.help_outline, color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        children: [
          // Page header card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo.shade600, Colors.indigo.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How can we help you?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Find answers to the most common questions below.',
                  style: TextStyle(fontSize: 13, color: Colors.white70),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Common Questions',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
              letterSpacing: 1.1,
            ),
          ),

          const SizedBox(height: 12),

          // ---- PROPERTY 3 demo: initiallyExpanded: true (starts OPEN) ----
          const FAQTile(
            question: 'What is Flutter?',
            answer:
                'Flutter is Google\'s open-source UI toolkit for building '
                'natively compiled apps for mobile, web, and desktop — all '
                'from a single codebase using the Dart language.',
            tileColor: Color(0xFFE8EAF6),
            icon: Icons.phone_android_rounded,
            isInitiallyExpanded: true,
          ),

          const SizedBox(height: 10),

          const FAQTile(
            question: 'Is my account data safe?',
            answer:
                'Yes! We use end-to-end encryption to protect all your '
                'personal data. We never sell your information to third '
                'parties, and you can delete your account at any time.',
            tileColor: Color(0xFFE8F5E9),
            icon: Icons.lock_outline_rounded,
            isInitiallyExpanded: false,
          ),

          const SizedBox(height: 10),

          const FAQTile(
            question: 'How do I cancel my subscription?',
            answer:
                'Go to Settings → Subscription → Cancel Plan. '
                'Your access continues until the end of the billing period. '
                'No hidden fees or cancellation charges.',
            tileColor: Color(0xFFFFF3E0),
            icon: Icons.credit_card_rounded,
            isInitiallyExpanded: false,
          ),

          const SizedBox(height: 10),

          const FAQTile(
            question: 'How long does delivery take?',
            answer:
                'Standard delivery takes 3–5 business days. '
                'Express delivery (1–2 days) is available at checkout. '
                'You\'ll receive a tracking link via email once your order ships.',
            tileColor: Color(0xFFF3E5F5),
            icon: Icons.local_shipping_outlined,
            isInitiallyExpanded: false,
          ),

          const SizedBox(height: 10),

          const FAQTile(
            question: 'How do I contact support?',
            answer:
                'You can reach our support team 24/7 via live chat in the app, '
                'or email us at support@demo.com. '
                'We typically respond within 2 hours.',
            tileColor: Color(0xFFFFEBEE),
            icon: Icons.headset_mic_outlined,
            isInitiallyExpanded: false,
          ),
        ],
      ),
    );
  }
}
