Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'top' => 'books#top'
get 'top1' => 'homes#top'

end
