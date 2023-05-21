{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    dream2nix.url = "github:nix-community/dream2nix";
    src = {
      url = "github:scivision/PyLivestream";
      flake = false;
    };
  };

  outputs = { self, flake-utils, nixpkgs, dream2nix, src }:
    dream2nix.lib.makeFlakeOutputs {
      systems = ["x86_64-linux"];
      config.projectRoot = ./.;
      source = src;
      projects.pylivestream = {
        name = "pylivestream";
        subsystem = "python";
        translator = "pip";
        subsystemInfo.pythonVersion = "3.10";
      };
    };
}
