//
//  WrappedRepository.swift
//  NetworkPlatform
//
//  Created by TriBQ on 21/09/2023.
//

import Foundation
import DataLayer

public class WrappedRepository<T: Codable> {

    private lazy var repository = ApiRepository<T>()
}

extension WrappedRepository {
    public func fetchItem(
        path: String,
        param: [String : Codable]
    ) async throws -> T {
        try await repository.fetchItem(path: path, param: param, needAuthToken: false)
    }

    public func fetchItems(
        path: String,
        param: [String : Codable],
        needAuthToken: Bool
    ) async throws -> [T] {
        try await repository.fetchItems(path: path, param: param, needAuthToken: false)
    }

    public func postItem(
        path: String,
        parameters: [String : Codable],
        needAuthToken: Bool
    ) async throws -> T {
        try await repository.postItem(path: path, parameters: parameters, needAuthToken: false)
    }

    public func patchItem(
        path: String,
        parameters: [String : Codable],
        needAuthToken: Bool
    ) async throws -> T {
        try await repository.patchItem(path: path, parameters: parameters, needAuthToken: false)
    }

    public func putItem(
        path: String,
        parameters: [String : Codable],
        needAuthToken: Bool
    ) async throws -> T {
        try await repository.putItem(path: path, parameters: parameters, needAuthToken: false)
    }

    public func deleteItem(
        path: String,
        needAuthToken: Bool
    ) async throws -> T {
        try await repository.deleteItem(path: path, needAuthToken: false)
    }

    public func postImage(
        path: String,
        imageDatas: [String : [Data]],
        additionData: [String : Codable],
        needAuthToken: Bool
    ) async throws -> T {
        try await repository.postImage(
            path: path,
            imageDatas: imageDatas,
            additionData: additionData,
            needAuthToken: false)
    }
}

extension WrappedRepository {
    public func fetchItem(
        endpoint: Endpoints,
        param: [String : Codable]
    ) async throws -> T {
        try await repository.fetchItem(path: endpoint.value, param: param, needAuthToken: false)
    }
}
