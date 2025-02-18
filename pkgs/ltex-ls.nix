{ pkgs, maven }:
maven.buildMavenPackage {
  pname = "ltex-ls";
  version = "16.0.0";

  src = pkgs.fetchFromGitHub {
    owner = "javier-varez";
    repo = "ltex-ls";
    rev = "fix_lt_http_request";
    sha256 = "sha256-UupIURxIk05ErDtjK3y7MhBpaHffXdRkqqOJ/sMcCL0=";
  };

  doCheck = false;

  mvnJdk = pkgs.jdk11;
  mvnHash = "sha256-gkZMbwnlTT7uc9RT1h1nMN6ky+XJHEzOYXW0ZTtHOkY=";

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    ls  -la
    tar -xf target/ltex-ls-16.0.1-alpha.1.develop.tar.gz -C $out --strip-components=1

    runHook postInstall
  '';

  nativeBuildInputs = with pkgs; [
    python3
  ];
}
