Then /^I should see comment "([^"]*)"$/ do |comment|
  first('.reactions').should have_content comment
end

When /^I post a comment "([^"]*)" on the status update "([^"]*)"$/ do |comment, status_update|
  status_post = first(".status-post")
  status_post.should have_content status_update
  status_post.fill_in 'comment_message', :with => comment
  status_post.click_on 'Add Comment'
end
When /^"([^"]*)" has a comment "([^"]*)" on my latest status update$/ do |user_name, comment|
  user = User.where( name: user_name).first
  me = User.where( name: 'testing').first
  commentable = StatusPost.where(created_by_id: me.id).limit(1).desc(:_id).first

  comment             = Comment.new message: comment
  comment.created_by  = user
  comment.commentable = commentable
  comment.save
end

When /^I click on delete on my comment$/ do
  pending
end