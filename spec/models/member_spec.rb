require File.dirname(__FILE__) + '/../spec_helper'

describe Member do
  before(:each) do
    @member = Member.new
  end

  it "should be invalid without a name" do
    @member.should_not_be_valid
    @member.errors.on(:name).should_equal "is required" 
    @member.name = 'sunil'
    @member.should_be_valid
  end
end
