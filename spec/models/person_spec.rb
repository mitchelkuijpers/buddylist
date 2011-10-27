require 'spec_helper'

describe Person do

    it "should not save when there is not an email, password and a name provided" do
      person = Person.new;
      person.save.should == false
    end

    it "should save when there is an email, password and a name provided" do
      person = Person.new(name: "testName", password: "password", email: "test@gmail.com");
      person.save.should == true
    end

    it "should hash the password" do
      person = Person.new
      person.password= "test"
      person[:password].should_not == "test"
    end

end
