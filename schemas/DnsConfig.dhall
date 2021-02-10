{ Type = ../types/DnsConfig.dhall
, default =
  { servers = None (List Text)
  , searches = None (List Text)
  , options = None (List Text)
  }
}
