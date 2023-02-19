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
    
    let feedCache = NSCache<NSString, CacheValue<Feed>>()
    
    func save(objects feeds: [Feed]) -> Completable {
        return Completable.create { [weak self] (observer) -> Disposable in
            guard let self = self else {
                observer(.completed)
                return Disposables.create()
            }
            feeds.forEach { feed in
                let key = self.convertToKey(for: feed)
                self.feedCache.setObject(CacheValue(feed), forKey: key)
            }
            observer(.completed)
            return Disposables.create()
        }
    }
    
    func fetchObject(for feeds: [Feed]) -> Single<[Feed]> {
        // 제시된 키에 대해 캐시된게 없을때 오류를 보내는게 맞나...?
        return Single.create { [weak self] (observer) -> Disposable in
            feeds.forEach { feed in
                guard let self = self else {
                    return
                }
                let key = self.convertToKey(for: feed)
                guard let feed = self.feedCache.object(forKey: key) else {
                    observer(.failure(CacheError.notCached))
                    return
                }
                observer(.success([feed.value]))
            }
            return Disposables.create()
        }
    }
    
    private func convertToKey(for feed: Feed) -> NSString {
        return feed.id as NSString
    }
}
