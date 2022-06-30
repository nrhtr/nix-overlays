_self: _super: rec {
  executeThatThing = _super.vimUtils.buildVimPlugin {
    pname = "ExecuteThatThing.vim";
    version = "2021-01-19";
    src = _super.fetchgit {
      name = "vim-ExecuteThatThing";
      url = "https://notabug.org/cryptarch/vim-ExecuteThatThing";
      rev = "431fe2a422b82b1c8092279c3bf5d2dd0bbf85fc";
      sha256 = "sha256-/7SxpXZP5sRqyuhnmy1DPFAF0OtqY/RblXhMZwm2CHg=";
    };
  };
  melbourne-tools = _super.callPackage ./pkgs/melbourne-tools/default.nix { };
  yubikey-manager = _super.callPackage ./pkgs/yubikey-manager/default.nix { };
  hiera-eyaml-gpg = _super.callPackage ./pkgs/hiera-eyaml-gpg/default.nix { };
  python3 = _super.python3.override {
    packageOverrides = self: super: rec {
      macaroonbakery = self.buildPythonPackage rec {
        pname = "macaroonbakery";
        version = "1.3.1";

        src = super.fetchPypi {
          inherit pname version;
          sha256 = "sha256-I/OEFTQaHQShVbTaxnMNOtXzm4bOB7G7E0vdpStIsFM=";
        };

        buildInputs = with super; [
          pytest
        ];

        doCheck = false;

        propagatedBuildInputs = with super; [ 
          pymacaroons
          requests
          protobuf
          pyRFC3339
        ];
      };
      python-libmaas = self.buildPythonPackage rec {
        pname = "python-libmaas";
        #version = "0.6.6";
        version = "unstable-2022-01-12";

        src = _super.fetchFromGitHub {
          owner = "maas";
          repo = "python-libmaas";
          rev = "ae3e321924b231ae5b765cd70cdd074cc2a9929e";
          sha256 = "sha256-ZpGpkyUWq9tezZQ0do9J+K92wLsXB0ZwmznvVzJTX+k=";
        };

        #src = super.fetchPypi {
          #inherit pname version;
          #sha256 = "sha256-XabQ9jug13KfMu7z7Tssj9YPKAD32PPaQzOUvUzTZnA=";
        #};

        buildInputs = with super; [
          django
          fixtures
          setuptools
          testscenarios
          testtools
          twisted
        ];

        doCheck = false;

        propagatedBuildInputs = with super; [ 
          oauthlib
          terminaltables
          argcomplete
          colorclass
          macaroonbakery
          aiohttp
          pyyaml
          pymongo
        ];
      };
      dnspython = super.dnspython.overrideAttrs (oldAttrs: rec {
        doCheck = false;
        doInstallCheck = false;
      });
      detect-secrets = super.detect-secrets.overrideAttrs (oldAttrs: rec {
        pname = "detect-secrets";
        version = "1.2.0";
        src = super.fetchFromGitHub {
          owner = "Yelp";
          repo = pname;
          rev = "v${version}";
          hash = "sha256-4VcV06iaL3NAj7qF8RyfWV1zgrt928AQfjGeuO2Pbjk=";
          leaveDotGit = true;
        };
      });
      oslo-log = super.oslo-log.overrideAttrs (oldAttrs: rec {
        doCheck = false;
        doInstallCheck = false;
      });
      python-neutronclient =
        self.callPackage ./pkgs/python-neutronclient/default.nix { };
      python-designateclient =
        self.callPackage ./pkgs/python-designateclient/default.nix { };
      python-troveclient =
        self.callPackage ./pkgs/python-troveclient/default.nix { };
      python-mistralclient =
        self.callPackage ./pkgs/python-mistralclient/default.nix { };
      python-openstackclient =
        self.callPackage ./pkgs/python-openstackclient/default.nix { };
      ssh2-python = self.buildPythonPackage rec {
        pname = "ssh2-python";
        version = "0.27.0";

        src = super.fetchPypi {
          inherit pname version;
          sha256 = "sha256-plsU/0S3oFzpDHCvDeZE0wwdB+dtrFDfjg19K5QJYjs=";
        };

        # We don't want to build with CMake, just include it for the libssh2 bindings.
        dontUseCmakeConfigure = true;
        nativeBuildInputs = [ _self.cmake ];

        SYSTEM_LIBSSH2 = "1";

        buildInputs = [ _self.libssh2 _self.openssl _self.zlib ];
      };
      nectarallocationclient = self.buildPythonPackage rec {
        pname = "nectarallocationclient";
        version = "1.6.0";

        doCheck = false;

        src = super.fetchPypi {
          inherit pname version;
          sha256 = "sha256-gY4a47n9t8y86f+SxDZy1++ekEwbYAtf7TZDQNTJvic=";
        };

        buildInputs = [
          super.oslo-utils
          super.requests
          super.keystoneauth1
          super.osc-lib
          super.pbr
        ];
      };
      os-client-config = self.buildPythonPackage rec {
        pname = "os-client-config";
        version = "2.1.0";

        src = super.fetchPypi {
          inherit pname version;
          sha256 = "sha256-q8OKNR+MAG009+5fP2SN5ePs9kVcxdds/YidKRzfP04=";
        };

        buildInputs = [ super.openstacksdk super.jsonschema ];
      };
      requests-aws = super.buildPythonPackage rec {
        pname = "requests-aws";
        version = "0.1.8";

        doCheck = false;

        src = super.fetchPypi {
          inherit pname version;
          sha256 = "sha256-vS6DhvCdlKhLnK1ulmsh8xSTc0M2qPR7m1NYBpSadx8=";
        };

        buildInputs = [ super.requests ];
      };
      rgwadmin = super.buildPythonPackage rec {
        pname = "rgwadmin";
        version = "2.3.1";

        src = super.fetchPypi {
          inherit pname version;
          sha256 = "sha256-Gaf9p79+ouKD1/6Mi+okMVpHxqBc0q06014sx2Lxqhw=";
        };

        buildInputs = [ super.requests self.requests-aws ];

        propagatedBuildInputs = [ super.requests self.requests-aws ];
      };
      python-freshdesk = super.buildPythonPackage rec {
        pname = "python-freshdesk";
        version = "1.3.8";

        src = super.fetchPypi {
          inherit pname version;
          sha256 = "sha256-TmIgOZVMeRONKWwX9jvctlhjoDpnopnX6F0kB53ibEI=";
        };

        doCheck = false;

        buildInputs = [ super.requests super.python-dateutil ];
      };
    };
  };
  python3Packages = python3.pkgs;
}
