Railsgoat::Application.routes.draw do

get "login" => "sessions#new"
get "signup" => "users#new"
get "logout" => "sessions#destroy"

resources :sessions do

end

resources :users do
  get "account_settings"
end

resources :tutorials do
  collection do 
    get "injection"
    get "xss"
    get "broken_auth"
    get "insecure_dor"
    get "csrf"
    get "misconfig"
    get "crypto"
    get "url_access"
    get "ssl_tls"
    get "redirects"
    get "guard"
  end
end

resources :dashboard do
  collection do 
    get "home"
  end
end

root :to => "sessions#new"

end
