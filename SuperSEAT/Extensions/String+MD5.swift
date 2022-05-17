//
//  String+MD5.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 16/5/22.
//

import CryptoKit
import Foundation

extension String {
    
    public var md5: String {
        guard let d = self.data(using: .utf8) else {
            return ""
        }
        let digest = Insecure.MD5.hash(data: d)
        let h = digest.reduce("") { (res: String, element) in
            let hex = String(format: "%02x", element)
            let  t = res + hex
            return t
        }
        return h
    }
}
