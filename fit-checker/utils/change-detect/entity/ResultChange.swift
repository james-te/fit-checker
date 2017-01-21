//
//  LectureListChange.swift
//  fit-checker
//
//  Created by Jakub Tucek on 21/01/17.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation


/// Simple entity for keeping changes.
/// Default constructor creates default state. Default state is that no change
/// was detected.
class ResultChange {

    var changes: [Change<Any>]?

    var sizeDifference: Int?

    init() {
    }

    init (changes:[Change<Any>], sizeDifference: Int) {
        self.changes = changes
        self.sizeDifference = sizeDifference
    }

    
}
