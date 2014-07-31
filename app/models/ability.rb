class Ability
  include CanCan::Ability

  def initialize(customer)
    customer ||= Customer.new

    if customer.role? :admin
      can :destroy, :all
    elsif customer.role? :user
       can(:manage , Order){ |order| order.customer_id == customer.id }
      
       #random change

      # equal to
      # can(:update , Album){ |resource| resource.user_id == user.id }
      # can(:update , Song){ |resource| resource.user_id == user.id }
      # can(:update , Artist){ |resource| resource.user_id == user.id }
      # can(:update , Mixtape){ |resource| resource.user_id == user.id }
      
    end
  
  end



end


