# frozen_string_literal: true

Rails.application.routes.draw do
  resources :noodles, only: [:create]
  resources :geopoints, only: [:create]
end
