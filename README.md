# chef-forever

Chef cookbook for running node apps using forever.

## Installation

Easiest way to install this cookbook is to use librarian-chef.

```ruby

cookbook 'forever',
  :git => 'https://github.com/trabian/chef-forever'

```

There are of course many other ways.

## Usage

```ruby

include_recipe "forever"

forever_service "statsd" do
  user 'statsd'
  group 'statsd'
  path "/web/statsd"
  script "stats.js"
  script_options "myConfig.js"
  description "Simple daemon for easy stats aggregation."
  action [ :enable, :start ]
end

```
