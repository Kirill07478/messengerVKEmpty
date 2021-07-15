//
//  loadImageWithURL.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 06.07.2021.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self?.image = image
            }
        }
        
//        DispatchQueue.global().async { [weak self] in
//                    if let data = try? Data(contentsOf: url) {
//                        if let image = UIImage(data: data) {
//                            DispatchQueue.main.async {
//                                self?.image = image
//                            }
//                        }
//                    }
//                }
        
    }
}
