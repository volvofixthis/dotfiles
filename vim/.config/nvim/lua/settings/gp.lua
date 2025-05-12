require("gp").setup({
    curl_params = { "--socks5", "127.0.0.1:1080" },
    agents = {
        {
            provider = "openai",
            name = "ChatGPT4o",
            disable = true,
            chat = true,
            command = false,
        },
        {
            provider = "openai",
            name = "ChatGPT4o-mini",
            disable = true,
            chat = true,
            command = false,
        },
        {
            provider = "openai",
            name = "CodeGPT4o-mini",
            disable = true,
            chat = false,
            command = true,
        },
        {
            provider = "openai",
            name = "CodeGPT4o",
            disable = true,
            chat = false,
            command = true,
        },
        {
            name = "OpenAI-o3-mini",
            chat = true,
            command = true,
            -- string with model name or table with model name and parameters
            model = { model = "o3-mini" },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = require("gp.defaults").chat_system_prompt,
        },
    },
    hooks = {
        UnitTests = function(gp, params)
            local template = "I have the following code from {{filename}}:\n\n"
                .. "```{{filetype}}\n{{selection}}\n```\n\n"
                .. "Please respond by writing table driven unit tests for the code above."
            local agent = gp.get_command_agent()
            gp.Prompt(params, gp.Target.enew, agent, template)
        end,
        Explain = function(gp, params)
            local template = "I have the following code from {{filename}}:\n\n"
                .. "```{{filetype}}\n{{selection}}\n```\n\n"
                .. "Please respond by explaining the code above."
            local agent = gp.get_command_agent()
            gp.Prompt(params, gp.Target.enew, agent, template, nil, nil)
        end,
        CodeReview = function(gp, params)
            local template = "I have the following code from {{filename}}:\n\n"
                .. "```{{filetype}}\n{{selection}}\n```\n\n"
                .. "Please analyze for code smells and suggest improvements."
            local agent = gp.get_command_agent()
            gp.Prompt(params, gp.Target.enew, agent, template, nil, nil)
        end,
        CodeSimplify = function(gp, params)
            local template = "I have the following code from {{filename}}:\n\n"
                .. "```{{filetype}}\n{{selection}}\n```\n\n"
                .. "Please change this code to improve efficiency, performance, readibility, reduce cognitive\n"
                .. "complexity, shrink total code length to pass hardcore code reviews and code linters\n"
                .. "You must use and respect following rules:\n"
                .. "- Simplify control flow.\n"
                .. "- Break down complex functions into smaller, focused ones. Each function should have a single responsibility.\n"
                .. "- Extract meaningful, reusable functions.\n"
                .. "- Balance between creativity, complexity and maintainability.\n"
                .. "- Add comment before most complex parts of code.\n"
                .. "- Add comment before every function definition for documentation.\n"
                .. "- Maximum number of function arguments is five. Use structs or variadic functions to overcome this limit\n"
                .. "on function arguments where appropriate.\n"
                .. "- Don't add any explanations.\n"
                .. "- Produced code must be ready to compile without any errors.\n"
                .. "- The code style should be similar to the output of go-fmt command\n"
                .. "- Maximum line length is 140 characters.\n"
                .. "- Maximum line length in comment block is 80 characters.\n"
                .. "- Add comment before struct definition.\n"
                .. "- Add comment before every struct field.\n"
                .. "- Avoid commentary outside of the snippet response.\n"
                .. "- Optimize memory usage. Consider to preallocate memory.\n"
                .. "- Optimize code for performance and efficiency. Try to save energy.\n"
                .. "- You must answer only with valid code and nothing else.\n"
                .. "- Consider to pass data by values instead pointers, if it has huge impact on heap usage.\n"
                .. "- Refactor suboptimal usage of loops.\n"
                .. "- Cache function return value if input values not changed and there is no need to call it again.\n"
                .. "- Inline functions if they are too small and don't used few times.\n"
                .. "- Use existing comments above code line as guideline howto improve code.\n"
                .. "- Implement all requests from comments.\n"
                .. "- Keep code as simple as possible.\n"
                .. "- Follow KISS, DRY and SOLID principles.\n"
                .. "- Use only slash for comments.\n"
            local agent = gp.get_command_agent()
            gp.Prompt(params, gp.Target.vnew, agent, template, nil, nil)
        end,
        CodeFormat = function(gp, params)
            local template = "I have the following code from {{filename}}:\n\n"
                .. "```{{filetype}}\n{{selection}}\n```\n\n"
                .. "Please format this code to improve readibility\n"
                .. "You must use and respect following rules:\n"
                .. "- Add comments before most complex parts of code.\n"
                .. "- Add comment before every function definition for documentation.\n"
                .. "- Produced code must be ready to be compiled without any errors.\n"
                .. "- The code style should be similar to the output of go-fmt command.\n"
                .. "- Maximum line length is 140 characters.\n"
                .. "- Maximum line length in comment block is 80 characters.\n"
                .. "- Add comment before struct definition.\n"
                .. "- Add comment before every struct field.\n"
                .. "- Avoid commentary outside of the snippet response.\n"
                .. "- You must format code without adding anything new to the code.\n"
                .. "- You must answer only with valid code and nothing else.\n"
                .. "- Use only slash for comments.\n"
            local agent = gp.get_command_agent()
            gp.Prompt(params, gp.Target.rewrite, agent, template, nil, nil)
        end,
        CodeFix = function(gp, params)
            local template = "I have the following code from {{filename}}:\n\n"
                .. "```{{filetype}}\n{{selection}}\n```\n\n"
                .. "Please fix errors in this code\n"
                .. "You must use and respect following rules:\n"
                .. "- Syntax must be valid.\n"
                .. "- Preserve logic as close to original as possible\n"
                .. "- The code style should be similar to the output of go-fmt command.\n"
                .. "- Don't add any explanations.\n"
                .. "- Don't add additional comments or text.\n"
                .. "- You must fix code without adding anything new to the code.\n"
                .. "- Produced code must compile without errors.\n"
                .. "- You must answer only with fixed code and nothing else.\n"
            local agent = gp.get_command_agent()
            gp.Prompt(params, gp.Target.rewrite, agent, template, nil, nil)
        end,
    }
})
