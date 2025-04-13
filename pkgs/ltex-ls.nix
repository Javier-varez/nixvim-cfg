{
  lib,
  stdenvNoCC,
  fetchurl,
  makeBinaryWrapper,
  jre_headless,
}:
stdenvNoCC.mkDerivation rec {
  pname = "ltex-ls";
  version = "16.0.1";

  src = fetchurl {
    url = "https://github.com/Javier-varez/ltex-ls/releases/download/16.0.0-fix_lt_http_request/ltex-ls-${version}-alpha.1.develop.tar.gz";
    sha256 = "sha256-JsdmKAHMuPvJWINWeN3rdXCAu/ZsvozfBFVaYV93as8=";
  };

  nativeBuildInputs = [ makeBinaryWrapper ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -rfv bin/ lib/ $out
    rm -fv $out/bin/.lsp-cli.json $out/bin/*.bat
    wrapProgram $out/bin/ltex-ls --set JAVA_HOME "${jre_headless}"

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://valentjn.github.io/ltex/";
    description = "LSP language server for LanguageTool";
    license = licenses.mpl20;
    mainProgram = "ltex-ls";
    maintainers = with maintainers; [ vinnymeller ];
    platforms = jre_headless.meta.platforms;
  };
}
