# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  def date_shown
    if updated_at == nil
    t = created_at.in_time_zone("London")
    t.strftime("%a %b %e %T")
  else
    t = updated_at.in_time_zone("London")
    t.strftime("%a %b %e %T")
    end
  end


end
