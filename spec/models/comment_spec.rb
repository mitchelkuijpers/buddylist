require 'spec_helper'

describe Comment do

    it "should not save when there is no text" do
      comment = Comment.new
      comment.save.should == false
    end

    it "should save when there is text specified" do
      comment = Comment.new(text: "some example text.")
      comment.save.should == true
    end

end