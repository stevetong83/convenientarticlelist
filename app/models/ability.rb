class Ability
  include CanCan::Ability


    def initialize(user)
      user ||= User.new # guest user (not logged in)

      if user.has_role? :admin
        can :manage, :all
      else
        can :manage, Site do |site|
          site.try(:user) == user
        end
      end
    end

end
