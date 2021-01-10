//
//  Observable.swift
//  MyRx
//
//  Created by Bohdan Savych on 10/01/2021.
//

import Foundation

public struct Observable<Element, Error: Swift.Error> {
  
  let producer: (((Event) -> Void) -> Void)

  public init(producer: @escaping (((Event) -> Void) -> Void)) {
    self.producer = producer
  }

  public func observe(with eventHandler: @escaping ((Observable.Event) -> Void)) {
    self.producer(eventHandler)
  }
}

public extension Observable {
  enum Event {
    case next(Element)
    case failure(Error)
    case compeleted

    var element: Element? {
      if case let .next(element) = self  {
        return element
      } else {
        return nil
      }
    }

    var error: Error? {
      if case let .failure(error) = self  {
        return error
      } else {
        return nil
      }
    }
  }
}

extension Observable.Event: Equatable where Element: Equatable, Error: Equatable {}

public enum Never: Error, Equatable {}
