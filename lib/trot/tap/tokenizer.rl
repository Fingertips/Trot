module Trot
  module Tap
    class Tokenizer
      
      %%{
        machine tap_13_tokenizer;
        
        action mark { mark = p }
        action version { tokenizer.handle_version(data, mark, p) }
        
        CRLF       = "\n";
        SP         = 32;
        
        version_number   = (digit+) >mark %version;
        version          = "TAP version " version_number;
        
        main := version;
      }%%
      
      %% write data;
      
      attr_accessor :data, :mark
      attr_accessor :stream
      attr_accessor :done
      
      def initialize(stream)
        self.stream = stream
        self.done = false
      end
      
      def self._parse(tokenizer, data)
        eof  = data.length
        data = data.unpack("c*") if data.is_a?(String)
        %% write init;
        %% write exec;
      end
      
      def parse(data)
        self.class._parse(self, data)
      end
      
      def done!
        self.done = true
      end
      
      def handle_version(data, mark, pointer)
        stream.version = Integer(self.class.join(data, mark, pointer))
      end
      
      def self.join(data, mark, pointer)
        data[mark..pointer].pack('C*').strip
      end
    end
  end
end