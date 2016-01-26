module Sendbird
  class User

    PATH = "user"

    include Virtus.model

    attribute :id, String
    attribute :user_id, String
    attribute :nickname, String
    attribute :access_token, String


    def create
      response = client.post("#{PATH}/create", params)

      if response.status == 200
        user_json = JSON.parse response.body
        created_user = self.class.new(user_json)
      else

      end

      created_user
    end

    def persisted?
      !user_id.nil?
    end

    private

      def params
        {
          id: id,
          nickname: nickname
        }
      end

      def client
        @client ||= Client.new
      end

  end
end