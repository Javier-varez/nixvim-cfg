# Nixvim configuration

My custom neovim configuration using nixvim.

## Run

Run this flake with:

```
nix run github:javier-varez/nixvim-cfg
```

## Use in a NixOS system

Add the following to your nixos configuration:

```
nixosConfigurations.myHostName = nixpkgs.lib.nixosSystem {
  modules = [
    nixvim-user.nixosModules.nixvim

    # ...
  ];

  # ...
};
```
