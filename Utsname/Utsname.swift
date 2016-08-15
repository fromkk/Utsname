//
//  Utsname.swift
//  UtsnameDemo
//
//  Created by Kazuya Ueoka on 2016/08/15.
//  Copyright © 2016年 fromKK. All rights reserved.
//

import Foundation

public struct Utsname {
    public init() {}

    private var systemInfo: utsname {
        var result: utsname = utsname()
        uname(&result)
        return result
    }
    public var sysname: String {
        let mirror = Mirror(reflecting: self.systemInfo.sysname)
        var result = ""
        for child in mirror.children {
            if let value = child.value as? Int8 where value != 0 {
                result.append(UnicodeScalar(UInt8(value)))
            }
        }
        return result
    }
    public var nodename: String {
        let mirror = Mirror(reflecting: self.systemInfo.nodename)
        var result = ""
        for child in mirror.children {
            if let value = child.value as? Int8 where value != 0 {
                result.append(UnicodeScalar(UInt8(value)))
            }
        }
        return result
    }
    public var release: String {
        let mirror = Mirror(reflecting: self.systemInfo.release)
        var result = ""
        for child in mirror.children {
            if let value = child.value as? Int8 where value != 0 {
                result.append(UnicodeScalar(UInt8(value)))
            }
        }
        return result
    }
    public var version: String {
        let mirror = Mirror(reflecting: self.systemInfo.version)
        var result = ""
        for child in mirror.children {
            if let value = child.value as? Int8 where value != 0 {
                result.append(UnicodeScalar(UInt8(value)))
            }
        }
        return result
    }
    public var machine: String {
        let mirror = Mirror(reflecting: self.systemInfo.machine)
        var result = ""
        for child in mirror.children {
            if let value = child.value as? Int8 where value != 0 {
                result.append(UnicodeScalar(UInt8(value)))
            }
        }
        return result
    }
}
