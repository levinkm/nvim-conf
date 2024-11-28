-- core/autocmds.lua
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- General settings group
local general = augroup("General", { clear = true })

-- Yank highlight
autocmd("TextYankPost", {
    group = general,
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
})

-- Remove whitespace on save
autocmd("BufWritePre", {
    group = general,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Return to last edit position when opening files
autocmd("BufReadPost", {
    group = general,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Resize splits when window is resized
autocmd("VimResized", {
    group = general,
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- Python/Django specific settings
local python_group = augroup("Python", { clear = true })

autocmd("FileType", {
    group = python_group,
    pattern = "python",
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.colorcolumn = "88"
        
        -- Format on save with black
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.py",
            callback = function()
                vim.lsp.buf.format()
            end
        })
    end,
})

-- Django template files
autocmd({ "BufNewFile", "BufRead" }, {
    group = python_group,
    pattern = "*.html",
    callback = function()
        if vim.fn.search("{% \\|{{ ", "nw") ~= 0 then
            vim.bo.filetype = "htmldjango"
        end
    end,
})

-- Golang specific settings
local golang_group = augroup("Golang", { clear = true })

autocmd("FileType", {
    group = golang_group,
    pattern = "go",
    callback = function()
        -- Go formatting
        vim.opt_local.expandtab = false
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        
        -- Auto formatting and import organization on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
                -- Format the buffer
                vim.lsp.buf.format({ async = false })
                
                -- Organize imports
                local params = vim.lsp.util.make_range_params()
                params.context = {only = {"source.organizeImports"}}
                local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
                for _, res in pairs(result or {}) do
                    for _, r in pairs(res.result or {}) do
                        if r.edit then
                            vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
                        end
                    end
                end
            end
        })
    end,
})

-- Go test file creation
autocmd("BufNewFile", {
    group = golang_group,
    pattern = "*_test.go",
    callback = function()
        local filename = vim.fn.expand("%:t:r"):gsub("_test$", "")
        local template = {
            "package " .. vim.fn.expand("%:h:t"),
            "",
            "import (",
            '\t"testing"',
            ")",
            "",
            "func Test" .. filename:sub(1,1):upper() .. filename:sub(2) .. "(t *testing.T) {",
            "\t// Your test code here",
            "}",
        }
        vim.api.nvim_buf_set_lines(0, 0, -1, false, template)
    end
})

-- Kubernetes specific settings
local k8s_group = augroup("Kubernetes", { clear = true })

autocmd({ "BufRead", "BufNewFile" }, {
    group = k8s_group,
    pattern = { "*.yaml", "*.yml" },
    callback = function()
        local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] or ""
        if first_line:match("apiVersion:") or vim.fn.search("kind:", "nw") ~= 0 then
            vim.bo.filetype = "kubernetes"
            vim.opt_local.expandtab = true
            vim.opt_local.shiftwidth = 2
            vim.opt_local.tabstop = 2
            
            -- Enable yaml.schemas if using yaml-language-server
            vim.b.yaml_schemas = {
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.0/all.json"] = "/*.yaml",
            }
        end
    end,
})

-- Dart/Flutter specific settings
local dart_group = augroup("Dart", { clear = true })

autocmd("FileType", {
    group = dart_group,
    pattern = "dart",
    callback = function()
        -- Dart formatting
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.colorcolumn = "80"
        
        -- Format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.dart",
            callback = function()
                vim.lsp.buf.format({ async = false })
            end
        })
    end,
})

-- Flutter project detection and setup
autocmd({ "BufRead", "BufNewFile" }, {
    group = dart_group,
    pattern = "pubspec.yaml",
    callback = function()
        local file = io.open("pubspec.yaml", "r")
        if file then
            local content = file:read("*all")
            file:close()
            if content:match("flutter:") then
                vim.b.is_flutter_project = true
                -- Set up flutter-tools if available
                local ok, flutter_tools = pcall(require, "flutter-tools")
                if ok then
                    flutter_tools.setup({
                        ui = {
                            border = "rounded",
                            notification_style = "native"
                        },
                        decorations = {
                            statusline = {
                                app_version = true,
                                device = true,
                            }
                        },
                        widget_guides = {
                            enabled = true,
                        },
                        closing_tags = {
                            highlight = "ErrorMsg",
                            prefix = "//",
                            enabled = true
                        }
                    })
                end
            end
        end
    end,
})

-- Flutter hot reload on save (only in flutter projects)
autocmd("BufWritePost", {
    group = dart_group,
    pattern = "*.dart",
    callback = function()
        if vim.b.is_flutter_project then
            vim.cmd("FlutterReload")
        end
    end,
})

-- Handle large files
local large_file = augroup("LargeFile", { clear = true })
autocmd("BufReadPre", {
    group = large_file,
    callback = function()
        local max_size = 1024 * 1024  -- 1MB
        local file_size = vim.fn.getfsize(vim.fn.expand("%"))
        if file_size > max_size then
            vim.b.large_file = true
            vim.opt_local.foldmethod = "manual"
            vim.opt_local.cmdheight = 2
            vim.opt_local.syntax = "off"
            vim.opt_local.bufhidden = "unload"
            vim.opt_local.undolevels = -1
        end
    end,
})