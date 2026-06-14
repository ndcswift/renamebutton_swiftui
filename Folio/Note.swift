//
        //
    //  Project: Folio
    //  File: Note.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@noahdoescoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    
import Foundation

// Core data model for a single note.
// `Identifiable` lets SwiftUI List track rows by stable UUID rather than index.
struct Note: Identifiable {
    var id = UUID()
    var name: String       // Displayed in the list and used as the navigation title
    var body: String = ""  // Full note content (edited in NoteDetailView)
}
    
