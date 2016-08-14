class MemberNetwork < ApplicationRecord
   belongs_to :member, class_name: 'User'
   belongs_to :network
end
