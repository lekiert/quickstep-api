class CourseResource < JSONAPI::Resource
  attributes :name, :description, :level

  def level
    @model.level.name
  end
end
