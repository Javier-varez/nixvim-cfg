{
  plugins = {
    noice = {
      enable = true;
      settings = {
        notify.enabled = true;
        routes = [
          # I like written messages, but they disappeared after updating to nix 25.05.
          {
            filter = {
              event = "msg_show";
              kind = "bufwrite";
            };
            view = "notify";
          }
        ];
      };
    };
  };
}
