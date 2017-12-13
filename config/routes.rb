Rails.application.routes.draw do
  root 'artists#index'

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create', as: 'new_signup'

  get    '/login',   to: 'sessions#new', as: 'login'
  post   '/login',   to: 'sessions#create', as: 'new_login'
  delete '/logout',  to: 'sessions#destroy'

  resources :genres

  resources :profiles, only: [:show, :edit, :update]

  resources :playlists do
    resources :likes, only: [:create, :destroy]
  end

  resources :artists do
    resources :albums do
      resources :songs
    end
  end

  get 'playlists/:id/songs/new', to: 'playlists#playlist_songs', as: 'playlist_songs_new'
  put 'playlists/:id/songs/:song_id/add', to: 'playlists#new_playlist_song', as: 'playlist_songs_edit'
  delete 'playlists/:id/songs/:song_id/destroy', to: 'playlists#destroy_playlist_song'
end
