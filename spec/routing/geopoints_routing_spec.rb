# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GeopointsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/geopoints').to route_to('geopoints#create')
    end
  end
end
