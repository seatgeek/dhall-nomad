# dhall-nomad

This package lets you create nomad job specifications, modularize them, compose
specifications from smaller pieces, template attributes and have them statically
checked for correctness.

## Why

While writing nomad job files using HCL is simple and readable for most, these
files quickly become "cargo-culted": When several teams in an organization are
encouraged to take care of their service deployments, example nomad job files are
copied verbatim without giving much thought to what they mean, making errors made
at the beginning of the process replicate over multiple different job files.

A consequence of copy-pasting example jobs is configuration drift. Whenever you
want to make important changes to all job files, so that they conform to a
specific policy or best-practice for your organization, you have to deal with
manually changing each job file. This process is often done manually as the
tools for mechanically transforming HCL files are lacking.

A common solution to this problem is templating. Using a templating engine, or
using HCL2, can solve some of these issues for simple cases. One problem with
external templating engines is that they are not aware of what a valid nomad job
file is, and therefore it is unergonomic to author and maintain these
specifications with using lots of dynamically generated elements.

Additionally, HCL2 has limitations on what stanzas can be
treated as an expression. For instance, it is not possible to write with HCL2
reusable expressions that can be shared by many job files. There is no concept
of importing a library of custom expressions in HCL2.

The other solution to tis problem is creating a small library or DSL for your
organization that encodes the practices that best work for you. This packages
can be used as the foundation for creating reusable functions or blocks to be
used in the authoring of maintainable job specification files.

## How to use

Some examples on how to compose job files with this package can be found in the
[examples](/examples) folder.

You can import this package from your custom `dhall` files and, for instance,
create a function to create a service stanza that conforms to your organization
standards:

```dhall
let nomad = https://raw.githubusercontent.com/seatgeek/dhall-nomad/v1.0.0/package.dhall

let Port = {name: Text, number: Natural}
in
  \(serviceName: Text) ->
  \(port: Port) ->
     nomad.Service::{
      , name = serviceName
      , tags = Some [ "urlprefix-/${serviceName} strip=/${serviceName}" ]
      , port = Some port.name
      , check = Some
        [ nomad.Check::{
          , name = Some "${serviceName} port alive"
          , type = nomad.Check.CheckType.tcp
          , interval = "10s"
          , timeout = "2s"
          }
        ]
      }
```
