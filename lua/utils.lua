function SetOption(option, value)
    vim.api.nvim_set_option_value(option, value, {})
end

function SetVariable(variable, value)
    vim.g[variable] = value
end

function CreateKeymap(mode, keys, action, opts)
    local actualOpts = opts or {}
    vim.keymap.set(mode, keys, action, actualOpts)
end
