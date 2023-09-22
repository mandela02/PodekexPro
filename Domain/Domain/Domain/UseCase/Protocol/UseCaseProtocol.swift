//
//  UseCaseProtocol.swift
//  Domain
//
//  Created by TriBQ on 21/09/2023.
//

import Foundation

/// A protocol for use cases that require an input of a generic type and produce an output of a generic type.
public protocol UseCaseProtocol {

    /// The generic type of the output produced by the use case.
    associatedtype Output

    /// The generic type of the input required by the use case.
    associatedtype Input

    /// Executes the use case asynchronously with the provided input and returns its output.
    ///
    /// - Parameter input: The input required by the use case.
    /// - Returns: The output produced by the use case.
    /// - Throws: An error if the execution encounters a problem.
    func run(input: Input) async throws -> Output
}
