# Handl
Handl (/ˈhandl/) is a module designed for Luau that streamlines the process of interfacing with many modules at once all under a simple object.

This module was designed for Luau but can be adapted for vanilla Lua very easily.

## Package.new()
### Usage
```lua
local Package = require(path.to.Handl)

local MyPackage = Package.new()
```
#### Returns:
  - a `Package` object
** **
## Package:Load(modules: Instance | Array\<ModuleScript\>)
### Usage
```lua
local Package = require(path.to.Handl)

local MyPackage = Package.new()
MyPackage:Load({path.to.ModuleA, path.to.ModuleB})
```
#### Returns:
  - `nil`
** **
## Package:Run(name: string, func: string, any...)
### Usage
```lua
local Package = require(path.to.Handl)

local MyPackage = Package.new()
MyPackage:Load({path.to.ModuleA, path.to.ModuleB})
MyPackage:Run("ModuleB", "TestFunction", "arg1", "arg2")
```
#### Returns:
  - `any?...`
** **
## Package:Call(name: string, any...)
### Usage
```lua
local Package = require(path.to.Handl)

local MyPackage = Package.new()
MyPackage:Load({path.to.ModuleA, path.to.ModuleB})
MyPackage:Call("ModuleA", "arg1", "arg2") --ModuleA must return a function for this to work.
```
#### Returns:
  - `any?...`
** **
## Package:Fetch(name: string, idx: string?)
### Usage
```lua
local Package = require(path.to.Handl)

local MyPackage = Package.new()
MyPackage:Load({path.to.ModuleA, path.to.ModuleB})
MyPackage:Fetch("ModuleA", "field")
```
#### Returns:
  - `any`
