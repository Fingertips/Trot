class OptionParser
  def self.parse(argv)
    return [{},[]] if argv.empty?
    
    options  = {}
    rest     = []
    switch   = nil
    
    for value in argv
      if value[0] == 45
        switch = value.slice((value[1] == 45 ? 2 : 1)..-1)
        options[switch] ||= nil
      else
        if switch
          if options[switch].nil?
            options[switch] = value
          elsif options[switch].kind_of?(Array)
            options[switch] << value
          else
            options[switch] = [options[switch], value]
          end
          switch = nil
        else
          rest << value
        end
      end
    end
    
    [options, rest]
  end
end