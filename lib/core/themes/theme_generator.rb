# frozen_string_literal: true

module Core
  module Themes
    # Represent texts that will be added in the future, after @offset sentences.
    class Future
      attr_accessor :texts, :offset

      def initialize(texts, offset)
        @texts = texts
        @offset = offset
      end

      def update
        @offset -= 1
      end

      def valid?
        @offset.negative?
      end
    end

    # Generator for themes
    class ThemeGenerator
      # Generate sentences for a given theme and players
      def self.generate(theme, players, options = {}) # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity
        queue = theme.events.to_a
        queue = queue.shuffle unless options[:shuffle] == false
        queue = queue.take(50)

        futures = []
        sentences = []

        until queue.empty?
          event = queue.shift

          # Replace {sips}
          event.texts = event.texts.map do |t|
            if t.include?('{sips}')
              t.gsub(/\{sips\}/, event.sips.to_s)
            else
              t
            end
          end

          # Replace {player_?}
          unknown_players = event.texts.join('\n').scan(/\{player_[A-Z]\}/).uniq
          players_list = players.dup
          players_sub = Hash[ *unknown_players.collect do |v|
            player_name = players_list.sample
            [v, players_list.delete(player_name)]
          end.flatten ]
          event.texts = event.texts.map do |t|
            t.scan(/\{player_[A-Z]\}/).each do |cap|
              t = t.gsub(cap, players_sub[cap])
            end
            t
          end

          # Inspect kind and process it accordingly
          if event.kind == 'curse'
            sentences += event.texts[0..event.first - 1]
            futures.push(Future.new(event.texts[event.first..], event.turns))
          else
            sentences += event.texts
          end

          # Decrease futures offsets and add them to the queue if they are valid
          futures.each do |f|
            f.update
            sentences += futures.delete(f).texts if f.valid?
          end
        end

        # Adding remaining futures (useless since the game is over)
        until futures.empty?
          future = futures.shift
          sentences += future.texts
        end

        sentences
      end
    end
  end
end
