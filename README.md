# Nostalgia

Often I want to evaluate what changed on an object after it has saved and has been transactionally committed.  One use case is enqueuenig a background job when a specific attribute changed.  Typically you should wait until after_commit to enqueue the job.  This ensures that your workers will have access to the updates that were being made inside the transaction. This is a problem because ActiveRecord forgets the changes after_save.  This gem keeps those changes around for later inspection and evaluation.

## Installation

Add this line to your application's Gemfile:

    gem 'nostalgia'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nostalgia

## Usage

    class Model < ActiveRecord::Base
      include Nostalgia
    end

    model = Model.create(:foo => :bar)
    model.nostalgia

    #=> {:foo => [nil,:bar], :id => [nil, 1]}


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
