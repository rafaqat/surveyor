class ResponseSet < ActiveRecord::Base
  include Surveyor::Models::ResponseSetMethods
  
  def self.test
    'test'
  end
end
