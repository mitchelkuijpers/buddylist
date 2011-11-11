class VideoPost  < Post

  # Used for reg exp link_url
  IPV4_PART = /\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]/  # 0-255
  ALNUM = "a".match(/[[:alnum:]]/) ? /[[:alnum:]]/ : /[^\W_]/

  # Properties
  field :link_url, type: String
  field :description, type: String


  # Validation
  validates_presence_of :link_url
  validates_format_of :link_url, with: %r{
    \A
    https?://                                                          # http:// or https://
    ([^\s:@]+:[^\s:@]*@)?                                              # optional username:pw@
    ( ((#{ALNUM}+\.)*xn--)?#{ALNUM}+([-.]#{ALNUM}+)*\.[a-z]{2,6}\.? |  # domain (including Punycode/IDN)...
        #{IPV4_PART}(\.#{IPV4_PART}){3} )                              # or IPv4
    (:\d{1,5})?                                                        # optional port
    ([/?]\S*)?                                                         # optional /whatever or ?whatever
    \Z
    }iux

end