{
  gpgme = {
    dependencies = ["mini_portile2"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xbgh9d8nbvsvyzqnd0mzhz0nr9hx4qn025kmz6d837lry4lc6gw";
      type = "gem";
    };
    version = "2.0.20";
  };
  hiera-eyaml = {
    dependencies = ["highline" "optimist"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0fqn73wdh0ar63f863bda3wj1ii5p8gc3vqzv39l2cwkax6vcqgj";
      type = "gem";
    };
    version = "3.2.2";
  };
  hiera-eyaml-gpg = {
    dependencies = ["hiera-eyaml"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1216y5cs5x43blx0mik9xfx6y08rc3f322ycirgy6rapfw5jx838";
      type = "gem";
    };
    version = "0.7.4";
  };
  highline = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yclf57n2j3cw8144ania99h1zinf8q3f5zrhqa754j6gl95rp9d";
      type = "gem";
    };
    version = "2.0.3";
  };
  mini_portile2 = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rapl1sfmfi3bfr68da4ca16yhc0pp93vjwkj7y3rdqrzy3b41hy";
      type = "gem";
    };
    version = "2.8.0";
  };
  optimist = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vg2chy1cfmdj6c1gryl8zvjhhmb3plwgyh1jfnpq4fnfqv7asrk";
      type = "gem";
    };
    version = "3.0.1";
  };
}
