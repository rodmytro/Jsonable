
//
//  ModelGenerator.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/24/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation
import AppKit

class ModelGenerator {
    
    private var codingOutput: IndentableOutput = IndentableOutput()
    private var modelOutput: IndentableOutput = IndentableOutput()
    private var decodableOutput: IndentableOutput = IndentableOutput()
    
    var childModels: [ModelGenerator] = []
    
    var output: String {
        get {
            return codingOutput.output +
                "\n" +
                modelOutput.output +
                "\n" +
                decodableOutput.output
        }
    }
    
    init(json: JSON, className: String, inspectArrays: Bool) {
        buildDecodable(json: json, className: className)
        buildModel(json: json, className: className)
        buildCodingKeys(json: json, className: className)
    }
    
    func buildDecodable(json: JSON, className: String) {
        //  set up
        (decodableOutput += "extension \(className): Decodable {").indent()
        (decodableOutput += "init(from decoder: Decoder) throws {").indent()
        (decodableOutput += "let container = try decoder.container(keyedBy: CodingKeys.self)").indent()
        
        // building
        iterate(json: json) { key, value in
            let type = VariableType(from: value as JSON)
            self.buildDecodeStatement(io: self.decodableOutput, key: key, type: type)
        }
        
        // close everything up
        (decodableOutput.dedent() += "}").dedent() += "}"
    }
    
    func buildCodingKeys(json: JSON, className: String) {
        //  set up
        (codingOutput += "private enum CodingKeys: String, CodingKey {").indent()
        
        // building
        iterate(json: json) { key, _ in
            self.buildCodingKeyStatement(io: self.codingOutput, key: key)
        }
        
        // close everything up
        (codingOutput.dedent() += "}")
    }
    
    func buildModel(json: JSON, className: String) {
        //  set up
        (modelOutput += "struct \(className) {").indent()
        
        // model building
        iterate(json: json) { key, value in
            let type = VariableType(from: value as JSON)
            self.modelOutput += "let \(key): \(type)"
        }
        
        // close everything up
        (modelOutput.dedent() += "}")
    }
    
    func iterate(json: JSON, with closure: @escaping ((_ key: String, _ value: JSON) -> Void) ) {
        if let object = json.dictionary {
            for (key, value) in object {
                closure(key, value)
            }
        }
    }
    
    func buildCodingKeyStatement(io: IndentableOutput, key: String) {
        (io += "case \(key) = \"\(key)\"")
    }
    
    func buildDecodeStatement(io: IndentableOutput, key: String, type: VariableType) {
        (io += "self.\(key) = \(type)(try container.decode(\(type).self, forKey: .\(key)))")
    }
    
    func buildClassName(className: String, suffix: String) -> String {
        return className
    }
    
}
