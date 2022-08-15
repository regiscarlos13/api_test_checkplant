# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NoodlesController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/noodles').to route_to('noodles#create')
    end
  end
end
