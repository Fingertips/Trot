require 'option_parser'

class Trot
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