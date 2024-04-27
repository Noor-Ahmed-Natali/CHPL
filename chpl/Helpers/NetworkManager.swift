//
//  NetworkManager.swift
//  chpl
//
//  Created by Noor Ahmed on 27/04/24.
//

import Foundation

class NetworkManager {
    
    static var shared: NetworkManager = .init()
    
    private init() { }
    
    func baseRequest<T: Codable>(url: String, httpMethod method: String = "GET", params: [String: Any]? = nil, model: T.Type) async -> Result<T?,NetworkError> {
        
        guard let url: URL = URL(string: url) else { return .failure(.invalidURL)}
        
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        urlRequest.httpBody = try? params?.getData()
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            let object = try JSONDecoder().decode(model.self, from: data)
            return .success(object)
        } catch {
            return .failure(.serverError(error))
        }
        
        
    }
}

extension NetworkManager {
    
    enum NetworkError: Error {
        case invalidURL
        case serverError(Error)
        case conversionError(Error)
    }
}
