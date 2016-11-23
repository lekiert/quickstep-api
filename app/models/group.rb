class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :teachers, :join_table => :groups_teachers,
                                     :association_foreign_key => :user_id
end
