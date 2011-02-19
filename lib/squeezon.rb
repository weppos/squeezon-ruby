require File.expand_path("../../boot", __FILE__)
require "squeezon/feed"

module Squeezon
  extend self

  # Gets the @cache_store value.
  #
  # Returns a ActiveSupport::Cache::Store if a store has been set,
  # nil otherwise.
  def cache_store
    @cache_store
  end

  # Sets the @cache_store to given store.
  #
  # store - The Symbol :store to set, along with options if any.
  #
  # Returns a ActiveSupport::Cache::Store if a store has been set,
  # nil otherwise.
  def cache_store=(store)
    @cache_store = ActiveSupport::Cache.lookup_store(store)
  end

  # Lazy-initializes and returns the current cache handler.
  # If no store is set, defaults the current store to :file_store.
  #
  # Returns a ActiveSupport::Cache::Store.
  def cache
    if self.cache_store
      self.cache_store
    else
      self.cache_store = :file_store, root.join("tmp").to_s
      self.cache_store
    end
  end

  # Gets a Pathname instance pointing to the root folder
  # of this package (not /lib).
  #
  # Returns a Pathname.
  def root
    @root ||= Pathname.new(File.expand_path("../../", __FILE__))
  end

end
