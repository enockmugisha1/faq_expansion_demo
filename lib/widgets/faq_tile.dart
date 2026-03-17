import 'package:flutter/material.dart';

class FAQTile extends StatelessWidget {
  final String question;
  final String answer;
  final Color tileColor;
  final IconData icon;
  final bool isInitiallyExpanded;

  const FAQTile({
    super.key,
    required this.question,
    required this.answer,
    required this.tileColor,
    required this.icon,
    required this.isInitiallyExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ExpansionTile(
        // ---- PROPERTY 1: title ----
        // The always-visible header that the user sees and taps.
        title: Text(
          question,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.5,
            color: Color(0xFF1A1A2E),
          ),
        ),

        leading: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: tileColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 20, color: Colors.indigo.shade600),
        ),

        // ---- PROPERTY 2: backgroundColor ----
        // The background color shown ONLY when the tile is expanded/open.
        backgroundColor: tileColor.withValues(alpha: 0.35),

        // ---- PROPERTY 3: initiallyExpanded ----
        // If true, the tile is open when the screen first loads.
        // If false (default), the tile starts collapsed.
        initiallyExpanded: isInitiallyExpanded,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        collapsedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        iconColor: Colors.indigo,
        collapsedIconColor: Colors.grey.shade400,
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),

        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 3,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade200,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    answer,
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.grey.shade700,
                      height: 1.7,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
