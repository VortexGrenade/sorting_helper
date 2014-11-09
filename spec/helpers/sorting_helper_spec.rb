# coding: utf-8

require 'spec_helper'
require 'sorting_helper'

describe SortingHelper, type: [:helper] do
  before do
    def controller.default_url_options
      { controller: :application }
    end
  end

  describe '#sorting_url' do
    it 'pass reversed sorting url and current direction to given block' do
      controller.params[:sort] = '-column'

      helper.sorting_url(:column) do |url, direction|
        expect(url).to eq('/?sort=column')
        expect(direction).to eq(:desc)
      end

      controller.params[:sort] = 'column'

      helper.sorting_url(:column) do |url, direction|
        expect(url).to eq('/?sort=-column')
        expect(direction).to eq(:asc)
      end
    end

    it 'default direction is asc' do
      helper.sorting_url(:column) do |url, direction|
        expect(url).to eq('/?sort=-column')
        expect(direction).to eq(:asc)
      end
    end
  end

  describe '#sorting_link' do
    it 'generates html link for given column and label' do
      expect(helper.sorting_link(:column, 'label')).to eq('<a href="/?sort=-column">label</a>')
    end

    it 'inverts sorting for current column' do
      controller.params[:sort] = 'column'
      expect(helper.sorting_link(:column, 'label')).to eq('<a href="/?sort=-column">label</a> ▴')

      controller.params[:sort] = '-column'
      expect(helper.sorting_link(:column, 'label')).to eq('<a href="/?sort=column">label</a> ▾')
    end
  end
end
