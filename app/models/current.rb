class Current < ActiveSupport::CurrentAttributes

    # this is class that we will be using in the request
    # we can assign things like the user, timezone, which account they are on
    # when user is not logged in, current.user will be nil
    # after someone logged in, current.user will have the detials of the user logged in (seperated from each request)

    attribute:user
end