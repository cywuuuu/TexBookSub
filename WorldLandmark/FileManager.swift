//
//  FileManager.swift
//  WorldLandmark
//
//  Created by cyw on 2022/11/9.
//

import Foundation
extension FileManager {
    static var documentsDirectory: URL {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return paths[0]
        
    }
}
