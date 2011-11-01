Buddylist::Application.routes.draw do

  root to: "newsfeeds#index"

  devise_for :users

  # Persons
  get     'persons/search(.format)' => 'people#search',                as: :search_person
  get     'persons/:person_id(.:format)' => 'people#view',             as: :person

  # Posts
  post    'status/create' => 'statusPosts#create',               as: :create_status_post
  get     'status/:post_id(.:format)' => 'statusPosts#view',     as: :status_post

  # Comments
  get     'comments/view/:comment_id(.:format)' => 'comments#view',    as: :comment
  post    'comments/create' => 'comments#create',                      as: :create_comment

  # Likes
  post    'likes/create' => 'likes#create',                            as: :create_like
  delete  'likes/destroy/:likable_id' => 'likes#destroy',              as: :destroy_like

  # Relationships
  post    'relationships/create_friend/:person_id' => 'relationships#create_friend',     as: :create_friend
  delete  'relationships/destroy_friend/:person_id' => 'relationships#destroy_friend',   as: :destroy_friend


  # Misc. tests
  get 'test/:action' => 'test#'

end
