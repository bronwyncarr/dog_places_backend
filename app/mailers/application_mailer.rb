# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'Rodney.ditch@hotmail.com'
  layout 'mailer'
end
