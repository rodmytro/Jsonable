//
//  SourceEditorCommand.swift
//  SwiftModel
//
//  Created by Dmytro Romaniuk on 8/31/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        do {
            try generateModel(with: invocation)
            completionHandler(nil)
        } catch {
            completionHandler(error)
        }
        
        completionHandler(nil)
    }
    
    func generateModel(with invocation: XCSourceEditorCommandInvocation) throws {
        let buffer = invocation.buffer.completeBuffer
        guard let model = ModelService(from: buffer, andName: "MyClass").generate() else {
            throw CustomError.wrongJson
        }
        
        invocation.buffer.completeBuffer = model
    }
    
}
