Rails.application.routes.draw do
  get '/', to: 'application#index', as: :root
end
