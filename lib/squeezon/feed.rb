require "feedzirra"

module Squeezon

  class Feed

    attr_reader :url, :source

    KEYS_FOR_HEAD   = [:title, :url, :feed_url, :site_url, :etag, :last_modified, :entries_count]
    KEYS_FOR_ENTRY  = [:title, :url, :author, :summary, :published, :categories]


    def initialize(url)
      @url = url
      @source = Feedzirra::Feed.fetch_and_parse(url)
    end


    delegate :title, :etag, :last_modified, :to => :source

    def feed_url
      source.feed_url
    end

    def site_url
      source.url
    end

    def entries_count
      source.entries.size
    end


    def attributes_for_full
      {}.tap do |hash|
        hash.merge!(attributes_for_head)
        hash.merge!(attributes_for_entries)
      end
    end

    def attributes_for_head
      {}.tap do |hash|
        KEYS_FOR_HEAD.each do |a|
          hash[a.to_s] = send(a)
        end
      end
    end

    def attributes_for_entries
      {}.tap do |hash|
        hash[:entries] = source.entries.map { |e| entry_to_attributes(e) }
      end
    end


    protected

      def entry_to_attributes(item)
        {}.tap do |hash|
          KEYS_FOR_ENTRY.each do |a|
            hash[a.to_s] = item.send(a)
          end
        end
      end

  end

end
