json.extract! post, :id, :texto, :compartir, :likes, :created_at, :updated_at
json.url post_url(post, format: :json)
