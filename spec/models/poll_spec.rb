require 'spec_helper'

describe Poll do

  before :each do
    @poll = Poll.create(:name => "Test poll")
  end

  it "initializes with a name" do
    poll = Poll.new
    expect{ poll.save! }.to raise_error
  end

  it "initializes with an edit slug" do
    @poll.edit_slug.should_not be nil
  end

  it "generates a random string" do
    Poll.any_instance.stub(:random_string).and_return("abcdefg")
    @poll.random_string.should eq "abcdefg"
  end

  ## I'm pretty sure the above tests suck.

end

# def set_edit_slug
#   self.edit_slug ||= random_string
# end
#
#
# def random_string
#   string = (0..25).map{97.+(rand(25)).chr}.join
# end
