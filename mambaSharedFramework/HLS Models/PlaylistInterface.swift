//
//  PlaylistInterface.swift
//  mamba
//
//  Created by David Coufal on 3/11/19.
//  Copyright © 2019 Comcast Corporation.
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License. All rights reserved.
//

import Foundation

/**
 Defines an interface for `Playlist` objects. This should be used in situations where
 a generic `Playlist` type is enough to clearly define what it required.
 */
public protocol PlaylistInterface: RegisteredHLSTagsProvider, TagSource {
    mutating func insert(tag: HLSTag, atIndex index: Int)
    mutating func insert(tags: [HLSTag], atIndex index: Int)
    mutating func delete(atIndex index: Int)
    mutating func delete(atRange range: HLSTagIndexRange)
    mutating func transform(_ mapping: (HLSTag) throws -> (HLSTag)) throws
    func tags(forMediaGroup group: TagGroupProtocol) -> ArraySlice<HLSTag>
    func write() throws -> Data
}

/**
 Defines an interface for a source of a `HLSTag` array.
 */
public protocol TagSource {
    var tags: [HLSTag] { get }
}
