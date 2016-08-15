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
        return self._stringFromMirror(mirror)
    }
    public var nodename: String {
        let mirror = Mirror(reflecting: self.systemInfo.nodename)
        return self._stringFromMirror(mirror)
    }
    public var release: String {
        let mirror = Mirror(reflecting: self.systemInfo.release)
        return self._stringFromMirror(mirror)
    }
    public var version: String {
        let mirror = Mirror(reflecting: self.systemInfo.version)
        return self._stringFromMirror(mirror)
    }
    public var machine: String {
        let mirror = Mirror(reflecting: self.systemInfo.machine)
        return self._stringFromMirror(mirror)
    }

    private func _stringFromMirror(mirror: Mirror) -> String {
        var result = ""
        for child in mirror.children {
            if let value = child.value as? Int8 where value != 0 {
                result.append(UnicodeScalar(UInt8(value)))
            }
        }
        return result
    }
}
