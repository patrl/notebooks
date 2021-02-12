let
  sources = import ./nix/sources.nix;
  jupyter = import sources.jupyter {};

  iHaskell = jupyter.kernels.iHaskellWith {
    name = "haskell";
    packages = p: with p; [ containers ];
  };

  jupyterEnvironment =
    jupyter.jupyterlabWith {
      kernels = [ iHaskell ];
      # directory = ./jupyterlab;
    };
in
  jupyterEnvironment.env
