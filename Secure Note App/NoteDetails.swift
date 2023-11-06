//
//  NoteDetails.swift
//  Secure Note App
//
//  Created by Tekla on 11/5/23.
//

import UIKit

struct NoteDetails {
    let title: String?
    let note: String
    
    static let noteList = [
        NoteDetails(
            title: "First Ever Note!",
            note: "Hi, this is a test note, just making sure it works! :)"
        ),
        NoteDetails(
            title: "Second Note!",
            note: "Made a second note, so the first one doesn't get lonely! :)"
        ),
        NoteDetails(
            title: "Enjoy",
            note: "I hope you are having a relaxing experience with the notes app! :)"
        ),
        NoteDetails(
            title: "Comments",
            note: "It would be grand if the comments for this project came in a format of notes (from this note app of course), but not sure if I have the time to make it save notes ( ͡❛ ▿ ͡❛)"
        ),
        NoteDetails(
            title: "✍️",
            note: "Ha, I forgot I can use emojis 😄😁"
        ),
        NoteDetails(
            title: "Running out of Ideas",
            note: "Few more notes left and I'm already running out of ideas...( ͡❛ ⏥ ͡❛)"
        ),
        NoteDetails(
            title: "Not necessary",
            note: "I'm pretty sure NoteList.swift wasn't necessary, but since we can't or are allowed not to do the save function for the notes, I guess we'd need a way to check bunch of other functions, so ... it is necessary..?( ͡❛ ⍨ ͡❛)"
        ),
        NoteDetails(
            title: "Procrastinating..",
            note: "If it's not obvious, I'm clearly procrastinating.. I've set up almost all View Controllers, made unnecessary changes to the project, but have't even looked at the direction of keyChains (Lying, I did, but it confused the heck out if me, so here we are, writing notes, that no one is going to see)"
        ),
        NoteDetails(
            title: "Reaching the end",
            note: "One more note left after this, bittersweet, it was nice who ever is reading this, but alas I have to go back to work ( ͡╥ ͜ʖ ͡╥)"
        ),
        NoteDetails(
            title: "Okay bye ",
            note: "Seriously gotta get back to work, for real now ( ͡─ ▿ ͡─)"
        )
    ]
}
