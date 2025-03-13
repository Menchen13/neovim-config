return {
    'Civitasv/cmake-tools.nvim', ft = {'c', 'cpp', 'h', 'hpp', 'txt'} , opts = {
        cmake_kits_path = 'C:/Users/Menchen/OneDrive/Desktop/tmp/cmake-tools-kits.json', -- very important that the generator is in "": "\"MinGW Makefiles\""
        cmake_regenerate_on_save = false,
        cmake_build_directory = "build",
        cmake_soft_link_compile_commands = false, -- doesnt work on windows, softlinks need admin for some reason. sourcing the file in clangd directly
        cmake_executor = {name = 'toggleterm'},
        cmake_runner = {name = 'toggleterm'}

    }
}
