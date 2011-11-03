Buddylist::Application.routes.draw do

  root to: "newsfeeds#view"

  devise_for :users

  # Users
  get     'users/search(.format)' => 'users#search',                    as: :search_user
  get     'users/:user_id(.:format)' => 'users#view',                   as: :user

  # Posts
  post    'status/create' => 'statusPosts#create',                      as: :create_status_post
  get     'status/:post_id(.:format)' => 'statusPosts#view',            as: :status_post

  # Comments
  get     'comments/view/:comment_id(.:format)' => 'comments#view',     as: :comment
  post    'comments/create' => 'comments#create',                       as: :create_comment

  # Likes
  post    'likes/create' => 'likes#create',                             as: :create_like
  delete  'likes/destroy/:likable_id' => 'likes#destroy',               as: :destroy_like

  # Relationships
  post    'relationships/create_friend/:user_id' => 'relationships#create_friend',     as: :create_friend
  delete  'relationships/destroy_friend/:user_id' => 'relationships#destroy_friend',   as: :destroy_friend

  # Notifications
  get     'notifications/' => 'notifications#index',                    as: :notification
  get     'notifications/create' => 'notifications#create'

  # Misc. tests
  get 'test/:action' => 'test#'

end
