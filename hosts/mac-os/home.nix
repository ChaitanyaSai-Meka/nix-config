{ config, pkgs, ... }:

{
  home.stateVersion = "24.05"; 

  # All your developer tools and CLI apps 
  home.packages = with pkgs; [
    aircrack-ng
    aom
    apktool
    apr
    apr-util
    argon2
    aribb24
    arp-scan
    asdf
    at-spi2-core
    autoconf
    automake
    bettercap
    boost
    brotli
    c-ares
    ca-certificates
    cairo
    capstone
    certifi
    cffi
    cjson
    cmocka
    cocoapods
    coreutils
    cryptography
    curl
    dav1d
    dbus
    double-conversion
    dtc
    edencommon
    esphome
    ettercap
    fb303
    fbthrift
    ffmpeg
    fizz
    flac
    fmt
    folly
    fontconfig
    freetds
    freetype
    frei0r
    fribidi
    gcc
    gd
    gdk-pixbuf
    gettext
    gflags
    giflib
    git
    git-lfs
    glib
    glog
    gmp
    gnutls
    gobuster
    graphite2
    gsettings-desktop-schemas
    gtk+3
    harfbuzz
    hashcat
    hicolor-icon-theme
    highway
    hiredis
    httpd
    hwloc
    hydra
    icu4c@75
    icu4c@76
    icu4c@77
    imath
    iperf3
    isl
    john
    jpeg-turbo
    jpeg-xl
    json-c
    krb5
    lame
    leptonica
    lftp
    libarchive
    libass
    libavif
    libb2
    libbluray
    libdeflate
    libepoxy
    libevent
    libffi
    libgcrypt
    libgit2
    libgpg-error
    libidn2
    libimagequant
    libksba
    liblinear
    libmaxminddb
    libmicrohttpd
    libmpc
    libnet
    libnghttp2
    libogg
    libpcap
    libpng
    libpq
    libraqm
    librist
    libsamplerate
    libscrypt
    libslirp
    libsndfile
    libsodium
    libsoxr
    libssh
    libssh2
    libtasn1
    libtiff
    libtool
    libunibreak
    libunistring
    libusb
    libuv
    libvidstab
    libvmaf
    libvorbis
    libvpx
    libx11
    libxau
    libxcb
    libxdmcp
    libxext
    libxfixes
    libxi
    libxml2
    libxrender
    libxslt
    libxtst
    libyaml
    libzip
    little-cms2
    livekit-cli
    llvm
    lua
    lz4
    lzo
    m4
    mariadb-connector-c
    mbedtls
    minizip
    mpdecimal
    mpfr
    mpg123
    ncurses
    ndpi
    net-snmp
    netcat
    nettle
    nginx
    nikto
    nmap
    node
    ntopng
    numpy
    nvm
    oniguruma
    openblas
    opencore-amr
    openexr
    openjdk
    openjpeg
    openldap
    openssl@1.1
    openssl@3
    opus
    osslsigncode
    p11-kit
    pango
    pcre
    pcre2
    php
    pillow
    pixman
    pkgconf
    portaudio
    proxychains-ng
    pycparser
    python-packaging
    python-setuptools
    python@3.12
    python@3.13
    qemu
    rav1e
    readline
    recon-ng
    rrdtool
    rtmpdump
    rubberband
    ruby
    ruby-build
    rust
    scrcpy
    sdl2
    sherlock
    shtool
    snappy
    speex
    sqlite
    srt
    sslscan
    stress-ng
    svt-av1
    tailwindcss
    tcpdump
    telnet
    tesseract
    theora
    tidy-html5
    tor
    unbound
    unixodbc
    vde
    wangle
    watchman
    webp
    wget
    x264
    x265
    xorgproto
    xvid
    xxhash
    xz
    z3
    zeromq
    zimg
    zlib
    zstd
  ];

  # Enable zsh (default shell in macOS)
  programs.zsh.enable = true;

  # Git configuration
  programs.git = {
    enable = true;
    userName = "ChaitanyaSai-Meka";
    userEmail = "marvelchaitanya@gmail.com";
    extraConfig = {
      init.defaultBranch = "master";
    };
  };

  # Enable and configure zsh (default shell in macOS)
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      ll = "ls -lah";
      gs = "git status";
      ga = "git add .";
      gc = "git commit -m";
      gp = "git push";
    };
  };

  # Optional: add shell aliases
  home.shellAliases = {
    ll = "ls -lah";
    gs = "git status";
    ga = "git add .";
    gc = "git commit -m";
    gp = "git push";
  };

  # Optional: manage dotfiles directly with Nix
  # home.file.".tool-versions".text = ''
  #   nodejs 20.5.0
  #   python 3.12.3
  #   ruby 3.1.2
  # '';

  # You can also manage a custom .zshrc if needed:
  # home.file.".zshrc".text = ''
  #   export PATH="$HOME/.asdf/bin:$PATH"
  #   source ~/.asdf/asdf.sh
  #   source ~/.asdf/completions/asdf.bash
  # '';
}
