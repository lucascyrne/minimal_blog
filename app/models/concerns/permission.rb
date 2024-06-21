# app/models/concerns/permission.rb
module Permission
  ROLES = {
    "admin" => ["create_post", "edit_post", "delete_post", "view_post", "like_post"],
    "member" => ["view_post", "like_post"]
  }

  def self.allowed?(user, action)
    return true if user.role == "admin"

    user.memberships.any? do |membership|
      ROLES[user.role]&.include?(action)
    end
  end
end
