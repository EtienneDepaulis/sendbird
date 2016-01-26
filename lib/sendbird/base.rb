module Sendbird
  class Base

    include Virtus.model

    def persisted?
      !reference_id.nil?
    end

    private

      def path
        raise "path needs to be defined for this model"
      end

      def reference_id
        raise "reference_id needs to be defined for this model"
      end

      def params
        {}
      end

      def client
        @client ||= Client.new
      end

  end
end