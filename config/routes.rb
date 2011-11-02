Buddylist::Application.routes.draw do

  root to: "newsfeeds#view"

  devise_for :users

  # Persons
  get     'person/search(.format)' => 'people#search',                as: :search_person
  get     'person/:person_id(.:format)' => 'people#view',             as: :person

  # Status posts
  post    'status/create' => 'statusPosts#create',                    as: :create_status_post
  get     'status/:post_id(.:format)' => 'statusPosts#view',          as: :status_post

  # Comments
  get     'comment/view/:comment_id(.:format)' => 'comments#view',    as: :comment
  post    'comment/create' => 'comments#create',                      as: :create_comment

  # Likes
  post    'like/create' => 'likes#create',                            as: :create_like
  delete  'like/destroy/:likable_id' => 'likes#destroy',              as: :destroy_like

  # Relationships
  post    'relationship/create_friend/:person_id' => 'relationships#create_friend',     as: :create_friend
  delete  'relationship/destroy_friend/:person_id' => 'relationships#destroy_friend',   as: :destroy_friend

  # Notifications
  get     'notifications/' => 'notifications#index',                  as: :notification
  get     'notifications/create' => 'notifications#create'

  # Misc. tests
  get 'test/:action' => 'test#'

end
