json.extract! post, :id, :title, :text, :autor_id, :comment_counter, :like_counter, :created_at, :updated_at
json.url post_url(post, format: :json)
