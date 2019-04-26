//
//  Lexer.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

/// A Lexer can convert a sequence of characters into a sequence of Tokens
public protocol LexerProtocol {
    /// Tokens generated by the Lexer
    associatedtype Token: TokenProtocol
    /// Get all the tokens from an input String
    static func tokenize(_ input: String) throws -> [Token]
    /// Annotate the string with all the tokens
    static func annotate(_ input: String) throws -> AnnotatedString<Token?>
}

extension LexerProtocol {

    public static func annotate(_ input: String) throws -> AnnotatedString<Token> {
        return try annotate(input).compactMap { $0 }
    }

}
