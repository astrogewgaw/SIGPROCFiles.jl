<div align="center" style="font-family:JetBrainsMono Nerd Font">
<h1><code>SIGPROCFiles</code></h1>
<h4><i>I/O for SIGPROC Filterbank files.</i></h4>
<br/>

<div align="justify">

This package allows one to read/write SIGPROC filterbank files. These files are used to store intensity data, typically encountered in observations of pulsars and transients (such as **F**ast **R**adio **B**ursts (FRBs) or **R**otational **RA**adio **T**ransients (RRATs)), via radio telescopes. The data has two dimensions: frequency and time. The following features are planned/supported:

- [X] Support for 8/16/32-bit files.
- [ ] Use arrays with support for metadata.
- [ ] Use arrays with dimensional information.
- [X] Support for 1/2/4-bit files (via [**`PackedIntegers.jl`**][PI]).
- [ ] Memory mapping, for files too large to be read directly into memory.

### Installation

Installing the package is as easy as:

```julia
] add SIGPROCFiles
```

### Usage

Using the package should be as easy as:

```julia
using SIGPROCFiles
```

</div>
</div>

[PI]: https://github.com/astrogewgaw/PackedIntegers.jl
