//
//  AddHashTagAction.swift
//  Note Editor
//
//  Created by Thang Pham on 8/17/17.
//  Copyright © 2017 Marko Rankovic. All rights reserved.
//

import UIKit

class AddHashTagAction: NSObject, EditAction {
    
    var normalImage: UIImage {
        return #imageLiteral(resourceName: "addhashtag-icon")
    }
    
    var selectedImage: UIImage {
        return #imageLiteral(resourceName: "addhashtag-selected-icon")
    }
    
    var editor: NoteEditor!
    
    required init(editor: NoteEditor) {
        self.editor = editor
    }
    
    func execute(in range: NSRange, with attrs: NSAttributedString) {
        let (replacingRange, replacingString) = HashTagSyntaxBuilder.instance.addMarkupSyntax(in: range, with: attrs, optional: nil)
        if replacingRange.length == 0 {
            editor.replaceCharacters(in: NSMakeRange(replacingRange.location, 0), with: replacingString, set: NSMakeRange(replacingRange.location + 1, 0))
        }else {
            editor.replaceCharacters(in: replacingRange, with: replacingString, set: NSMakeRange(replacingRange.location, replacingString.length))
        }
        
    }
}
