//
//  Networking.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 12.01.2024.
//

import Foundation

class Networking {
    
    // MARK: - HTTP GET Request
    
    /// Perform an HTTP GET request to the specified URL.
    ///
    /// - Parameters:
    ///   - url: The URL to send the request to.
    ///   - loadingIndicator: A closure to handle loading indicators.
    ///   - completion: A closure to be called upon completion with the result.
    class func HTTPGetRequest<T: Decodable>(from url: String, loadingIndicator: @escaping (Bool) -> Void, completion: @escaping (Result<T, Error>) -> Void) {
        // Validate URL
        guard let apiUrl = URL(string: url) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        // Show loading indicator
        loadingIndicator(true)
        
        // Perform the HTTP GET request
        URLSession.shared.dataTask(with: apiUrl) { data, response, error in
            // Hide loading indicator
            loadingIndicator(false)
            
            // Handle errors
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Ensure data is available
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            // Decode the received data using the specified type
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                // Handle decoding errors
                completion(.failure(error))
            }
        }.resume()
    }
    
    // MARK: - Fetch Data
    
    /// Fetch and decode data from the specified URL.
    ///
    /// - Parameters:
    ///   - url: The URL to fetch data from.
    ///   - loadingIndicator: A closure to handle loading indicators.
    ///   - completion: A closure to be called upon completion with the decoded data.
    class func fetchData<T: Decodable>(from url: String, loadingIndicator: @escaping (Bool) -> Void, completion: @escaping (T) -> Void) {
        // Make an HTTP GET request using the generic HTTPGetRequest method
        HTTPGetRequest(from: url, loadingIndicator: loadingIndicator) { (result: Result<T, Error>) in
            switch result {
            case .success(let data):
                // Call completion handler with successfully decoded data
                completion(data)
            case .failure(let error):
                // Log and handle errors
                print(error)
            }
        }
    }
}

// MARK: - Network Error Enum

/// Enum representing network-related errors.
enum NetworkError: Error {
    case invalidURL
    case noData
}
