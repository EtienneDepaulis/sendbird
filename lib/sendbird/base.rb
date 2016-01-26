module Sendbird
  class Base

    include Virtus.model

    def create
      response = client.post("#{path}/create", params)

      if response.status == 200
        json = JSON.parse response.body
        created_element = self.class.new(json)
      else

      end

      created_element
    end

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