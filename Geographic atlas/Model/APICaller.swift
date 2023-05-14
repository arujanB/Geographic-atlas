//
//  APICaller.swift
//  Geographic atlas
//
//  Created by Aruzhan Boranbay on 12.05.2023.
//

import Foundation

struct APICaller {
    var url = "https://restcountries.com/v3.1/all"
    
    func fetchRequestMainData(completion: @escaping ([GeographicDatum]) -> Void){
        let urlString = "https://restcountries.com/v3.1/all"
        
        guard let url = URL(string: urlString) else { fatalError("Error urlString in APICaller") }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, responce, error in
            guard let data else { return }
//            do{
//                let geographicData = try JSONDecoder().decode(GeographicData.self, from: data)
//                print("HELLLLOOOO \(geographicData[0].name)")
//                completion(geographicData)
//            }catch {
//                print("FAILLLLLLLL \(error)")
//            }
            
            if let geographicData = try? JSONDecoder().decode(GeographicData.self, from: data) {
                completion(geographicData)
            }else {
                print("FAIL")
            }
        }
        task.resume()
    }
    
}
