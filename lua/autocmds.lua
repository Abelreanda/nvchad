require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local n_lines = vim.api.nvim_buf_line_count(0)
        local last_nonblank = vim.fn.prevnonblank(n_lines)

        -- 1. Limpiar espacios al final de cada línea
        vim.cmd [[keeppatterns %s/\s\+$//e]]

        -- 2. Eliminar todas las líneas vacías al final
        if last_nonblank < n_lines then
            vim.api.nvim_buf_set_lines(0, last_nonblank, n_lines, true, {})
        end

        -- 3. Insertar exactamente UNA línea vacía al final
        -- Esto crea la línea vacía visual que buscas
        vim.api.nvim_buf_set_lines(0, -1, -1, true, {""})
    end,
})

