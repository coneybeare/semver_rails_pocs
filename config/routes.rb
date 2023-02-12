SemVerRegexp = /(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][a-zA-Z0-9-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][a-zA-Z0-9-]*))*))?(?:\+([0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*))?/

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :approach_a do
      get ':version/things/:id', to: 'things#show', constraints: { version: SemVerRegexp }
    end

    namespace :approach_b do
      get ':version/things/:id', to: 'things#show', constraints: { version: SemVerRegexp }
    end

    namespace :approach_c do
      get ':version/things/:id', to: 'things#show', constraints: { version: SemVerRegexp }
    end

    namespace :approach_d do
      get ':version/things/:id', to: 'things#show', constraints: { version: SemVerRegexp }
    end

    namespace :approach_e do
      get ':version/things/:id', to: 'things#show', constraints: { version: SemVerRegexp }
    end

    namespace :approach_f do
      get ':version/things/:id', to: 'things#show', constraints: { version: SemVerRegexp }
    end

    namespace :approach_g do
      scope ':version', constraints: { version: SemVerRegexp } do
        get '/things/:id', to: 'things#show'
      end
    end
  end
end
