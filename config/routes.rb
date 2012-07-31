PollsterJy::Application.routes.draw do


 root :to => "polls#index"
 resources :polls, :except => :edit do
   resource :responses, :only => [:show, :new, :create]
   resources :questions do
     resources :answers
   end
 end

 match "/:edit_slug" => 'polls#edit'


end
