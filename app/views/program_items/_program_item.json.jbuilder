json.extract! program_item, :id, :title, :description_de, :description_en, :start_time, :duration, :language, :min_age, :min_player_count, :max_player_count, :references, :created_at, :updated_at
json.url program_item_url(program_item, format: :json)
