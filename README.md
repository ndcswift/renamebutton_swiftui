# 📝 RenameButton — SwiftUI
Inline renaming done right: SwiftUI's native `RenameButton` paired with a context-menu rename flow.

---

## 🤔 What this is
Folio is a minimal SwiftUI notes app built to demonstrate two complementary rename patterns. The detail view wires up Apple's built-in `RenameButton` via `.toolbarRole(.editor)` so users can tap the navigation title to rename a note. The list view adds a long-press context menu that swaps a `Text` row for a focused `TextField`, handling commit and cancel without leaving the list.

## ✅ Why you'd use it
- **`RenameButton` + `.toolbarRole(.editor)`** — drop-in system rename that activates the navigation title field with zero custom UI
- **`@FocusState` inline editing** — shows how to defer focus into a `Task` so the field reliably becomes first responder after a state-driven view swap
- **Binding-based `List`** — demonstrates `List($notes) { $note in }` so row mutations propagate back to the source of truth without extra plumbing

## 📺 Watch on YouTube
[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtube.com/watch?v=PLACEHOLDER)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding97).

---

## 🚀 Getting Started

### 1. Clone
```bash
git clone https://github.com/NDCSwift/RenameButton_SwiftUI.git
```

### 2. Open
Double-click `Folio.xcodeproj` or open it from Xcode via **File › Open**.

### 3. Set your Team
In the project navigator select **Folio** › **Signing & Capabilities** and choose your Apple developer team.

### 4. Set your Bundle ID
Update the bundle identifier to something unique (e.g. `com.yourname.folio`) so Xcode can sign the app.

---

## 🛠️ Notes
- The context-menu rename in `NoteRow` stores a `draftName` snapshot before editing so **Escape** can restore the original title without committing an empty string.
- Focus is set inside a `Task { @MainActor in … }` block — this one-line pattern is required any time you toggle `@FocusState` as a result of a `@State` change in the same render cycle.
- `NoteDetailView` uses `.renameAction {}` with an empty closure; the actual rename is handled by SwiftUI's title field, so no extra logic is needed.

## 📦 Requirements
| | |
|---|---|
| Platform | iOS 17+ |
| IDE | Xcode 15+ |
| Language | Swift 5.9 |

---

📺 [Watch the guide on YouTube](https://youtube.com/watch?v=PLACEHOLDER)
