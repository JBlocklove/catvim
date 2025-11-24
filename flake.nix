# Copyright (c) 2023 BirdeeHub
# Licensed under the MIT license

{
	description = "JBlocklove's nixCats-nvim configuration flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
		nixCats.url = "github:BirdeeHub/nixCats-nvim";

		neovim-nightly-overlay = {
		  url = "github:nix-community/neovim-nightly-overlay";
		};

		# Local plugin for colorscheme
		plugins-ghostmatter = {
			url = "path:/home/jason/repos/nvim-plugins/ghostmatter.nvim";
			flake = false;
		};

		# Personal plugin for VHDL component copying
		plugins-vip = {
			url = "github:JBlocklove/vip";
			flake = false;
		};


	};

	outputs = { self, nixpkgs, nixCats, ... }@inputs: let
		inherit (nixCats) utils;
	luaPath = ./.;
	forEachSystem = utils.eachSystem nixpkgs.lib.platforms.all;
	extra_pkg_config = {
		#allowUnfree = true;
	};
	dependencyOverlays = /* (import ./overlays inputs) ++ */ [
		(utils.standardPluginOverlay inputs)
	];

	categoryDefinitions = { pkgs, settings, categories, extra, name, mkPlugin, ... }@packageDef:
		let
			vp = pkgs.vimPlugins or {};
			np = pkgs.neovimPlugins or {};
			plugins = vp // np;
		in{

			lspsAndRuntimeDeps = {
				general = with pkgs; [
					ripgrep
				];
				latex = with pkgs; [
					#latexmk
					zathura
					pandoc
					texlab
				];
				lua = with pkgs; [
					lua-language-server
				];
			};

			startupPlugins = {
				general = with plugins; {
					always = [
						lze
						lzextras
						plenary-nvim
						(nvim-notify.overrideAttrs { doCheck = false; }) # TODO: huh?
						nvim-web-devicons
					];
					ui = [
						catppuccin-nvim
					];
					# extra = [
					# 	vim-tmux-navigator
					# ];

				};

				# themer = with plugins;
				# 	(builtins.getAttr (categories.colorscheme or "moonlight") {
				# 		"catppuccin" = catppuccin-nvim;
				# 		"tokyonight" = tokyonight-nvim;
				# 		"moonlight" = ghostmatter;
				# 	}
				# );
			};

			optionalPlugins = {
				general = with plugins; {
					completion = [
						blink-cmp
						blink-compat
						cmp-cmdline
						luasnip
						colorful-menu-nvim
					];

					treesitter = [
						nvim-treesitter-textobjects
						nvim-treesitter.withAllGrammars
					];
					ui = [
						nvim-colorizer-lua
						bufferline-nvim
						lualine-nvim
					];
					telescope = [
						telescope-nvim
						telescope-fzf-native-nvim
            			telescope-ui-select-nvim
					];
					lsp = [
						nvim-lspconfig
					];
					git = [
						gitsigns-nvim
					];
					extra = [
						vim-tmux-navigator
						trouble-nvim
						undotree
						eyeliner-nvim
					];

				};
				hardware = with plugins; [
					vip
				];

				latex = with plugins; [
					vimtex
				];

				markdown = with plugins; [
					markdown-preview-nvim
					markview-nvim
    			];
			};

			sharedLibraries = {
				general = with pkgs; [
				];
			};

			environmentVariables = {
				test = {
					CATTESTVAR = "It worked!";
				};
			};

			python3.libraries = {
				test = (_:[]);
			};

			extraLuaPackages = {
				test = [ (_:[]) ];
			};
		};



	packageDefinitions = {
		catvim = {pkgs , name, ... }@misc: {
# they contain a settings set defined above
# see :help nixCats.flake.outputs.settings
			settings = {
				suffix-path = true;
				suffix-LD = true;
				wrapRc = true;
				configDirName = "nvim-nixcats";
				#aliases = [ "catvim" ];
# neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
			};
			categories = {
				general = true;
				markdown = true;
				latex = true;
				themer = true;
				colorscheme = "catppuccin-mocha";
			};
		};
	};

	defaultPackageName = "catvim";
	in


		forEachSystem (system: let
				nixCatsBuilder = utils.baseBuilder luaPath {
				inherit nixpkgs system dependencyOverlays extra_pkg_config;
				} categoryDefinitions packageDefinitions;
				defaultPackage = nixCatsBuilder defaultPackageName;
				pkgs = import nixpkgs { inherit system; };
				in
				{
				packages = utils.mkAllWithDefault defaultPackage;
				devShells = {
				default = pkgs.mkShell {
					name = defaultPackageName;
					packages = [ defaultPackage ];
					inputsFrom = [ ];
					shellHook = ''
						'';
				};
				};

				}) // (let
	nixosModule = utils.mkNixosModules {
		moduleNamespace = [ defaultPackageName ];
		inherit defaultPackageName dependencyOverlays luaPath
			categoryDefinitions packageDefinitions extra_pkg_config nixpkgs;
	};
	homeModule = utils.mkHomeModules {
		moduleNamespace = [ defaultPackageName ];
		inherit defaultPackageName dependencyOverlays luaPath
			categoryDefinitions packageDefinitions extra_pkg_config nixpkgs;
	};
	in {

		overlays = utils.makeOverlays luaPath {
			inherit nixpkgs dependencyOverlays extra_pkg_config;
		} categoryDefinitions packageDefinitions defaultPackageName;

		nixosModules.default = nixosModule;
		homeModules.default = homeModule;

		inherit utils nixosModule homeModule;
		inherit (utils) templates;
	});

}
