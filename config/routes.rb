Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'doctors/working_hours', to: 'doctors#working_hours'
      get 'doctors/available_slots', to: 'doctors#available_slots'

      put 'appointments/book_visit', to: 'appointments#create'
      put 'appointments/update_visit', to: 'appointments#update'
      delete 'appointments/remove_visit', to: 'appointments#destroy'
    end
  end
end
