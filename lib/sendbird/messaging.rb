module Sendbird
  class Messaging < Base

    attribute :id, String
    attribute :name, String
    attribute :channel_url, String
    attribute :last_message, String
    attribute :last_message_ts, Integer
    attribute :members, Array[Sendbird::User]
    attribute :created_at, String
    attribute :channel_url, String



    def create

      params = {
        name: name
      }

      response = client.post("#{path}/create", params)

      if response.status == 200
        json = JSON.parse response.body
        json["channel_url"] = json["channel"]["channel_url"]

        created_messaging = self.class.new(json)
      else

      end

      created_messaging
    end

    def invite(users)
      users = Array(users)

      params = {
        channel_url: channel_url,
        users_ids: users.map(&:id)
      }

      response = client.post("#{path}/invite", params)

      if response.status == 200
      else

      end

      self
    end

    def view

      params = {
        channel_url: channel_url
      }

      response = client.post("#{path}/view", params)

      if response.status == 200
        json = JSON.parse response.body

        json["members"].each do |member|
          member["user_id"] = member["id"]
          member["nickame"] = member["name"]
        end

        element = self.class.new(json)
      else

      end

      element
    end

    private

      def path
        "messaging"
      end

      def reference_id
        channel_url
      end

      def params

      end

  end
end