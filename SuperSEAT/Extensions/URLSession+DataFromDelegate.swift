//
//  URLSession+DataFromDelegate.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 16/5/22.
//
// To use async await pre iOS15
// Ref: https://www.swiftbysundell.com/articles/making-async-system-apis-backward-compatible/

import Foundation

@available(iOS, deprecated: 15.0, message: "iOS15+ nativly supported")
extension URLSession {
    func data(from url: URL) async throws -> (Data, URLResponse) {
        try await withCheckedThrowingContinuation { continuation in
            let task = self.dataTask(with: url) { data, response, error in
                guard let data = data, let response = response else {
                    let error = error ?? URLError(.badServerResponse)
                    return continuation.resume(throwing: error)
                }
                continuation.resume(returning: (data, response))
            }
            task.resume()
        }
    }
}
