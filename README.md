<div align="center">
<h1><code>SIGPROCFiles</code></h1>
<h4><i>I/O for SIGPROC Filterbank files, in Julia.</i></h4>
<br/>

![License][license]
![GitHub Stars][stars]
[![Gitmoji Badge][gitmoji_badge]][gitmoji]

</div>

<div align="justify">

This package allows one to read/write SIGPROC filterbank files. These files are used to store intensity data, typically encountered in observations of pulsars and transients (such as **F**ast **R**adio **B**ursts (FRBs) or **R**otational **RA**adio **T**ransients (RRATs)), via radio telescopes. The data has two dimensions: frequency and time. The following features are planned/supported:

- [X] Support for 8/16/32-bit files.
- [X] Support for 1/2/4-bit files (via [**`PackedIntegers.jl`**][PI]).
- [X] Memory mapping, for files too large to be read directly into memory.

Install it by typing and running:

```julia
] add SIGPROCFiles
```

</div>

[gitmoji]: https://gitmoji.dev
[PI]: https://github.com/astrogewgaw/PackedIntegers.jl
[gitmoji_badge]: https://img.shields.io/badge/gitmoji-%20😜%20😍-FFDD67.svg?style=for-the-badge
[stars]: https://img.shields.io/github/stars/astrogewgaw/SIGPROCFiles.jl?style=for-the-badge
[license]: https://img.shields.io/github/license/astrogewgaw/SIGPROCFiles.jl?style=for-the-badge
