class UserPolicy < ApplicationPolicy
    def index?
        true # user.admin? || user.regular?
    end
  
    def show?
        true
    end
  
    def new?
      true
    end
  
    def create?
      new?
    end
  
    def edit?
        true
    end
  
    def update?
      edit?
    end
  
    def destroy?
      edit?
    end
  end
  