# Contributing to FlashRead

Thanks for helping! FlashRead is in early development, so small, focused contributions are the most useful.

## Find something to work on

- Issues labelled [`good first issue`](https://github.com/pablolambo/FlashRead/labels/good%20first%20issue) are small and self-contained.
- The [roadmap](README.md#roadmap) shows what is planned for `v1.0.0`.
- **Comment on the issue before you start**, so it can be assigned to you and two people don't do the same work.
  If an assigned issue has had no activity for two weeks, it may be reassigned.
- For a new idea, open an issue first. A pull request for an unplanned feature may be declined.

## Set up the project

You need the [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable channel).

1. [Fork](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo) the repository and clone your fork.
2. Install dependencies and run the app:

   ```bash
   cd src/flash_read
   flutter pub get
   flutter run
   ```

## Make a change

1. Create a branch from `master` with a short descriptive name, for example `docs/remove-template-readme` or `feat/epub-import`.
2. Keep the pull request to one purpose. Unrelated fixes go in separate pull requests.
3. Add or update tests for logic you change. Code under `lib/` that does not depend on Flutter widgets should have unit tests.
4. Before pushing, run from `src/flash_read`:

   ```bash
   dart format .
   flutter analyze
   flutter test
   ```

   CI runs `flutter analyze` and `flutter test` on every pull request; both must pass.
5. Write commit messages in the imperative mood, for example `Add EPUB metadata parser`.

## Open a pull request

- Target the `master` branch.
- Link the issue with `Closes #<number>` in the description, so it closes when the pull request is merged.
- Fill in the pull request template.
- The first CI run of a first-time contributor waits for maintainer approval; this is a GitHub safety setting, not a problem with your pull request.

## Reporting bugs and security issues

- Bugs and feature requests: use the [issue forms](https://github.com/pablolambo/FlashRead/issues/new/choose).
- Security vulnerabilities: **do not open a public issue**, see [SECURITY.md](SECURITY.md).

## License

By contributing, you agree that your contributions are licensed under the [MIT License](LICENSE).
