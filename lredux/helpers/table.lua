local Table = {}

function Table.keys(tbl)
    assert(type(tbl) == 'table', 'expected a table value.')
    local keys = {}
    for k, _ in pairs(tbl) do
        table.insert(keys, k)
    end
    return keys
end

return Table
