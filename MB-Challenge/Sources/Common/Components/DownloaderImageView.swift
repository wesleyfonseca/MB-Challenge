//
//  DownloaderImageView.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 19/11/25.
//

import UIKit

final class DownloaderImageView: UIImageView {
    
    // MARK: - Properties
    
    private let imageCache = NSCache<NSString, UIImage>()
    private var imageUrlString: String?
    
    // MARK: - Methods
    
    func downloadImage(with urlString: String) {
        imageUrlString = urlString
        
        guard let url = URL(string: urlString) else { return }
        image = nil
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            guard let self else { return }
            
            if let error {
                print("ImageDownloadError: \(error.localizedDescription)")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data ?? Data()) {
                    self.imageCache.setObject(image, forKey: NSString(string: urlString))
                    if self.imageUrlString == urlString {
                        self.image = image
                    }
                }
            }
        }.resume()
    }
}
