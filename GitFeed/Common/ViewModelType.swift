//
//  ViewModelType.swift
//  GitFeed
//
//  Created by κΆλμ on 2023/02/17.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
