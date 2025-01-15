json.extract! task, :id, :name, :status, :comment, :task_list_id, :created_at, :updated_at
json.url task_url(task, format: :json)
