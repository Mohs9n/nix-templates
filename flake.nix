{
  description = "A Personal collection of template flakes";

  outputs = {self}: let
    mkWelcomeText = {
      name,
      description,
      path,
      buildTools ? null,
      additionalSetupInfo ? null,
    }: {
      inherit path;

      description = name;

      welcomeText = ''
        # ${name}
        ${description}
      '';
    };
  in {
    templates = {
      empty = mkWelcomeText {
        name = "Empty Template";
        description = ''
          A simple flake that provides a devshell
        '';
        path = ./empty;
      };
      rust = mkWelcomeText {
        path = ./rust;
        name = "Rust Template";
        description = ''
          A basic rust application template with a package build.
        '';
        buildTools = [
          "All essential rust tools"
          "rust-analyzer"
        ];
      };
      go = mkWelcomeText {
        path = ./go;
        name = "Go Template";
        description = ''
          A basic go application template.
        '';
        buildTools = [
          "go tools"
          "gopls"
        ];
      };
      dotnet = mkWelcomeText {
        path = ./dotnet;
        name = "Dotnet Template";
        description = ''
          A basic Dotnet application template.
        '';
        buildTools = [
          "All essential dotnet tools"
          "asp.net runtime"
          "omnisharp"
        ];
      };
      bevy = mkWelcomeText {
        path = ./bevy;
        name = "Rust bevy Template";
        description = ''
          A basic rust application template with a package build.
        '';
        buildTools = [
          "All essential rust tools"
          "rust-analyzer"
        ];
      };
      node = mkWelcomeText {
        path = ./node;
        name = "Nodejs Template";
        description = ''
          A basic nodejs application template with corepack.
        '';
        buildTools = [
          "All essential nodejs tools"
          "rust-analyzer"
        ];
      };
    };
  };
}
