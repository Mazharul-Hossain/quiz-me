Rails.application.routes.draw do
  get 'welcome', to: 'static_pages#welcome', as: 'welcome'
  get 'about', to: 'static_pages#about', as: 'about'
  get 'contact', to: 'static_pages#contact', as: 'contact' 

  post 'contact', to: 'static_pages#leave_feedback', as: 'leave_feedback'

  # get 'mc_questions', to: 'mc_questions#index', as: 'mc_questions'  
  # nested index
  get 'quizzes/:id/mc_questions', to: 'quiz_mc_questions#index', as: 'quiz_mc_questions' 

  get 'mc_questions/new', to: 'mc_questions#new', as: 'new_mc_question' # create new
  post 'mc_questions',    to: 'mc_questions#create'                        # create new
  
  get   'mc_questions/:id/edit',  to: 'mc_questions#edit', as: 'edit_mc_question' # edit
  patch 'mc_questions/:id',       to: 'mc_questions#update' # update (as needed)
  put   'mc_questions/:id',       to: 'mc_questions#update' # update (full replacement)

  get 'mc_questions/:id', to: 'mc_questions#show', as: 'mc_question' # show

  delete 'mc_questions/:id', to: 'mc_questions#destroy' # destroy

  #=============Quiz==================================
  get 'quizzes', to: 'quizzes#index', as: 'quizzes'  

  get 'quizzes/new', to: 'quizzes#new', as: 'new_quiz' # create new
  post 'quizzes',    to: 'quizzes#create'                        # create new
  
  get   'quizzes/:id/edit',  to: 'quizzes#edit', as: 'edit_quiz' # edit
  patch 'quizzes/:id',       to: 'quizzes#update' # update (as needed)
  put   'quizzes/:id',       to: 'quizzes#update' # update (full replacement)

  get 'quizzes/:id', to: 'quizzes#show', as: 'quiz' # show

  delete 'quizzes/:id', to: 'quizzes#destroy' # destroy

  # root to: redirect('/welcome', status: 302)

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
