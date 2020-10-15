//
//  MakeTextStrikeThroughAction.swift
//  Note Editor
//
//  Created by Thang Pham on 8/17/17.
//  Copyright © 2017 Marko Rankovic. All rights reserved.
//

import UIKit

class MakeTextStrikeThroughAction: NSObject, EditAction {
    
    var normalImage: UIImage = UIImage(named: "maketextstrikethrough-icon", in: bundle, compatibleWith: nil)!
    
    var selectedImage: UIImage = UIImage(named: "maketextstrikethrough-selected-icon", in: bundle, compatibleWith: nil)!
    
    var editor: NoteEditor!
    
    required init(editor: NoteEditor) {
        self.editor = editor
    }
    
    func execute(in range: NSRange, with attrs: NSAttributedString, textview:UITextView) {
             
            if editor.isMakeStrikeFlag {
                let checkAstrick = String("--")
                if attrs.string.contains(checkAstrick)
                {
                    let (repRange, _) = StrikeThroughSyntaxBuilder.instance.addMarkupSyntax(in: range, with: attrs, optional: nil)
                    if(range.location < attrs.string.length)
                    {
                        if let (replacingRange, replacingString) = StrikeThroughSyntaxBuilder.instance.truncateMarkupSyntax(in: NSRange(location: repRange.location - 1 , length: repRange.length + 2), with: attrs) {
                            editor.replaceCharacters(in: replacingRange, with: replacingString, set: NSMakeRange(replacingRange.location, replacingString.length))
                        }
                    }
                    
                }
                 
                editor.textView.selectedTextRange = editor.textView.textRange(from: editor.textView.endOfDocument, to: editor.textView.endOfDocument)
                
                
            } else {
                if let (replacingRange, replacingString) = StrikeThroughSyntaxBuilder.instance.truncateMarkupSyntax(in: range, with: attrs) {
                    editor.replaceCharacters(in: replacingRange, with: replacingString, set: NSMakeRange(replacingRange.location, replacingString.length))
                }else {
                    let (replacingRange, replacingString) = StrikeThroughSyntaxBuilder.instance.addMarkupSyntax(in: range, with: attrs, optional: nil)
                    if replacingRange.length == 0 {
                        editor.replaceCharacters(in: replacingRange, with: replacingString, set: NSMakeRange(replacingRange.location + replacingString.length/2, 0))
                    }else {
                        editor.replaceCharacters(in: replacingRange, with: replacingString, set: NSMakeRange(replacingRange.location, replacingString.length))
                        
                    }
                }
            }
            editor.isMakeStrikeFlag = !editor.isMakeStrikeFlag
        }
     
}
