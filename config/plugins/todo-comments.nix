{ ... }:
{
  plugins.todo-comments = {
    enable = true;
    settings = {
      highlight = {
        keyword = "bg";
        pattern = [
          ".*<(KEYWORDS)\s*\\(.*\\)\s*:"
          ".*<(KEYWORDS)\s*:"
          ".*<(KEYWORDS)\s*"
        ];
      };
      search = {
        # pattern = "\b(KEYWORDS)";
        pattern = "\\b(KEYWORDS)\\s*(\\(.*\\))?\\s*:";
      };
    };
  };

}
