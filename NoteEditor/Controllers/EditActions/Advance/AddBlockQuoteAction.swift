//
//  AddBlockQuoteAction.swift
//  Note Editor
//
//  Created by Thang Pham on 8/17/17.
//  Copyright © 2017 Marko Rankovic. All rights reserved.
//

import UIKit

class AddBlockQuoteAction: NSObject, EditAction {
    
    var normalImage: UIImage {
        return #imageLiteral(resourceName: "addblockquote-icon")
    }
    
    var selectedImage: UIImage {
        return #imageLiteral(resourceName: "addblockquote-selected-icon")
    }
    
    var editor: NoteEditor!

    required init(editor: NoteEditor) {
        self.editor = editor
    }
    
    func execute(in range: NSRange, with attrs: NSAttributedString) {
        editor.textView.undoManager?.beginUndoGrouping()
        if let (replacingRange, replacingString) = BlockQuoteSyntaxBuilder.instance.truncateMarkupSyntax(in: range, with: attrs) {
            editor.replaceCharacters(in: replacingRange, with: replacingString, set: NSMakeRange(range.location - 3, range.length))
        }else if let (replacingRange, replacingString) = MarkupSyntaxTruncater.instance.truncateHeaders(in: range, with: attrs) {
            editor.replaceCharacters(in: replacingRange, with: replacingString, set: NSMakeRange(replacingRange.location, replacingRange.location + replacingString.length))
            let (replaceRange, replaceString) = BlockQuoteSyntaxBuilder.instance.addMarkupSyntax(in: NSMakeRange(replacingRange.location, 0), with: attrs, optional: nil)
            editor.replaceCharacters(in: replaceRange, with: replaceString, set: NSMakeRange(editor.textView.selectedRange.location + 3, range.length))
        }else {
            let (replacingRange, replacingString) = BlockQuoteSyntaxBuilder.instance.addMarkupSyntax(in: range, with: attrs, optional: nil)
            editor.replaceCharacters(in: replacingRange, with: replacingString, set: NSMakeRange(range.location + 3, range.length))
        }
        editor.textView.undoManager?.endUndoGrouping()
    }
}