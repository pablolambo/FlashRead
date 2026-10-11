<div align="center">

# 📖 FlashRead

**Read books in the language you're learning. Tap a word. Keep it as a flashcard.**

[![CI](https://github.com/pablolambo/FlashRead/actions/workflows/ci.yml/badge.svg)](https://github.com/pablolambo/FlashRead/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Status: early development](https://img.shields.io/badge/status-early%20development-orange.svg)](#roadmap)
[![PRs welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](#contributing)

</div>

FlashRead is a free, open-source e-book reader for language learners.
No account, no subscription, no limits on saved words — your books and flashcards stay on your device.

> [!NOTE]
> FlashRead is in early development and can't open a book yet. Follow the [roadmap](#roadmap) or [help build it](#contributing).

## How it works

1. **Import** an EPUB from your device.
2. **Read** — tap any word you don't know to see its translation.
3. **Save** the word as a flashcard, together with the sentence you found it in.
4. **Review** your flashcards with spaced repetition.

## Roadmap

The first release, `v1.0.0`, covers the full loop above.

- [x] EPUB metadata parser
- [ ] Book library that survives a restart
- [ ] EPUB import
- [ ] Reader
- [ ] Tap-to-translate
- [ ] Flashcards with sentence context
- [ ] Spaced-repetition review

<details>
<summary>After v1.0.0</summary>

- PDF support
- Export to Anki
- Offline dictionaries

</details>

## Run it locally

You need the [Flutter SDK](https://docs.flutter.dev/get-started/install).

```bash
git clone https://github.com/pablolambo/FlashRead.git
cd FlashRead/src/flash_read
flutter run
```

## Contributing

Issues and pull requests are welcome — small, focused pull requests are the easiest to review.
Before opening one, please run `flutter analyze` and `flutter test`.

## License

[MIT](LICENSE)
