require 'spec_helper'

describe Person do

    it "should not save when there is no name specified" do
      person = Person.new
      person.save.should == false
    end

    it "should save when there is a name specified" do
      person = Person.new(name: "testName", password: "password", email: "test@gmail.com")
      person.save.should == true
    end

end
