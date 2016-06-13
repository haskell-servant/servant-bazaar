`servant-bazaar` implements a servant API combinator called `Bazaar`. That combinator is not useful for anything. The package merely exists to illustrate how you might want to publish servant combinators independently of the core servant packages. Specifically it illustrates how to create a package while letting your users pick which combination of servant interpretations (e.g. `servant-server`, `servant-client`, `servant-swagger`) they want to use and therefore depend on. This package then doesn't introduce any unwanted dependencies on interpretations that are not used.

This package defines three cabal flags:

- `with-servant-server` -- enables support for `servant-server` and switches on the cabal dependency.
- `with-servant-client` -- enables support for `servant-client` and switches on the cabal dependency.
- `with-servant-swagger` -- enables support for `servant-swagger` and switches on the cabal dependency.

Other interpretations can be easily added following the same pattern.

(This is of course just one way to package a combinator and should be taken as a suggestion.)
