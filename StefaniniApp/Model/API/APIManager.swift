//
//  APIManager.swift
//  Stefanini
//
//  Created by Matías Blum on 28/10/2023.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    
    private let baseURL = "https://api.imgur.com/3/gallery/search/?q=cats&q_type=jpg"
    private let clientID = "1ceddedc03a5d71"
    
    private init() {} 
    
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
            
            do {
                let response = try JSONDecoder().decode(ImgurResponse.self, from: data)
                
                let filteredData = response.data.compactMap { imgurData -> ImgurData? in
                    guard let firstJPEGImage = imgurData.images?.first(where: { $0.type == .imageJPEG }) else {
                        return nil
                    }
                    return ImgurData(id: imgurData.id, images: [firstJPEGImage])
                }
                
                completion(filteredData, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
