# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'Rodney.ditch@hotmail.com'
  layout 'mailer'

  def change_location_mailer(user, _location)
    @user = user
    mail(to: 'OffTheLeashSuper@gmail.com',
         subject: 'Proposed location change')
  end
end
