class Ability
  include CanCan::Ability

  def initialize(user)
        if user.admin? 

            can :manage, :all

        else 
            can :update, Question do |question|
                question.user == user
            end

            can :destroy, Question do |question|
                question.user == user
            end

            can :destroy, Answer do |answer|
                answer.user == user
            end

            can :create, Question
            can :create, Answer
        
        end
  end
end
