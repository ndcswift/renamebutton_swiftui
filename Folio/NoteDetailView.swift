//
        //
    //  Project: Folio
    //  File: NoteDetailView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

// Full-screen editor for a single note.
// Receives a binding so edits propagate back to ContentView's notes array.
struct NoteDetailView: View {
    @Binding var note: Note

    var body: some View {
        TextEditor(text: $note.name)
            .navigationTitle($note.name)
            .navigationBarTitleDisplayMode(.inline)
            // `.toolbarRole(.editor)` + `RenameButton` wires up the system rename flow,
            // letting users tap the title to rename the note inline.
            .toolbarRole(.editor)
            .renameAction {}
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    RenameButton()
                }
            }
    }
}

#Preview {
    NoteDetailView(note: .constant(Note(name: "Sample Note", body: "Preview Body")))
}
