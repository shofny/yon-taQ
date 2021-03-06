Rails.application.routes.draw do

  devise_for :users
  root to: "quizzes#index"
  resources :quizzes, except:[:index]
  resources :users, only:[:show]
  resources :plays, only:[:index, :create] do
    collection do
      post 'anwser'
      get 'result'
    end
  end

end
