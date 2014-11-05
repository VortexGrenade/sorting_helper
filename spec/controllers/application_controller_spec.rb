require 'spec_helper'
require 'sorting_helper'

describe ApplicationController, type: [:controller, :request] do
  describe '#sorting_column' do
    it 'returns column name without direction prefix' do
      controller.params[:sort] = '-column'
      expect(controller.sorting_column).to eq('column')
    end

    it 'returns nil if sort is not specified' do
      expect(controller.sorting_column).to eq(nil)
    end
  end

  describe '#sorting_direction' do
    it 'returns direction type based on column prefix' do
      controller.params[:sort] = '-column'
      expect(controller.sorting_direction).to eq(:desc)

      controller.params[:sort] = 'column'
      expect(controller.sorting_direction).to eq(:asc)
    end

    it 'returns nil if sort is not specified' do
      expect(controller.sorting_direction).to eq(nil)
    end
  end
end
