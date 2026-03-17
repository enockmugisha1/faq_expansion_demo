# ExpansionTile Widget — Full Documentation

## Table of Contents
1. [What is ExpansionTile?](#1-what-is-expansiontile)
2. [Project Overview](#2-project-overview)
3. [File Structure](#3-file-structure)
4. [How the App Works](#4-how-the-app-works)
5. [The Three Key Attributes](#5-the-three-key-attributes)
6. [Full Code Walkthrough](#6-full-code-walkthrough)
7. [How the Files Connect](#7-how-the-files-connect)
8. [Quick Reference](#8-quick-reference)

---

## 1. What is ExpansionTile?

`ExpansionTile` is a built-in Flutter widget from the Material library. It creates a **list tile that can expand and collapse** when the user taps it.

Think of it like a drawer — you see a label on the outside, you pull it open, and content appears inside. Tap it again and it closes.

**Where you see this in real apps:**
- FAQ / Help pages
- Settings screens (e.g. "Advanced Settings" that expand)
- Product detail pages (e.g. "Ingredients", "Shipping Info")
- Navigation menus that have sub-items

**Basic syntax:**

```dart
ExpansionTile(
  title: Text('Tap me to expand'),
  children: [
    Text('This content is hidden until you tap the title above.'),
  ],
)
```

When the user taps the tile, the `children` list slides into view. Tap again and they slide away.

---

## 2. Project Overview

This project is a **Help & FAQ screen** for a demo app. It uses `ExpansionTile` to show five frequently asked questions. Each question is the tile header. The answer is hidden inside and only appears when the user taps that question.

**App name:** FAQ App
**Widget demonstrated:** `ExpansionTile`
**Flutter version:** SDK ^3.10.4
**No external packages** — only Flutter's built-in Material library is used.

---

## 3. File Structure

```
faq_expansion_demo/
│
├── lib/
│   ├── main.dart                  ← App entry point, sets up MaterialApp
│   ├── screens/
│   │   └── faq_screen.dart        ← The full FAQ page (AppBar + ListView)
│   └── widgets/
│       └── faq_tile.dart          ← Reusable widget that wraps ExpansionTile
│
├── pubspec.yaml                   ← Project config and dependencies
└── README.md                      ← GitHub submission file
```

**Why three separate files instead of one?**
Because this follows Flutter best practice: keep your screen logic, reusable widgets, and app setup in separate files. It also makes the code easier to read and explain during a presentation.

---

## 4. How the App Works

1. `main.dart` starts the app and loads `FAQScreen` as the home page.
2. `FAQScreen` builds a page with an `AppBar` at the top and a `ListView` below.
3. Inside the `ListView` there are five `FAQTile` widgets, one per question.
4. Each `FAQTile` builds one `ExpansionTile` with a question as the header and an answer hidden inside.
5. When the user taps a question, the `ExpansionTile` animates open and shows the answer. Tap again — it closes.

---

## 5. The Three Key Attributes

These are the three `ExpansionTile` properties demonstrated in the app.

---

### Attribute 1 — `title`

**What it is:** The widget displayed in the always-visible header of the tile.

**What it does on screen:** This is the text the user reads before deciding to tap. It stays visible whether the tile is open or closed.

**Type:** `Widget` (almost always a `Text` widget)

**Code example from this project:**

```dart
ExpansionTile(
  title: Text(
    question,   // e.g. "What is Flutter?"
    style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.5,
      color: Color(0xFF1A1A2E),
    ),
  ),
  children: [ ... ],
)
```

**What happens if you change it:**
Change `question` to any other string and the header text changes immediately. You could also pass an `Icon`, a `Row`, or any other widget — `title` accepts any `Widget`, not just `Text`.

---

### Attribute 2 — `backgroundColor`

**What it is:** The background color of the tile shown **only when it is expanded (open)**.

**What it does on screen:** When you tap the tile and it opens, the background fills with this color. When the tile is closed again, the color disappears. This gives the user a clear visual cue that the tile is in an "open" state.

**Type:** `Color?` (optional — defaults to transparent)

**Code example from this project:**

```dart
ExpansionTile(
  title: Text(question),
  backgroundColor: tileColor.withValues(alpha: 0.35),  // soft tinted color
  children: [ ... ],
)
```

Each `FAQTile` receives a different `tileColor`:
- "What is Flutter?" → `Color(0xFFE8EAF6)` (light indigo)
- "Is my data safe?" → `Color(0xFFE8F5E9)` (light green)
- "Cancel subscription?" → `Color(0xFFFFF3E0)` (light amber)
- "Delivery time?" → `Color(0xFFF3E5F5)` (light purple)
- "Contact support?" → `Color(0xFFFFEBEE)` (light red)

**What happens if you remove it:**
The open tile has no background color — it looks the same as the closed tile. Less obvious to the user that something changed.

---

### Attribute 3 — `initiallyExpanded`

**What it is:** A boolean that decides whether the tile starts open or closed when the screen first loads.

**What it does on screen:** If `true`, the tile is already open the moment the screen appears — the answer is visible without the user having to tap. If `false` (the default), the tile starts collapsed.

**Type:** `bool` (default is `false`)

**Code example from this project:**

```dart
// First tile — starts OPEN so the user immediately sees an answer
FAQTile(
  question: 'What is Flutter?',
  answer: 'Flutter is Google\'s open-source UI toolkit...',
  isInitiallyExpanded: true,   // <-- open on load
)

// All other tiles — start CLOSED
FAQTile(
  question: 'Is my account data safe?',
  answer: '...',
  isInitiallyExpanded: false,  // <-- collapsed on load
)
```

Inside `faq_tile.dart`, `isInitiallyExpanded` is passed directly to `ExpansionTile`:

```dart
ExpansionTile(
  title: Text(question),
  initiallyExpanded: isInitiallyExpanded,
  children: [ ... ],
)
```

**What happens if you flip it:**
Set `initiallyExpanded: true` on every tile and all five answers are visible the moment the screen loads. Set them all to `false` and the screen starts completely collapsed.

---

## 6. Full Code Walkthrough

### `main.dart` — App Entry Point

```dart
import 'package:flutter/material.dart';
import 'screens/faq_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FAQ App',
      debugShowCheckedModeBanner: false,   // hides the red DEBUG banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,                // uses Material 3 design
      ),
      home: const FAQScreen(),             // loads the FAQ page as home
    );
  }
}
```

**What this file does:**
It is the entry point of every Flutter app. `runApp()` boots the app. `MaterialApp` wraps everything and provides the theme. `home: FAQScreen()` means the very first screen the user sees is the FAQ page.

---

### `faq_screen.dart` — The FAQ Page

```dart
import 'package:flutter/material.dart';
import '../widgets/faq_tile.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),   // light grey background

      // --- AppBar at the top ---
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Help & FAQ',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: const Icon(Icons.help_outline, color: Colors.white),
      ),

      // --- Scrollable body ---
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        children: [

          // Header card with gradient background
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo.shade600, Colors.indigo.shade400],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('How can we help you?',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                SizedBox(height: 6),
                Text('Find answers to the most common questions below.',
                    style: TextStyle(fontSize: 13, color: Colors.white70)),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Section label
          const Text('Common Questions',
              style: TextStyle(fontSize: 13, color: Colors.grey)),

          const SizedBox(height: 12),

          // Five FAQ tiles — each is one ExpansionTile
          const FAQTile(
            question: 'What is Flutter?',
            answer: 'Flutter is Google\'s open-source UI toolkit...',
            tileColor: Color(0xFFE8EAF6),
            icon: Icons.phone_android_rounded,
            isInitiallyExpanded: true,    // starts OPEN
          ),

          const SizedBox(height: 10),

          const FAQTile(
            question: 'Is my account data safe?',
            answer: 'Yes! We use end-to-end encryption...',
            tileColor: Color(0xFFE8F5E9),
            icon: Icons.lock_outline_rounded,
            isInitiallyExpanded: false,
          ),

          // ... (3 more tiles follow the same pattern)
        ],
      ),
    );
  }
}
```

**What this file does:**
Builds the full screen. `Scaffold` gives us the `AppBar` and `body`. The `body` is a `ListView` so the page can scroll if needed. Each `FAQTile(...)` call creates one expandable question card.

---

### `faq_tile.dart` — The Reusable ExpansionTile Wrapper

This is the most important file — it is where `ExpansionTile` actually lives.

```dart
import 'package:flutter/material.dart';

class FAQTile extends StatelessWidget {
  // These are the inputs this widget accepts
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: Colors.grey.shade200),  // subtle border
      ),

      // =============================================
      //           THE EXPANSION TILE WIDGET
      // =============================================
      child: ExpansionTile(

        // ATTRIBUTE 1: title
        // The always-visible header. Shows the FAQ question.
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14.5),
        ),

        // The icon on the left side of each tile
        leading: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: tileColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 20, color: Colors.indigo.shade600),
        ),

        // ATTRIBUTE 2: backgroundColor
        // The fill color that appears ONLY when the tile is expanded.
        backgroundColor: tileColor.withValues(alpha: 0.35),

        // ATTRIBUTE 3: initiallyExpanded
        // If true → tile is open when screen loads.
        // If false → tile starts collapsed.
        initiallyExpanded: isInitiallyExpanded,

        // Styling
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        iconColor: Colors.indigo,
        collapsedIconColor: Colors.grey.shade400,
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),

        // The content that appears when the tile is expanded
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left accent bar (decorative vertical line)
                Container(
                  width: 3,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade200,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 12),
                // The answer text
                Expanded(
                  child: Text(
                    answer,
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.grey.shade700,
                      height: 1.7,   // line spacing
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
```

---

## 7. How the Files Connect

```
main.dart
  └── loads FAQScreen (from faq_screen.dart)
        └── builds 5x FAQTile (from faq_tile.dart)
                  └── each FAQTile builds one ExpansionTile
                            ├── title        ← Attribute 1
                            ├── backgroundColor ← Attribute 2
                            └── initiallyExpanded ← Attribute 3
```

Data flows **downward**:
- `faq_screen.dart` passes `question`, `answer`, `tileColor`, `icon`, `isInitiallyExpanded` to each `FAQTile`.
- `FAQTile` receives those values and uses them to configure the `ExpansionTile`.

---

## 8. Quick Reference

| Property | Type | Default | What changes on screen |
|---|---|---|---|
| `title` | `Widget` | required | The header text the user taps |
| `backgroundColor` | `Color?` | transparent | Fill color shown only when open |
| `initiallyExpanded` | `bool` | `false` | Whether tile loads open or closed |

**Other useful `ExpansionTile` properties (not in this demo but good to know):**

| Property | What it does |
|---|---|
| `subtitle` | Smaller text below the title in the header |
| `leading` | Widget on the left side of the header (we use this for icons) |
| `trailing` | Replaces the default expand/collapse arrow |
| `onExpansionChanged` | Callback that fires when the tile opens or closes |
| `collapsedBackgroundColor` | Background color when the tile is closed |
| `expandedCrossAxisAlignment` | How children align horizontally when open |

---

*Flutter official docs: https://api.flutter.dev/flutter/material/ExpansionTile-class.html*
