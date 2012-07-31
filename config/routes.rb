PollsterJy::Application.routes.draw do

 root :to => "polls#index"
 resources :polls, :except => :edit do
   resources :questions do
     resources :answers
   end
 end

 match "/:edit_slug" => 'polls#edit'


end
