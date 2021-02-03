class LocationNotifierMailer < ApplicationMailer
  default from: 'Rodney.ditch@hotmail.com'
#sends email to admin withproposed changetolocation for admin to change pending review
# we pass the user who wants the change as well as the location object with the proposed changes to the object for use in the mailer
  def change_location_mailer(user, location)
    @user = user
    @location = location
    mail(to: 'OffTheLeashSuper@gmail.com',
         subject: 'Proposed location change')
  end
  def delete_location_mailer(user,location,reason)
    @user = user
    @location= location
    @reason = reason
    mail(to: 'OffTheLeashSuper@gmail.com',
      subject: 'Location delete request')
    end
end

