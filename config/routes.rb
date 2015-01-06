Rails.application.routes.draw do
  root 'home#index'

  match ':trap_id' => 'trapped_requests#create', via: [:get, :post, :patch, :put, :delete]
  get ':trap_id/requests' => 'trapped_requests#index'
  get ':trap_id/requests/:id' => 'trapped_requests#show', as: :show_trapped_request
end
