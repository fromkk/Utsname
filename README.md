[![Build Status](https://travis-ci.org/fromkk/Utsname.svg?branch=master)](https://travis-ci.org/fromkk/Utsname)

# Utsname for Swift

`Utsname` is wrapped C library `utsname`.

---

# Install

If you don't have `Cartfile`, you should make that file.
Add line in Cartfile.

```
github "fromkk/Utsname" == 0.0.9
```

Then execute `carthage update` from command line.

---

# Usage

```swift
import Utsname

let systemInfo = Utsname()
print(systemInfo.machine)
print(systemInfo.nodename)
print(systemInfo.release)
print(systemInfo.sysname)
print(systemInfo.version)
```
