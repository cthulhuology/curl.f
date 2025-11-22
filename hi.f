{ ====================================================================
Extend SwiftForth

Copyright 2008   FORTH, Inc.

This is the file loaded by the HI command to extend the SwiftForth
environment.
==================================================================== }

\ --------------------------------------------------------------------
\ Required extensions

INCLUDE %SwiftForth/src/ide/errmessages                 \ The basis for error handling
INCLUDE %SwiftForth/src/ide/encapsulate                 \ Simple vocabulary management
INCLUDE %SwiftForth/src/ide/preamble                    \ Common support
INCLUDE %SwiftForth/src/ide/recognizers                 \ Recognizer extensions
INCLUDE %SwiftForth/src/arch/x64/ide/asm                \ Opcode assembler
INCLUDE %SwiftForth/src/ide/assembler                   \ Assembler access
INCLUDE %SwiftForth/src/ide/optimizer                   \ Optimizing compiler
INCLUDE %SwiftForth/src/arch/x64/ide/patterns           \ Optimizer rules
INCLUDE %SwiftForth/src/arch/x64/ide/swoopopt           \ Optimization for SWOOP
/OPTIMIZER

\ --------------------------------------------------------------------
\ Platform-specific

: LIBEXT ( -- addr len )   S" .so" ;

\ --------------------------------------------------------------------
\ Extensions

INCLUDE %SwiftForth/src/ide/tools                       \ Programmer tools
\ INCLUDE %SwiftForth/src/ide/struct                      \ Standard Forth structures
INCLUDE %SwiftForth/src/ide/prune                       \ Dictionary management
INCLUDE %SwiftForth/src/ide/aswoop                      \ Object oriented programming
INCLUDE %SwiftForth/src/arch/x64/ide/locals             \ Variables and objects on the return stack
INCLUDE %SwiftForth/src/ide/locals                      \ Variables and objects on the return stack
INCLUDE %SwiftForth/src/ide/buffio                      \ Buffered io personality
INCLUDE %SwiftForth/src/arch/x64/ide/decode             \ Disassembler/decompiler
INCLUDE %SwiftForth/src/ide/traverse                    \ Traverse wordlists
INCLUDE %SwiftForth/src/ide/strings                     \ Extended string functions
\ INCLUDE %SwiftForth/src/arch/x64/ide/fpmath-fpu         \ Floating-point
\ INCLUDE %SwiftForth/src/ide/fpmath-fpu                  \ Floating-point
\ INCLUDE %SwiftForth/src/ide/values                      \ Value OOP extension
INCLUDE %SwiftForth/src/ide/fileviewer                  \ View lines of a file
INCLUDE %SwiftForth/src/ide/locate                      \ Locate source code
INCLUDE %SwiftForth/src/ide/vocabularies                \ Vocabularies, wordlist management
\ INCLUDE %SwiftForth/src/arch/x64/ide/linux/exception-map  \ Signal context map
\ INCLUDE %SwiftForth/src/arch/x64/ide/exception          \ Signal display
\ INCLUDE %SwiftForth/src/ide/words                       \ Dictionary visibility
INCLUDE %SwiftForth/src/ide/common/xref                 \ Cross reference support
INCLUDE %SwiftForth/src/ide/xref                        \ Cross reference utility
INCLUDE %SwiftForth/src/ide/imports                     \ Argument parsing for external library calls
INCLUDE %SwiftForth/src/arch/x64/ide/common/extern      \ Inlined library calls
INCLUDE %SwiftForth/src/ide/common/imports              \ Import functions from external libraries
INCLUDE %SwiftForth/src/ide/xlibrary                    \ Cross-platform libraries
INCLUDE %SwiftForth/src/arch/x64/ide/common/callback    \ Callback wrapper
\ INCLUDE %SwiftForth/src/ide/linux/sigcont               \ SIGCONT handler

LIBRARY libc.so.6
\ INCLUDE %SwiftForth/src/ide/common/directory            \ Directory operators

\ INCLUDE %SwiftForth/src/ide/verbose                     \ Monitor progress during include

\ LIBRARY librt.so.1
\ INCLUDE %SwiftForth/src/ide/linux/timer                 \ System timer
\ INCLUDE %SwiftForth/src/ide/common/timer                \ Timing functions

\ LIBRARY libc.so.6
\ INCLUDE %SwiftForth/src/ide/linux/timedate              \ System time/date
\ INCLUDE %SwiftForth/src/ide/common/calendar             \ Date and time
\ INCLUDE %SwiftForth/src/ide/common/keymap               \ Extended key code constants
\ INCLUDE %SwiftForth/src/ide/common/keydecode            \ Extended key decoding
\ INCLUDE %SwiftForth/src/ide/common/editline             \ Edited line input

\ LIBRARY libc.so.6
\ INCLUDE %SwiftForth/src/ide/common/shell                \ Shell interface
\ INCLUDE %SwiftForth/src/ide/common/editor               \ External editor interface
\ INCLUDE %SwiftForth/src/ide/options                     \ Optional packages; load only once
\ INCLUDE %SwiftForth/src/ide/linux/requires              \ Load lib source
\ INCLUDE %SwiftForth/src/ide/envq                        \ ANS environment queries

\ LIBRARY libpthread.so.0
\ INCLUDE %SwiftForth/src/arch/x64/ide/tasking            \ Tasking primitive
\ INCLUDE %SwiftForth/src/arch/x64/ide/common/tasking     \ Tasking primitive
\ INCLUDE %SwiftForth/src/ide/common/tasking              \ Multi-threaded multitasking
\ INCLUDE %SwiftForth/src/ide/tasking                     \ Common multitasking support
INCLUDE %SwiftForth/src/ide/loader                      \ Loader tools
INCLUDE %SwiftForth/src/arch/x64/ide/linux/loader       \ Linux ELF loader structures
INCLUDE %SwiftForth/src/arch/x64/ide/linux/sf64-loader  \ Loader header image
INCLUDE %SwiftForth/src/ide/linux/save                  \ Save turnkey image

{ --------------------------------------------------------------------
Wrap up system for turnkey save
-------------------------------------------------------------------- }

INCLUDE %SwiftForth/src/ide/common/startup
-? : HI ( -- )   ." Already loaded" ;

ONLY FORTH DEFINITIONS  GILD

{ --------------------------------------------------------------------
Alert to redefines
-------------------------------------------------------------------- }

OBSCURED @ [IF]

BRIGHT
CR OBSCURED ? .( definitions were hidden, no program saved.)
NORMAL
ABORT

[THEN]
