<div align="center">
<h1><code>SIGPROCFiles</code></h1>
<h4><i>I/O for SIGPROC filterbank and time series files, in Julia.</i></h4>
<br/>

![License][license]
![GitHub Stars][stars]
[![Gitmoji Badge][gitmoji_badge]][gitmoji]

</div>

<div align="justify">

This package adds support to load and save [**`SIGPROC`**][sigproc] filterbank (`*.fil`) and time series (`*.tim`) files. These formats are used by the `SIGPROC` library, and are used and supported by a vast number of radio telescopes and libraries. Currently, the following features are already present, or planned for future releases:

- [x] Loading SIGPROC filterbank files.
- [x] Loading SIGPROC time series data.
- [ ] Saving SIGPROC filterbank files.
- [ ] Saving SIGPROC time series data.
- [x] Support for 8/32-bit filterbank and time series data.
- [x] Support for 1/2/4-bit filterbank data (via [**`PackedIntegers.jl`**][PI]).
- [X] Memory mapping, for files too large to be read directly into memory.

Install it by typing and running:

```julia
] add SIGPROCFiles
```

</div>

[gitmoji]: https://gitmoji.dev
[sigproc]: https://sigproc.sourceforge.net
[PI]: https://github.com/astrogewgaw/PackedIntegers.jl
[gitmoji_badge]: https://img.shields.io/badge/gitmoji-%20😜%20😍-FFDD67.svg?style=for-the-badge
[stars]: https://img.shields.io/github/stars/astrogewgaw/SIGPROCFiles.jl?style=for-the-badge
[license]: https://img.shields.io/github/license/astrogewgaw/SIGPROCFiles.jl?style=for-the-badge
