//
        //
    //  Project: Folio
    //  File: ContentView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

// Root view — owns the notes array and renders a scrollable list of NoteRow items.
struct ContentView: View {
    // Source of truth for all notes; passed as bindings so rows can mutate names in place.
    @State private var notes: [Note] = [
        Note(name: "Q3 Launch Plan", body: "Ship the redesigned onboarding flow before end of quarter."),
        Note(name: "Book Recommendations", body: "Thinking Fast and Slow, Deep Work, The Pragmatic Programmer"),
        Note(name: "App Ideas", body: "Habit tracker with streaks, offline-first journaling app"),
        Note(name: "Grocery Run", body: "Olive oil, sourdough, oat milk, coffee beans"),
        Note(name: "Weekend Goals", body: "Morning run, read 50 pages, call Mum"),
        Note(name: "Debug Notes", body: "SwiftUI List with binding rows loses focus on re-render — investigate identity"),
    ]
    var body: some View {
    
        NavigationStack {
            List($notes) { $note in
                NoteRow(note: $note)
            }
            .navigationTitle("Folio")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        notes.insert(Note(name: "New Note"), at: 0)
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
