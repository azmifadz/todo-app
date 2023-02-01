# Todo Flutter

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]

---

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

To run on web, add the following commands with desired flavor or include in the launch configuration

```
`-d chrome`

eg. To run flutter web using production flavor
$ flutter run -d chrome --flavor production --target lib/main_production.dart

```

_\*Todo Flutter works on iOS, Android, and Web._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Working with Translations 🌐

This project use [easy_localization][easy_localization_link] to handle internationalization.

# Adding Strings

To add a new localizable string, open the en-US.json file at "assets/translations/en_US.json".

# Generate translation keys

Keys must be generated after updating translation json file by using this command:

```
flutter pub run easy_localization:generate -S assets/translations -f keys -O lib/app/translations -o locale_keys.g.dart
```

[easy_localization_link]: https://pub.dev/packages/easy_localization
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
