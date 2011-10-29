Buddylist::Application.routes.draw do

  # The priority is based upon order of creation:
  # first created -> highest priority.

  root to: "people#search"

  devise_for :users

  get     'person/search(.format)' => 'people#search',                  as: :search_person
  get     'person/:person_id(.:format)' => 'people#view',               as: :person
  post    'status/create' => 'statusPosts#create',                      as: :create_status_post
  get     'status/:post_id(.:format)' => 'statusPosts#view',            as: :status_post
  get     'comment/view/:comment_id(.:format)' => 'comments#view',      as: :comment
  post    'comment/create' => 'comments#create',                        as: :create_comment
  post    'like/create' => 'likes#create',                              as: :create_like
  delete  'like/destroy/:likable_id' => 'likes#destroy',                as: :destroy_like

end
