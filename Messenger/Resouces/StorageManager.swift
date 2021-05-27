//
//  StorageManager.swift
//  Messenger
//
//  Created by Yaroslav on 27.05.2021.
//

import Foundation
import FirebaseStorage

final class StorageManager {
    
    public enum StorageErrors: Error {
        case failedToUpload
        case failedToGetDownloadUrl
    }
    
    
    static let shared = StorageManager()
    private let storage = Storage.storage().reference()
    
    public typealias UploadProfilePicture = (Result<String, Error>) -> Void
    
    public func uploadProfilePicture(with data: Data,
                                     fileName: String,
                                     completion: @escaping UploadProfilePicture) {
        
        storage.child("images/\(fileName)").putData(data, metadata: nil) { [self] (metadata, error) in
            guard error == nil else {
                print("failed to upload data to firebase for picture")
                completion(.failure(StorageErrors.failedToUpload))
                return
            }
            
            let reference = storage.child("images/\(fileName)").downloadURL { (url, error) in
                guard let url = url else {
                    print("Failed to get download url")
                    completion(.failure(StorageErrors.failedToGetDownloadUrl))
                    return
                }
                let urlString = url.absoluteString
                print("Download url returned: \(urlString)")
                completion(.success(urlString))
            }
        }
    }
    
    
}
