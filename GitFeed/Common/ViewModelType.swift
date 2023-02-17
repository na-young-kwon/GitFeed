//
//  ViewModelType.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/17.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
