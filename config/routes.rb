Rails.application.routes.draw do

  devise_for :users
  root to: "quizzes#index"
  resources :quizzes, except:[:index]
  resources :plays, only:[:index, :create] do
    collection do
      post 'anwser'
    end
  end

end
