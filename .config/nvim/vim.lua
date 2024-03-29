require'nvim-treesitter.configs'.setup{
    -- 启用高亮
    highlight = {
        enable = true,
	-- 禁用 vim 基于正则达式的语法高亮，太慢
        additional_vim_regex_highlighting = false,
    },
    -- 启用缩进
    indent = {
        enable = true,
    },
}
-- 自动打出成对括号
require("nvim-autopairs").setup {}
-- nvim-tree配置
-- require("nvim-tree").setup{}
