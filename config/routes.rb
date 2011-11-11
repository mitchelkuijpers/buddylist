Buddylist::Application.routes.draw do

  root to: "dashboard#index"

  devise_for :users

  # Users
  get     'users/search(.format)' => 'users#search',                      as: :search_user
  get     'users/:user_id(.:format)' => 'users#view',                     as: :user
  get     'users/:user_id/friends(.:format)' => 'users#search_friends',   as: :user_friends

  # Posts
  post    'status/create' => 'statusPosts#create',                        as: :create_status_post
  get     'status/:post_id(.:format)' => 'statusPosts#view',              as: :status_post
  delete  'status/:post_id/destroy(.:format)' => 'statusPosts#destroy',   as: :destroy_status_post

  # Videos
  post    'videos/create' => 'videoPosts#create',                         as: :create_video_post
  get     'videos/:video_id(.:format)' => 'videoPosts#view',              as: :video_post
  delete  'videos/:video_id/destroy(.:format)' => 'videoPosts#destroy',   as: :destroy_video_post

  # Comments
  post    'comments/create' => 'comments#create',                         as: :create_comment
  get     'comments/:comment_id(.:format)' => 'comments#view',            as: :comment
  delete  'comments/:comment_id/destroy' => 'comments#destroy',           as: :destroy_comment

  # Likes
  post    'likes/create' => 'likes#create',                               as: :create_like
  delete  'likes/destroy/:likable_id' => 'likes#destroy',                 as: :destroy_like

  # Relationships
  post    'relationships/create_friend/:user_id' => 'relationships#create_friend',      as: :create_friend
  delete  'relationships/destroy_friend/:user_id' => 'relationships#destroy_friend',    as: :destroy_friend
  get     'relationships/friend_requests' => 'relationships#friend_requests',           as: :friend_requests

  # Newsfeeds
  get     'newsfeed' => 'newsfeeds#view',                                 as: :newsfeed

  # Notifications
  get     'notifications/' => 'notifications#index',                              as: :notifications
  delete  'notifications/' => 'notifications#destroy',                            as: :destroy_notification

  # Albums
  get     'users/:user_id/albums' => 'albums#index',                      as: :albums
  get     'users/:user_id/albums/new' => 'albums#new',                    as: :new_album
  post    'albums/create' => 'albums#create',                             as: :create_album
  get     'albums/:album_id' => 'albums#view',                            as: :album
  delete  'albums/:album_id/delete' => 'albums#destroy',                  as: :destroy_album

  # Photos
  get     'photos/:photo_id' => 'photos#view',                            as: :photo
  get     'albums/:album_id/photos/new' => 'photos#new',                  as: :new_photo
  post    'photos/create' => 'photos#create',                             as: :create_photo
  delete  'photos/:photo_id/destroy' => 'photos#destroy',                 as: :destroy_photo
  get     'photos/:photo_id/set_profile' => 'photos#set_profile',         as: :set_profile_photo



  # Misc. tests
  get 'test/:action' => 'test#'

end
