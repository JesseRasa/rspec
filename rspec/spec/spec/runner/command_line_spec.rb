require 'stringio'
context "CommandLine" do
  specify "should run directory" do
    file = File.dirname(__FILE__) + '/../../../examples'
    err = StringIO.new
    out = StringIO.new
    Spec::Runner::CommandLine.run([file], err, out, false, true)
    
    out.rewind
    out.read.should =~ /62 examples, 0 failures/n
  end

  specify "should run file" do
    file = File.dirname(__FILE__) + '/../../../examples/io_processor_spec.rb'
    err = StringIO.new
    out = StringIO.new
    Spec::Runner::CommandLine.run([file], err, out, false, true)
    
    out.rewind
    out.read.should =~ /2 examples, 0 failures/n
  end

  specify "should raise when file does not exist" do
    file = File.dirname(__FILE__) + '/doesntexist'
    err = StringIO.new
    out = StringIO.new

    lambda {
      Spec::Runner::CommandLine.run([file], err, out, false, true)
    }.should raise_error
  end
end