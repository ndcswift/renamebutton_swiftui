//
        //
    //  Project: Folio
    //  File: NoteRow.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@noahdoescoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

// A single row in the notes list.
// Supports inline renaming triggered via a long-press context menu.
//
// --- Why not .renameAction + RenameButton? ---
// The system rename flow (used in NoteDetailView) looks like this:
//
//   Text(note.name)
//       .renameAction { isRenaming = true }
//       .contextMenu { RenameButton() }
//
// RenameButton is a special system button that, when tapped, fires the nearest
// .renameAction closure up the view tree. The closure is where you toggle your
// own @State to enter edit mode — SwiftUI doesn't manage that state for you.
//
// That works great on a navigation title (NoteDetailView) because the title
// field appears in a known, fixed location. In a List row the system rename
// field appears outside the row's own bounds, which looks broken at runtime.
// We therefore manage the TextField swap ourselves so the edit field appears
// exactly in place of the label — giving us full control over layout,
// focus timing, commit, and cancel behaviour.
struct NoteRow: View {
    @Binding var note: Note
    @FocusState private var focused: Bool
    @State private var isRenaming = false
    // Stores the name before editing begins so cancel() can restore it.
    @State private var draftName = ""
    var body: some View {
        
        Group {
            if isRenaming{
                TextField("Note name", text: $note.name)
                    .focused($focused)
                    .onSubmit {
                        commit()
                    }
                    .onKeyPress(.escape) {
                        cancel()
                        return .handled
                    }
            } else {
                Text(note.name)
            }
        }
        .contextMenu {
        
            Button("Edit Note", systemImage: "list.clipboard.fill"){
                startRenaming()
            }
            
        }
        
        
    }
    
    // Snapshots the current name before entering edit mode so cancel has a restore point.
    // Focus is set inside a Task because @FocusState changes must be deferred past the
    // current render cycle to take effect.
    private func startRenaming() {
        draftName = note.name
        isRenaming = true
        Task {
            @MainActor in
            
            focused = true
        }
    }
    
    // Keeps the draft name if the field was submitted empty, preventing blank note titles.
    private func commit() {
        if note.name.trimmingCharacters(in: .whitespaces).isEmpty {
            note.name = draftName
        }
        isRenaming = false
    }
    
    // Restores the name saved before editing started.
    private func cancel() {
        note.name = draftName
        isRenaming = false
    }
}

#Preview {
    NoteRow(note: .constant(Note(name: "Sample Note", body: "Preview Body")))
}
