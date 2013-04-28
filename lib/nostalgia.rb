require 'active_record'
require "nostalgia/version"

module Nostalgia
  
  def self.included(base)
    base.send :after_save, :remember_nostalgia_changes
  end

  def nostalgia
    @nostalgia || changes
  end

  private

  def remember_nostalgia_changes
    @nostalgia = changes.dup
  end

end
