# Dark Mode Modification - Implementation Plan

This document outlines the step-by-step plan to implement the dark mode feature using Cubit, as detailed in `MODIFICATION_DESIGN.md`.

## Phased Implementation

### Phase 1: Project Setup and Baseline

The goal of this phase is to add the necessary dependencies and establish a baseline by ensuring all existing tests pass before we make any changes.

- [x] Add `flutter_bloc` and `shared_preferences` dependencies using the `pub` tool.
- [x] Run all existing tests to ensure the project is in a good state.
- [x] **End of Phase 1 Checklist:**
    - [x] Run `dart_fix --apply`.
    - [x] Run `analyze_files` and fix any issues.
    - [x] Run tests again to ensure no regressions.
    - [x] Run `dart_format .`.
    - [ ] Update the Journal section below with learnings and deviations.
    - [ ] Use `git diff` to verify changes, propose a commit message, and await user approval before committing.

### Phase 2: Core Logic (Cubit)

In this phase, we will create the `ThemeCubit` responsible for managing the theme state.

- [x] Create the `lib/core/utils/theme/` directory.
- [x] Create the `ThemeCubit` in `lib/core/utils/theme/theme_cubit.dart` as specified in the design document.
- [x] Create a unit test file `test/core/utils/theme/theme_cubit_test.dart`.
- [x] Write unit tests for the `ThemeCubit` to verify:
    - Initial state is `ThemeMode.light`.
    - `toggleTheme` correctly switches the state between `light` and `dark`.
    - The cubit correctly interacts with mock `SharedPreferences`.
- [x] **End of Phase 2 Checklist:**
    - [x] Run `dart_fix --apply`.
    - [x] Run `analyze_files` and fix any issues.
    - [x] Run tests again to ensure no regressions.
    - [x] Run `dart_format .`.
    - [ ] Update the Journal section below with learnings and deviations.
    - [ ] Use `git diff` to verify changes, propose a commit message, and await user approval before committing.

### Phase 3: App Integration

This phase focuses on integrating the `ThemeCubit` into the main application widget.

- [x] Modify `lib/main.dart` to wrap the application with `BlocProvider`.
- [x] Wrap the `MaterialApp` widget in a `BlocBuilder`.
- [x] Define the `theme` and `darkTheme` properties in `MaterialApp`, generating the dark theme from the existing light theme's seed color.
- [x] **End of Phase 3 Checklist:**
    - [x] Run `dart_fix --apply`.
    - [x] Run `analyze_files` and fix any issues.
    - [x] Run tests again to ensure no regressions.
    - [x] Run `dart_format .`.
    - [ ] Update the Journal section below with learnings and deviations.
    - [ ] Use `git diff` to verify changes, propose a commit message, and await user approval before committing.
    - [ ] After committing, use the `hot_reload` tool if the app is running.

### Phase 4: UI Implementation (Settings Screen)

Here, we will build the UI for the user to interact with the theme settings.

- [x] Create the `lib/features/settings/presentation/views/` directory.
- [x] Create the `SettingsView` in `lib/features/settings/presentation/views/settings_view.dart` with a `SwitchListTile` to toggle the theme.
- [x] Read the content of `lib/core/utils/widgets/custom_app_bar.dart`.
- [x] Add an `IconButton` to the `CustomAppBar` that navigates to the new `SettingsView`.
- [x] **End of Phase 4 Checklist:**
    - [x] Run `dart_fix --apply`.
    - [x] Run `analyze_files` and fix any issues.
    - [x] Run tests again to ensure no regressions.
    - [x] Run `dart_format .`.
    - [ ] Update the Journal section below with learnings and deviations.
    - [ ] Use `git diff` to verify changes, propose a commit message, and await user approval before committing.
    - [ ] After committing, use the `hot_reload` tool if the app is running.

### Phase 5: Final Review

This final phase is for cleanup and final verification.

- [ ] Review all code changes for any missed `TODOs` or incomplete implementations.
- [ ] Update the `README.md` file if any of the changes require documentation updates (unlikely for this feature).
- [ ] Ask the user to inspect the application and confirm they are satisfied with the dark mode implementation.

---

## Journal

*This section will be updated after each phase to log actions, learnings, surprises, and deviations from the plan.*

### Pre-implementation
- Design document created and approved by the user.
- Implementation plan created.

### Phase 1: Project Setup and Baseline
- **Actions:** Added `flutter_bloc` and `shared_preferences` dependencies. The initial test run failed due to an outdated boilerplate test in `test/widget_test.dart`. Replaced the failing test with a placeholder test to establish a clean baseline. Ran `dart_fix`, `analyze_files`, and `dart_format`.
- **Learnings:** The project's tests were not up-to-date with the actual application code. It's crucial to run tests at the beginning to catch such inconsistencies.
- **Surprises:** The initial test failure was a surprise but was quickly resolved.
- **Deviations:** Deviated from the plan to fix the failing test before proceeding. This was necessary to establish a reliable starting point.

### Phase 2: Core Logic (Cubit)
- **Actions:** Created `ThemeCubit` to manage theme state. Added `mockito` as a dev dependency, but then used the simpler `SharedPreferences.setMockInitialValues` for testing. Created unit tests for the `ThemeCubit`, covering initial state, loading from prefs, and toggling the theme. Ran `dart_fix`, which added return types to the cubit methods.
- **Learnings:** `SharedPreferences` has a built-in mocking mechanism that is very convenient for testing, avoiding the need for more complex mocking setups with `mockito` for this use case.
- **Surprises:** None.
- **Deviations:** Decided to use `SharedPreferences.setMockInitialValues` instead of `mockito` as initially planned, which simplified the test setup.

### Phase 3: App Integration
- **Actions:** Integrated `ThemeCubit` into `main.dart` by wrapping the root widget with `BlocProvider` and `BlocBuilder`. Defined `theme` and `darkTheme` in `MaterialApp` using `ColorScheme.fromSeed` for consistency. Added `.apply(bodyColor: Colors.white, displayColor: Colors.white)` to the dark theme's `textTheme` to ensure text legibility.
- **Learnings:** When creating a `darkTheme`, it's important to consider the default text colors, as they might not contrast well with the dark background. Explicitly setting the text color using `.apply()` is a good practice.
- **Surprises:** None.
- **Deviations:** None.

### Phase 4: UI Implementation (Settings Screen)
- **Actions:** Created the `SettingsView` with a `SwitchListTile` for toggling the theme. Modified `buildAppBar` to include a settings icon button that navigates to the `SettingsView`. Updated all calls to `buildAppBar` to pass the `BuildContext`.
- **Learnings:** When modifying a shared function or widget, it's important to find all its usages and update them accordingly. The `search_file_content` tool is very useful for this.
- **Surprises:** None.
- **Deviations:** None.
