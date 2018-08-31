
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
    
    private let importOutput: String = "import Foundation \n"
    private var codingOutput: IndentableOutput = IndentableOutput()
    private var modelOutput: IndentableOutput = IndentableOutput()
    private var decodableOutput: IndentableOutput = IndentableOutput()
    
    private var childModels: [ModelGenerator] = []
    
    var output: String {
        get {
            return importOutput +
                "\n" +
                codingOutput.output +
                "\n" +
                modelOutput.output +
                "\n" +
                decodableOutput.output
        }
    }
    
    init(from json: JSON, andName className: String) {
        buildDecodable(json: json, className: className)
        buildModel(json: json, className: className)
        buildCodingKeys(json: json, className: className)
    }
    
    private func buildDecodable(json: JSON, className: String) {
        _ = (decodableOutput += "extension \(className): Decodable {").indent()
        _ = (decodableOutput += "init(from decoder: Decoder) throws {").indent()
        _ = (decodableOutput += "let container = try decoder.container(keyedBy: CodingKeys.self) \n")
        
        iterate(by: json) { key, value in
            let type = VariableType(from: value as JSON)
            self.buildDecodeStatement(io: self.decodableOutput, key: key, type: type)
        }
        
        _ = (decodableOutput.dedent() += "}").dedent() += "}"
    }
    
    private func buildCodingKeys(json: JSON, className: String) {
        _ = (codingOutput += "private enum CodingKeys: String, CodingKey {").indent()
        
        iterate(by: json) { key, _ in
            self.buildCodingKeyStatement(io: self.codingOutput, key: key)
        }
        
        _ = (codingOutput.dedent() += "}")
    }
    
    private func buildModel(json: JSON, className: String) {
        _ = (modelOutput += "struct \(className) {").indent()
        
        iterate(by: json) { key, value in
            let type = VariableType(from: value as JSON)
            _ = self.modelOutput += "let \(key.camelCase): \(type)"
        }
        
        _ = (modelOutput.dedent() += "}")
    }
    
    private func iterate(by json: JSON, with closure: @escaping ((_ key: String, _ value: JSON) -> Void) ) {
        if let object = json.dictionary {
            for (key, value) in object {
                closure(key, value)
            }
        }
    }
    
    private func buildCodingKeyStatement(io: IndentableOutput, key: String) {
        _ = (io += "case \(key.camelCase) = \"\(key)\"")
    }
    
    private func buildDecodeStatement(io: IndentableOutput, key: String, type: VariableType) {
        _ = (io += "self.\(key.camelCase) = try container.decode(\(type).self, forKey: .\(key.camelCase))")
    }
    
    private func buildClassName(className: String, suffix: String) -> String {
        return className
    }
    
}
