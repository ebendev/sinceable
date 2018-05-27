require "sinceable/version"

module Sinceable
  extend ActiveSupport::Concern

  included do
    scope :since, ->(time, column = :created_at) { where(arel_table[column].gteq(time)) }
    scope :until, ->(time, column = :created_at) { where(arel_table[column].lt(time)) }
  end
end

ActiveRecord::Base.send :include, Sinceable
