# This is a sample class to demonstrate some ruby guidelines
#
class MyClass

  # Always comment public methods. Add blank line at the end of the command
  #
  def self.class_method(arg1, arg2='default_value')
    case arg1
    when 'some value'
      return do_something
    when 'other value'
      return nil
    else
      raise Exception
    end
  end

  # Do awesome things with arg1.
  # Return great stuff
  #
  def self.another_class_method(arg1)
    if arg1 == 'something' || i_like_bananas
      do_something and do_something_else
    end

    true
  end

  # Return something if some condition is met
  # Return nil otherwise
  #
  def instance_method
    return nil unless condition_met?

    protected_method
  end

  protected

  def protected_method
  end

end

module Specs
  describe MyClass do

    describe "##class_method" do
      context "when arg1 is 'some value'" do
        let(:arg1) { 'some value' }

        before do
          MyClass.stub!(:do_something) { 'something' }
        end

        it "should call do_something" do
          MyClass.should_receive(:do_something)
          MyClass.class_method
        end

        it "should return what do_something returned" do
          MyClass.class_method.should == 'some value'
        end
      end

      context "when arg1 is 'other value'" do
        # ...
      end

    end

    describe "#instance_method" do
    end
  end
end

# Notes on Specs
=begin
  * class method descriptions start with a double #
  * instance method descriptions start with a simple #
  * contexts always start with "when ..."
  * we use let(:variable) rather than before do; @variable = ...; end
  * we never use before { # something on one line }. We rather use
    before do ... end on multiple lines.
=end
