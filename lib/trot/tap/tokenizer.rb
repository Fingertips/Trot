
# line 1 "lib/trot/tap/tokenizer.rl"
module Trot
  module Tap
    class Tokenizer
      
      
# line 18 "lib/trot/tap/tokenizer.rl"

      
      
# line 13 "lib/trot/tap/tokenizer.rb"
class << self
	attr_accessor :_tap_13_tokenizer_actions
	private :_tap_13_tokenizer_actions, :_tap_13_tokenizer_actions=
end
self._tap_13_tokenizer_actions = [
	0, 1, 0, 1, 1
]

class << self
	attr_accessor :_tap_13_tokenizer_key_offsets
	private :_tap_13_tokenizer_key_offsets, :_tap_13_tokenizer_key_offsets=
end
self._tap_13_tokenizer_key_offsets = [
	0, 0, 1, 2, 3, 4, 5, 6, 
	7, 8, 9, 10, 11, 12, 14
]

class << self
	attr_accessor :_tap_13_tokenizer_trans_keys
	private :_tap_13_tokenizer_trans_keys, :_tap_13_tokenizer_trans_keys=
end
self._tap_13_tokenizer_trans_keys = [
	84, 65, 80, 32, 118, 101, 114, 115, 
	105, 111, 110, 32, 48, 57, 48, 57, 
	0
]

class << self
	attr_accessor :_tap_13_tokenizer_single_lengths
	private :_tap_13_tokenizer_single_lengths, :_tap_13_tokenizer_single_lengths=
end
self._tap_13_tokenizer_single_lengths = [
	0, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 0, 0
]

class << self
	attr_accessor :_tap_13_tokenizer_range_lengths
	private :_tap_13_tokenizer_range_lengths, :_tap_13_tokenizer_range_lengths=
end
self._tap_13_tokenizer_range_lengths = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 1, 1
]

class << self
	attr_accessor :_tap_13_tokenizer_index_offsets
	private :_tap_13_tokenizer_index_offsets, :_tap_13_tokenizer_index_offsets=
end
self._tap_13_tokenizer_index_offsets = [
	0, 0, 2, 4, 6, 8, 10, 12, 
	14, 16, 18, 20, 22, 24, 26
]

class << self
	attr_accessor :_tap_13_tokenizer_trans_targs
	private :_tap_13_tokenizer_trans_targs, :_tap_13_tokenizer_trans_targs=
end
self._tap_13_tokenizer_trans_targs = [
	2, 0, 3, 0, 4, 0, 5, 0, 
	6, 0, 7, 0, 8, 0, 9, 0, 
	10, 0, 11, 0, 12, 0, 13, 0, 
	14, 0, 14, 0, 0
]

class << self
	attr_accessor :_tap_13_tokenizer_trans_actions
	private :_tap_13_tokenizer_trans_actions, :_tap_13_tokenizer_trans_actions=
end
self._tap_13_tokenizer_trans_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	1, 0, 0, 0, 0
]

class << self
	attr_accessor :_tap_13_tokenizer_eof_actions
	private :_tap_13_tokenizer_eof_actions, :_tap_13_tokenizer_eof_actions=
end
self._tap_13_tokenizer_eof_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 3
]

class << self
	attr_accessor :tap_13_tokenizer_start
end
self.tap_13_tokenizer_start = 1;
class << self
	attr_accessor :tap_13_tokenizer_first_final
end
self.tap_13_tokenizer_first_final = 14;
class << self
	attr_accessor :tap_13_tokenizer_error
end
self.tap_13_tokenizer_error = 0;

class << self
	attr_accessor :tap_13_tokenizer_en_main
end
self.tap_13_tokenizer_en_main = 1;


# line 21 "lib/trot/tap/tokenizer.rl"
      
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
        
# line 133 "lib/trot/tap/tokenizer.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = tap_13_tokenizer_start
end

# line 35 "lib/trot/tap/tokenizer.rl"
        
# line 142 "lib/trot/tap/tokenizer.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_keys = _tap_13_tokenizer_key_offsets[cs]
	_trans = _tap_13_tokenizer_index_offsets[cs]
	_klen = _tap_13_tokenizer_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p] < _tap_13_tokenizer_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p] > _tap_13_tokenizer_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _tap_13_tokenizer_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p] < _tap_13_tokenizer_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p] > _tap_13_tokenizer_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	cs = _tap_13_tokenizer_trans_targs[_trans]
	if _tap_13_tokenizer_trans_actions[_trans] != 0
		_acts = _tap_13_tokenizer_trans_actions[_trans]
		_nacts = _tap_13_tokenizer_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _tap_13_tokenizer_actions[_acts - 1]
when 0 then
# line 8 "lib/trot/tap/tokenizer.rl"
		begin
 mark = p 		end
# line 8 "lib/trot/tap/tokenizer.rl"
# line 227 "lib/trot/tap/tokenizer.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	__acts = _tap_13_tokenizer_eof_actions[cs]
	__nacts =  _tap_13_tokenizer_actions[__acts]
	__acts += 1
	while __nacts > 0
		__nacts -= 1
		__acts += 1
		case _tap_13_tokenizer_actions[__acts - 1]
when 1 then
# line 9 "lib/trot/tap/tokenizer.rl"
		begin
 tokenizer.handle_version(data, mark, p) 		end
# line 9 "lib/trot/tap/tokenizer.rl"
# line 260 "lib/trot/tap/tokenizer.rb"
		end # eof action switch
	end
	if _trigger_goto
		next
	end
end
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 36 "lib/trot/tap/tokenizer.rl"
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