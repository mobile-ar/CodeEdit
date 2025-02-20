//
//  File.swift
//  
//
//  Created by Marco Carnevali on 22/03/22.
//
import Foundation.NSURL
// swiftlint:disable identifier_name
extension CodeEditor {
    enum Language: String {
        case abnf
        case accesslog
        case actionscript
        case ada
        case angelscript
        case apache
        case applescript
        case arcade
        case cpp
        case arduino
        case armasm
        case xml
        case asciidoc
        case aspectj
        case autohotkey
        case autoit
        case avrasm
        case awk
        case axapta
        case bash
        case basic
        case bnf
        case brainfuck
        case cal
        case capnproto
        case ceylon
        case clean
        case clojure
        case cmake
        case coffeescript
        case coq
        case cos
        case crmsh
        case crystal
        case cs
        case csp
        case css
        case d
        case markdown
        case dart
        case delphi
        case diff
        case django
        case dns
        case dockerfile
        case dos
        case dsconfig
        case dts
        case dust
        case ebnf
        case elixir
        case elm
        case ruby
        case erb
        case erlang
        case excel
        case fix
        case flix
        case fortran
        case fsharp
        case gams
        case gauss
        case gcode
        case gherkin
        case glsl
        case gml
        case go
        case golo
        case gradle
        case groovy
        case haml
        case handlebars
        case haskell
        case haxe
        case hsp
        case htmlbars
        case http
        case hy
        case inform7
        case ini
        case irpf90
        case isbl
        case java
        case javascript
        case json
        case julia
        case kotlin
        case lasso
        case ldif
        case leaf
        case less
        case lisp
        case livecodeserver
        case livescript
        case llvm
        case lsl
        case lua
        case makefile
        case mathematica
        case matlab
        case maxima
        case mel
        case mercury
        case mipsasm
        case mizar
        case perl
        case mojolicious
        case monkey
        case moonscript
        case n1ql
        case nginx
        case nimrod
        case nix
        case nsis
        case objectivec
        case ocaml
        case openscad
        case oxygene
        case parser3
        case pf
        case pgsql
        case php
        case plaintext
        case pony
        case powershell
        case processing
        case profile
        case prolog
        case properties
        case protobuf
        case puppet
        case purebasic
        case python
        case q
        case qml
        case r
        case reasonml
        case rib
        case roboconf
        case routeros
        case rsl
        case ruleslanguage
        case rust
        case sas
        case scala
        case scheme
        case scilab
        case scss
        case shell
        case smali
        case smalltalk
        case sml
        case sqf
        case sql
        case stan
        case stata
        case step21
        case stylus
        case subunit
        case swift
        case taggerscript
        case yaml
        case tap
        case tcl
        case tex
        case thrift
        case tp
        case twig
        case typescript
        case vala
        case vbnet
        case vbscript
        case verilog
        case vhdl
        case vim
        case x86asm
        case xl
        case xquery
        case zephir
        case clojureRepl = "clojure-repl"
        case vbscriptHtml = "vbscript-html"
        case juliaRepl = "julia-repl"
        case jbossCli = "jboss-cli"
        case erlangRepl = "erlang-repl"
        case oneC = "1c"

        init?(url: URL) {
            let fileExtension = url.pathExtension.lowercased()
            switch fileExtension {
            case "js": self = .javascript
            case "tf": self = .typescript
            case "md": self = .markdown
            case "py": self = .python
            case "bat": self = .dos
            case "cxx", "h", "hpp", "hxx": self = .cpp
            case "scpt", "scptd", "applescript": self = .applescript
            case "pl": self = .perl
            case "txt": self = .plaintext
            default: self.init(rawValue: fileExtension)
            }
        }
    }
}
