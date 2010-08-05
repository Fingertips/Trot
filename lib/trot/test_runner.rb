require 'test/unit/ui/testrunnermediator'
require 'test/unit/ui/testrunnerutilities'

class Trot
  class TestRunner
    extend Test::Unit::UI::TestRunnerUtilities
    include Test::Unit::UI
    
    def initialize(suite, output_level=NORMAL, io=STDOUT)
      @suite = suite.respond_to?(:suite) ? suite.suite : suite
      @output_level = output_level
      @io = io
      @already_outputted = false
      @faults = []
    end
    
    def start
      setup_mediator
      attach_to_mediator
      start_mediator
    end
    
    private
    
    def setup_mediator
      @mediator = TestRunnerMediator.new(@suite)
    end
        
    def attach_to_mediator
      @mediator.add_listener(Test::Unit::TestResult::FAULT, &method(:add_fault))
      @mediator.add_listener(TestRunnerMediator::STARTED, &method(:started))
      @mediator.add_listener(TestRunnerMediator::FINISHED, &method(:finished))
      @mediator.add_listener(Test::Unit::TestCase::STARTED, &method(:test_started))
      @mediator.add_listener(Test::Unit::TestCase::FINISHED, &method(:test_finished))
    end
    
    def start_mediator
      @mediator.run_suite
    end
    
    def add_fault(fault)
      @faults << fault
      output_single(fault.single_character_display, PROGRESS_ONLY)
      @already_outputted = true
    end
    
    def started(result)
      @result = result
      output("Started")
    end
    
    def finished(elapsed_time)
      nl
      output("Finished in #{elapsed_time} seconds.")
      @faults.each_with_index do |fault, index|
        nl
        output("%3d) %s" % [index + 1, fault.long_display])
      end
      nl
      output(@result)
    end
    
    def test_started(name)
      output_single(name + ": ", VERBOSE)
    end
    
    def test_finished(name)
      output_single(".", PROGRESS_ONLY) unless (@already_outputted)
      nl(VERBOSE)
      @already_outputted = false
    end
    
    def nl(level=NORMAL)
      output("", level)
    end
    
    def output(something, level=NORMAL)
      @io.puts(something) if (output?(level))
      @io.flush
    end
    
    def output_single(something, level=NORMAL)
      @io.write(something) if (output?(level))
      @io.flush
    end
    
    def output?(level)
      level <= @output_level
    end
  end
end

if __FILE__ == $0
  Trot::TestRunner.start_command_line_test
end
