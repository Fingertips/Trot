require 'option_parser'

module Trot
  autoload :Tap,        'trot/tap'
  autoload :TestRunner, 'trot/test_runner'
  
  def self.run(argv)
    options, argv = OptionParser.parse(argv)
    [options['r']].flatten.compact.each do |testfile|
      load testfile
    end
    
    runner = Test::Unit::AutoRunner.new(false)
    runner.runner = proc do |r|
      require 'trot/test_runner'
      Trot::TestRunner
    end
    runner.run
  end
end