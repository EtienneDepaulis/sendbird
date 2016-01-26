module Sendbird
  class Messaging < Base

    attribute :id, String
    attribute :name, String
    attribute :channel_url, String


    def create
      response = client.post("#{path}/create", params)

      if response.status == 200
        json = JSON.parse response.body
        created_messaging = self.class.new(json)
        created_messaging.channel_url = json["channel"]["channel_url"]
      else

      end

      created_messaging
    end

    private

      def path
        "messaging"
      end

      def reference_id
        channel_url
      end

      def params
        {
          name: name
        }
      end

  end
end