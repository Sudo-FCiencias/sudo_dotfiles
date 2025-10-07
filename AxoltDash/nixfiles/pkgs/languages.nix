{ config, pkgs, lib, ... }:

{
  # PROGRAMS ====================================
  environment.systemPackages = with pkgs; [
    # HASKELL =--------------------------------=
    ghc
    haskell-language-server
    # Libraries
    cabal-install
    
    # PYTHON =---------------------------------=
    python3
    
    # C =--------------------------------------=
    gcc
    
    # RUST =-----------------------------------=
    cargo
    rust-analyzer
    rustc
    
    # JAVASCRIPT =-----------------------------=
    nodejs
    
    # JAVA =-----------------------------------=
    jdk
    
    # GO =-------------------------------------=
    go
    
    # PHP =------------------------------------=
    php
    phpPackages.composer
    
    # JULIA =----------------------------------=
    julia

    # LUA =------------------------------------=
    luarocks # neovim plugins
    lua
    lua-language-server
    lua51Packages.tiktoken_core # Tokenizer for NVIM LUA

    # LATEX =--------------------------------=
	texlive.combined.scheme-full 

	# TYPST =--------------------------------=
	typst
	tinymist
	websocat
  ];
  nixpkgs.config.allowUnfree = true;
}
