{ config, ... }:

{
  services.fusuma = {
    enable = true;
    package = config.lib.test.mkStubPackage { outPath = "@fusuma@"; };
    extraPackages = [
      (config.lib.test.mkStubPackage { outPath = "@coreutils@"; })
      (config.lib.test.mkStubPackage { outPath = "@xdotool@"; })
    ];
    settings = { };
  };

  nmt.script = ''
    assertFileContent \
      home-files/.config/systemd/user/fusuma.service \
        ${./expected-service.service}
  '';
}
