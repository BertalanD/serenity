# Patches for llvm on SerenityOS

## `0001-Triple-Add-triple-for-SerenityOS.patch`

Add triple for SerenityOS

### Status
- [ ] Local?
- [x] Should be merged to upstream?
- [ ] Resolves issue(s) with our side of things
- [ ] Hack


## `0002-Driver-Add-support-for-SerenityOS.patch`

Add support for SerenityOS to the Clang driver

### Status
- [ ] Local?
- [x] Should be merged to upstream?
- [ ] Resolves issue(s) with our side of things
- [ ] Hack

## `0003-libc-Add-support-for-SerenityOS.patch`

Add support for SerenityOS to libc++

This commit teaches libc++ about what features are available in our
LibC, namely:
- We do not have locale support, so no-op shims should be used in place
  of the C locale API.
- The number of errno constants defined by us is given by the value of
  the `ELAST` macro.
- Multithreading is implemented though the pthread library.
- Aligned memory allocation is provided by the MSVCRT-like
  `_aligned_{malloc,free}` functions.

Adds a hack for a header not found error when including
`<initializer_list>` inside the SerenityOS kernel.


### Status
- [ ] Local?
- [x] Should be merged to upstream?
- [ ] Resolves issue(s) with our side of things
- [ ] Hack

## `0004-compiler-rt-Build-crtbegin.o-crtend.o-for-SerenityOS.patch`

Build crtbegin.o/crtend.o for SerenityOS

### Status
- [ ] Local?
- [x] Should be merged to upstream?
- [ ] Resolves issue(s) with our side of things
- [ ] Hack

## `0005-Allow-undefined-symbols-for-SerenityOS.patch`

Allow undefined symbols for SerenityOS

Allow undefined symbols in LLVM libraries, which is needed because only
stubs are available for SerenityOS libraries when libc++ and libunwind
are built.

### Status
- [ ] Local?
- [x] Should be merged to upstream?
- [ ] Resolves issue(s) with our side of things
- [ ] Hack

## `0006-Add-update-section.patch`

Backports support for `llvm-objcopy --update-section` used by our toolchain from reviews.llvm.org/D112116.

### Status
- [ ] Local?
- [ ] Should be merged to upstream?
- [ ] Resolves issue(s) with our side of things
- [ ] Hack

## `0007-Reapply-runtimes-Set-more-paths-when-building-runtim.patch`

Backports a build system fix from LLVM trunk.

### Status
- [ ] Local?
- [ ] Should be merged to upstream?
- [ ] Resolves issue(s) with our side of things
- [ ] Hack

## `insert-ifdef-serenity.patch`

This patch adds several defines in order to omit things not supported by SerenityOS.

### Status
- [ ] Local?
- [ ] Should be merged to upstream?
- [X] Resolves issue(s) with our side of things
- [x] Hack

## `remove-version-script.patch`

-Instructs the linker to not build LLVM shared libraries (`libclang.so`, `libLTO.so`, etc.) with
-symbol versioning, which our dynamic linker does not support.

### Status
- [ ] Local?
- [x] Should be merged to upstream?
- [X] Resolves issue(s) with our side of things
- [ ] Hack
