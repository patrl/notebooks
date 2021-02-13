let
  sources = import ./nix/sources.nix;
  jupyter = import sources.jupyter {};

  iHaskell = jupyter.kernels.iHaskellWith {
    name = "haskell";
    packages = p: with p; [ containers semilattices set-monad bifunctors ];  
    extraIHaskellFlags = "--codemirror Haskell";
  };

  jupyterEnvironment =
    jupyter.jupyterlabWith {
      kernels = [ iHaskell ];
    };
in
  jupyterEnvironment.env
