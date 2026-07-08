module JsonPlaceholder
  class Client
    include HTTParty
    base_uri 'https://jsonplaceholder.typicode.com'

    headers 'Content-Type' => 'application/json; charset=UTF-8'

    class << self
      def list_posts
        response = get('/posts')
        response.success? ? response.parsed_response : []
      end

      def find_post(post_id)
        response = get("/posts/#{post_id}")
        response.success? ? response.parsed_response : nil
      end

      def create_post(post_params)
        response = post('/posts', body: post_params.to_json)
        response.success? ? response.parsed_response : nil
      end

      def update_post(post_id, post_params)
        response = put("/posts/#{post_id}", body: post_params.to_json)
        response.success? ? response.parsed_response : nil
      end

      def delete_post(post_id)
        response = delete("/posts/#{post_id}")
        response.success? ? response.parsed_response : nil
      end
    end
  end
end