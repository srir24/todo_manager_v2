class User < ActiveRecord::Base
  def to_pleasant_user
    "#{name} #{email}"
  end
end
