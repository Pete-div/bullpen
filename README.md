# Bullpen

Bullpen is a Flutter app that teaches beginners how to invest through a guided, gamified onboarding experience and an AI Coach that builds a personalized learning roadmap.

## Tech Stack

- **Flutter** — cross-platform UI
- **Riverpod** — state management
- **google_fonts** — Baloo2 (headings) and Manrope (body) type system

## State Management

The app uses [Riverpod](https://riverpod.dev) for state management.

- Providers live under `lib/state/` (e.g. `intentProvider`, `userProvider`, `coachProvider`).
- Screens are `ConsumerWidget` / `ConsumerStatefulWidget` and read state via `ref.watch`, with mutations dispatched through `ref.read(...).notifier`.
- Onboarding answers (goal, experience level) are collected into a `StateNotifier` and used to route the user to the right starting dashboard once the flow completes.

## Project Structure

## Getting Started

```bash
flutter pub get
flutter run
```

## Key Features

- **Guided onboarding** — a short, multi-step questionnaire (goal + experience) that personalizes the user's learning path.
- **AI Coach** — uses onboarding answers to build a tailored roadmap.
- **Gamified progress** — step indicators, friendly copy, and lightweight competition mechanics to keep users engaged.

## Contributing

1. Create a branch off `main`.
2. Keep new screens as `Consumer`/`ConsumerStatefulWidget` and add state via a dedicated provider rather than local mutable fields where the state needs to be shared.
3. Open a PR with a short description and a screenshot/GIF for UI changes.
