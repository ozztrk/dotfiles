require("refactoring").setup({
    -- Configure type prompting for languages that support it
    prompt_func_return_type = {
        go = true,
        cpp = true,
        c = true,
    },
    prompt_func_param_type = {
        go = true,
        cpp = true,
        c = true,
    },
    -- Language-specific print statements for debugging
    printf_statements = {
        python = "print(f'{%s=}')",
        javascript = "console.log('%s:', %s);",
        typescript = "console.log('%s:', %s);",
        lua = "print('%s:', %s)",
        c = 'printf("%s: %d\\n", %s);',
        cpp = 'std::cout << "%s: " << %s << std::endl;',
    },
    print_var_statements = {
        python = "print(f'{%s=}')",
        javascript = "console.log('%s:', %s);",
        typescript = "console.log('%s:', %s);",
        lua = "print('%s:', %s)",
        c = 'printf("%s: %d\\n", %s);',
        cpp = 'std::cout << "%s: " << %s << std::endl;',
    },
})
