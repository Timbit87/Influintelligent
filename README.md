Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

## Active storage migration
```
rails active_storage:install
rails db:migrate
```

## config/storage.yml
```
local:
  service: Disk
  root: <%= Rails.root.join("storage") %>
```

## config/environments/development.rb
```
config.active_storage.service = :local
```