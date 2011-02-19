require "spec_helper"

describe Squeezon do

  describe ".root" do
    it "returns a Pathname" do
      Squeezon.root.should be_instance_of(Pathname)
    end

    it "computes the expanded path to the library root" do
      Squeezon.root.to_s.should == File.expand_path("../../../", __FILE__)
    end
  end


  describe ".cache" do
    it "returns the cache handler" do
      Squeezon.cache.should be_kind_of(ActiveSupport::Cache::Store)

      store = ActiveSupport::Cache::MemoryStore.new
      Squeezon.instance_variable_set("@cache_store", store)
      Squeezon.cache.should be_equal(store)

      store = ActiveSupport::Cache::FileStore.new("/")
      Squeezon.instance_variable_set("@cache_store", store)
      Squeezon.cache.should be_equal(store)
    end

    it "defaults the cache handler to :file_store" do
      Squeezon.cache.should be_instance_of(ActiveSupport::Cache::FileStore)
    end
  end

end
