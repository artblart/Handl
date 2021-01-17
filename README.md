# Handl
Handl (/ˈhandl/) is a module designed for Luau that streamlines the process of interfacing with many modules at once all under a simple object.

Despite the module being designed for Luau, you can very easily adapt it for vanilla Lua.

## Package.new()
### Usage
```lua
local Package = require(path.to.Handl)

local MyPackage = Package.new()
```
#### Returns:
  - a `Package` object
** **
## Package:Load(modules: ModuleScript | Array\<ModuleScript\>)
### Usage
```lua
local Package = require(path.to.Handl)

local MyPackage = Package.new()
MyPackage:Load({path.to.ModuleA, path.to.ModuleB})
```
#### Returns:
  - `nil`
** **
## Package:Run(name: string, func: string?, any...)
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
** **
## Package:Unload(modules: string | Array\<string\>)
### Usage
```lua
local Package = require(path.to.Handl)

local MyPackage = Package.new()
MyPackage:Load({path.to.ModuleA, path.to.ModuleB})
MyPackage:Unload({"ModuleA", "ModuleB"})
```
#### Returns:
  - `nil`
