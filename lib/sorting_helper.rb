require 'sorting_helper/version'
require 'active_support/all'

module SortingHelper
  def sorting_column
    params[:sort][/^\-?(.+)/, 1] if params[:sort].present?
  end

  def sorting_direction
    params[:sort] =~ /^\-/ ? :desc : :asc if params[:sort].present?
  end

  def sorting_url(column, direction = nil, &blk)
    direction = sorting_direction || :asc

    column = column.to_s
    column.prepend('-') if direction == :asc

    blk.call(url_for(sort: column), direction)
  end

  def sorting_link(column, label)
    sorting_url(column) do |url, direction|
      link = link_to(label, url)

      if column.to_s == sorting_column
        link += direction == :asc ? ' ▴' : ' ▾'
      end

      raw link
    end
  end
end
