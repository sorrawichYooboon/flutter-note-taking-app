# Simple Flutter Note Taking App

A Simple Flutter application for taking notes, managing them, and visualizing statistics. This app also fetches and displays inspirational quotes.

## Table of Contents

- [Getting Started](#getting-started)
- [Folder Structure](#folder-structure)
- [Features](#features)
- [Dependencies](#dependencies)
- [Running the App](#running-the-app)

## Getting Started

This project is a starting point for a Flutter application. To get started with Flutter development, view the [online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on mobile development, and a full API reference.

## Folder Structure

The project follows a feature-first architecture, with the following folder structure:

```
lib/
├── features/
│   ├── note/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── note_model.dart
│   │   │   └── repositories/
│   │   │       └── note_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── note.dart
│   │   │   ├── repositories/
│   │   │   │   └── note_repository.dart
│   │   │   └── use_cases/
│   │   │       └── note_usecases.dart
│   │   └── presentation/
│   │       ├── pages/
│   │       │   ├── note_page.dart
│   │       │   ├── add_note_page.dart
│   │       │   └── stat_page.dart
│   │       └── widgets/
│   │           ├── note_card.dart
│   │           └── note_list.dart
│   ├── quote/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── quote_model.dart
│   │   │   ├── repositories/
│   │   │   │   └── quote_repository_impl.dart
│   │   │   └── services/
│   │   │       └── quote_service.dart
│   │   └── domain/
│   │       ├── entities/
│   │       │   └── quote.dart
│   │       ├── repositories/
│   │       │   └── quote_repository.dart
│   │       └── use_cases/
│   │           └── quote_usecases.dart
├── state_management/
│   └── note_state.dart
└── main.dart
```

### Features

- **note**: Feature for taking, creating, editing, and deleting notes.
  - **data**: Data layer (models, repositories, data sources).
  - **domain**: Domain layer (entities, repositories, use cases).
  - **presentation**: Presentation layer (pages, widgets, state management).
- **quote**: Feature for fetching and caching inspirational quotes.
- **stats**: Feature for visualizing statistics.

### State Management

- **state_management**: Global state management for the app.

## Features

- **Note Management**: Create, edit, delete, and search notes.
- **Inspirational Quotes**: Fetch and display random inspirational quotes.
- **Statistics**: Visualize statistics related to notes.

## Dependencies

The project uses the following dependencies:

- `provider`: State management.
- `shared_preferences`: Local storage.
- `http`: HTTP client for API calls.
- `fl_chart`: Charting library for visualizing statistics.

## Running the App

To run the app, follow these steps:

1. **Clone the repository**:

```sh
   git clone https://github.com/yourusername/flutter_note_taking_app.git
   cd flutter_note_taking_app
```

2. **Get the packages**:

```sh
   flutter pub get
```

3. **Run the app**:

```sh
   flutter run
```

##
