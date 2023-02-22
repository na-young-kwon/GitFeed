//
//  Cache.swift
//  NetworkPlatform
//
//  Created by 권나영 on 2023/02/18.
//

import Foundation
import Domain
import RxSwift

final class Cache {
    
    enum CacheError: Error {
        case notCached
    }
    
    let feedCache = NSCache<NSString, CacheValue<Repository>>()
    
    func save(objects repos: [Repository]) -> Completable {
        return Completable.create { [weak self] (observer) -> Disposable in
            guard let self = self else {
                observer(.completed)
                return Disposables.create()
            }
            repos.forEach { repo in
                let key = self.convertToKey(for: repo)
                self.feedCache.setObject(CacheValue(repo), forKey: key)
            }
            observer(.completed)
            return Disposables.create()
        }
    }
    
    func fetchObject(for repos: [Repository]) -> Single<[Repository]> {
        // 제시된 키에 대해 캐시된게 없을때 오류를 보내는게 맞나...?
        return Single.create { [weak self] (observer) -> Disposable in
            repos.forEach { repo in
                guard let self = self else {
                    return
                }
                let key = self.convertToKey(for: repo)
                guard let repo = self.feedCache.object(forKey: key) else {
                    observer(.failure(CacheError.notCached))
                    return
                }
                observer(.success([repo.value]))
            }
            return Disposables.create()
        }
    }
    
    private func convertToKey(for repo: Repository) -> NSString {
        return String(repo.id) as NSString
    }
}
