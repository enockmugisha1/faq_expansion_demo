# FAQ App — ExpansionTile Widget Demo

## Widget Description
`ExpansionTile` is a Flutter widget that displays a tappable header which expands to reveal hidden content below and collapses when tapped again — ideal for FAQ and accordion-style UIs.

## How to Run

1. Make sure Flutter is installed on your machine
2. Clone this repository:
   ```bash
   git clone <your-repo-url>
   cd faq_expansion_demo
   ```
3. Get dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## The Three Attributes Demonstrated

| # | Attribute | What it changes on screen |
|---|-----------|--------------------------|
| 1 | `title` | The always-visible header text the user sees and taps. In this app it displays the FAQ question (e.g. "What is Flutter?"). Changing this text changes what is shown in the collapsed and expanded states. |
| 2 | `backgroundColor` | The fill color that appears **only when the tile is open/expanded**. Each FAQ tile uses a different pastel color so you can clearly see the open state highlighted. When collapsed, this color disappears. |
| 3 | `initiallyExpanded` | A `bool` that controls whether the tile starts open or closed the moment the screen loads. Set to `true` on the first tile so it greets the user already open; all others default to `false` (collapsed). |

## Screenshot

![FAQ App Screenshot](screenshot.png)

---

*Widget source: Flutter Material library — [ExpansionTile docs](https://api.flutter.dev/flutter/material/ExpansionTile-class.html)*
