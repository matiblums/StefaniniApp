//
//  APIManager.swift
//  Stefanini
//
//  Created by Matías Blum on 28/10/2023.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()

    //private let baseURL = "https://api.imgur.com/3/gallery/r/cats/image_id"
    private let baseURL = "https://api.imgur.com/3/gallery/search/?q=cat&q_type=jpg"
    private let clientID = "1ceddedc03a5d71"

    private init() {}  // Privatizar el inicializador para usar el patrón Singleton
    
    func fetchCatImages(completion: @escaping ([ImgurData]?, Error?) -> Void) {
        
        guard let url = URL(string: baseURL) else {
            completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("Client-ID \(clientID)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completion(nil, error)
                return
            }

            guard let data = data else {
                completion(nil, NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                return
            }

            // Decodificar la respuesta
            do {
                // Suponiendo que la respuesta tiene un formato específico con un array en una clave "data".
                let response = try JSONDecoder().decode(ImgurResponse.self, from: data)
                completion(response.data, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
