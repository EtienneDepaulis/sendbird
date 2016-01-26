module Sendbird
  class User < Base

    attribute :id, String
    attribute :user_id, String
    attribute :nickname, String
    attribute :access_token, String

    def create
      json = client.post("#{path}/create", params)

      self.class.new(json)
    end

    private

      def path
        "user"
      end

      def reference_id
        user_id
      end

      def params
        {
          id: id,
          nickname: nickname
        }
      end

  end
end