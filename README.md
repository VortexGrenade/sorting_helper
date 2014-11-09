# SortingHelper

Rails helpers for building "sort by column" links.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sorting_helper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sorting_helper

## Usage

```ruby
# app/controllers/users_controller.rb
def index
  @users = User.order(sorting)
end

...

protected

  def sorting
    column = sorting_column

    if %w[email name].include?(column)
      "#{column} #{sorting_direction}"
    end
  end
```

Example view:
```html
<table>
  <tr>
    <th><%= sorting_link :email, 'Email' %></th>
    <th><%= sorting_link :name, 'Name' %></th>
  </tr>
  <% @users.each do |user| %>
    <tr>
      <td><%= user.email %></td>
      <td><%= user.name %></td>
    </tr>
  <% end %>
</table>
```

## License

Copyright (c) 2014 Okhlopkov Anatoly

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
