//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Karon Bell on 4/23/23.
//

import Foundation


extension String {
    func putCapsOnFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
//
