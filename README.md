marvelous_iterator
==================

External iterators in Ruby. Inspired by Wesleys "Design Patterns in Ruby" 

## Installation

Add this line to your application's Gemfile:

    gem 'marvelous_iterator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install marvelous_iterator

## Usage

Example usage (notice, that spaceship operator must works with elements between given arrays):

    def self.merge(mts_schedules_array, mts_bookings_array)
      merged_time_slots = []
      mts_schedules_iterator = SortedArrayIterator.new(mts_schedules_array.flatten)
      mts_bookings_iterator = SortedArrayIterator.new(mts_bookings_array)
      while( mts_schedules_iterator.has_next? and mts_bookings_iterator.has_next? )
        if mts_schedules_iterator.item == mts_bookings_iterator.item
          mts_schedules_iterator.next_item
          merged_time_slots << mts_bookings_iterator.next_item
        elsif mts_schedules_iterator.item < mts_bookings_iterator.item
          merged_time_slots << mts_schedules_iterator.next_item
        else
          merged_time_slots << mts_bookings_iterator.next_item
        end
      end
      # Pick up the leftovers from mts schedules array
      while( mts_schedules_iterator.has_next?)
        merged_time_slots << mts_schedules_iterator.next_item
      end
    # Pick up the leftovers from mts bookings array
    while( mts_bookings_iterator.has_next?)
      merged_time_slots << mts_bookings_iterator.next_item
    end
    dayplans = []
    merged_time_slots.group_by{|ts| ts.start.to_date}.map do |mts|
      dp = DayPlan.new(
        :date => mts[0].to_date,
        :periods => mts[1]
      )
    end
  end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
