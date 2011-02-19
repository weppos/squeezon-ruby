require 'feedzirra'

module Squeezon

  class Feed

    attr_reader :url, :source


    def initialize(url)
      @url = url
      @source = Feedzirra::Feed.fetch_and_parse(url)
    end


    def head
      @head ||= Head.new(source)
    end

    def entries
      @entries ||= Entries.new(source.entries)
    end

    def to_squeezon
      {}.tap do |hash|
        hash.merge!(head.to_squeezon)
        hash.merge!(entries.to_squeezon)
      end
    end


    class Head

      ATTRIBUTES = [:title, :url, :feed_url, :site_url, :etag, :last_modified, :entries_count]

      attr_reader :source

      def initialize(source)
        @source = source
      end

      def title
        source.title
      end

      def url
        source.url
      end

      def feed_url
        source.feed_url
      end

      def site_url
        source.url
      end

      def etag
        source.etag
      end

      def last_modified
        source.last_modified
      end

      def entries_count
        source.entries.size
      end


      def to_squeezon
        {}.tap do |hash|
          ATTRIBUTES.each do |a|
            hash[a.to_s] = send(a)
          end
        end
      end

    end

    class Entry

      ATTRIBUTES  = [:title, :url, :author, :summary, :published, :categories]

      attr_reader :source

      def initialize(source)
        @source = source
      end


      def to_squeezon
        {}.tap do |hash|
          ATTRIBUTES.each do |a|
            hash[a.to_s] = source.send(a)
          end
        end
      end

    end

    class Entries < Array

      def initialize(items)
        super(items.map { |e| Entry.new(e) })
      end

      def to_squeezon
        { :entries => map(&:to_squeezon) }
      end

    end

  end

end
