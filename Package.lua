type Array<T> = {T}
type Dictionary<T> = {[string]: T}

type Package = {
    _event: BindableEvent,
    Loaded: Dictionary<any>,
    IsLoaded: boolean,
    Finished: RBXScriptSignal,
}

local package = {}

function package.new(): Package
    local _event = Instance.new("BindableEvent")
    local obj: Package = {
        _event = _event,
        Loaded = {},
        IsLoaded = false,
        Finished = _event.Event
    }
    setmetatable(obj, {__index = package, __tostring = function()
        local format = {"\n{\n"}
        for k, _ in pairs(obj.Loaded) do
            table.insert(format, ('\t\t"%s",\n'):format(k))
        end
        table.insert(format, "}\n")
        return table.concat(format)
    end})

    return obj
end

function package:Run(name: string, func: string, ...)
    return self.Loaded[name][func](...)
end

function package:Call(name: string, ...)
    return self.Loaded[name](...)
end

function package:Fetch(name: string, value: any): any?
    return value and self.Loaded[name][value] or self.Loaded[name]
end

function package:Load(dir: ModuleScript | Array<ModuleScript>)
    local modules = typeof(dir) == "Instance" and {dir} or dir --gross but i dont want to rewrite this function
    for _,v in pairs(modules) do
		self.Loaded[v.Name] = require(v)
    end
    self.IsLoaded = true
	self._event:Fire(self.loaded)
end

function package:Unload(modules: string | Array<string>)
    if type(modules) == "string" then
        self.Loaded[modules] = nil
    elseif type(modules) == "table" then
        for _,v in pairs(modules) do
            self.Loaded[v] = nil
        end
    end
end

return package
