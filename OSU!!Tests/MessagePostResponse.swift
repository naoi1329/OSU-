//
//  MessagePostResponse.swift
//  OSU!!
//
//  Created by 直井翔汰 on 2018/04/29.
//  Copyright © 2018年 直井翔汰. All rights reserved.
//

import Foundation

struct MessagePostResponse: Codable {
    var negaposi: Bool
    
    enum CodingKeys: String, CodingKey {
        case negaposi
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let negaposiBool = try? values.decode(String.self, forKey: .negaposi) {
            if negaposiBool == "negative" {
                negaposi = false
            } else {
                negaposi = true
            }
        } else {
            negaposi = false
        }
    }

}
