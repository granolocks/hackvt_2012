# encoding: utf-8

module Wintermute
  class User
    include DataMapper::Resource

    property :id,     Serial
    property :name,   String
  end
end

