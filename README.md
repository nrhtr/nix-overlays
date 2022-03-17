# nixpkgs-overlay
Contains missing packages / tweaks to make them work on my system.

Some of these hacks may only be needed for ARM macOS, I haven't tested on other platforms.

Example usage.
```
let
  # Pinning example: https://gist.github.com/CMCDragonkai/b5a37367094223e2d3c26b96644340f3#pinning
  overlay = builtins.fetchTarball https://api.github.com/repos/nrhtr/nix-overlays/tarball/main;
...

nixpkgs.overlays = [ (import overlay) ];

# Use `home.packages` instead with home-manager
environment.systemPackages = with pkgs; [
  python3Packages.python-openstackclient
  hiera-eyaml-gpg
  ...
];
```
