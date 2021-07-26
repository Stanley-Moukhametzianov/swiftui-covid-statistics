//
//  ImageCacheKey.swift
//  Covid Data
//
//  Created by Stanley Moukh on 7/24/21.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey{
    static let defaultValue: ImageCache = TemporaryImageCache()
}
extension EnvironmentValues{
    var imageCache: ImageCache{
        get{self[ImageCacheKey.self]}
        set{self[ImageCacheKey] = newValue}
    }
}
