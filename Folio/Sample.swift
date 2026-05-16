//
        //
    //  Project: Folio
    //  File: Sample.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    
// This file demonstrates why `.renameAction` must be scoped per-row rather than
// applied to the List as a whole. SwiftUI resolves `.renameAction` by finding the
// nearest ancestor in the view tree — attaching it to the List gives every row the
// same action, so there's no way to know which note to rename.

//
//// ❌ One shared action — all rows rename the same note
//List($notes) { $note in
//    NoteRow(note: $note)
//}
//.renameAction { /* which note? */ }
//
//// ✅ Each row has its own scope — nearest wins
//List($notes) { $note in
//    NoteRow(note: $note)
//    // .renameAction is inside NoteRow
//}
