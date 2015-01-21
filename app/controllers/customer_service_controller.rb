require 'ostruct'

class CustomerServiceController < ApplicationController

  def agent
    # Hard code a default customer to display. In production, this
    # would come from a database.
    @customer = OpenStruct.new(
      'id' => '123',
      'first_name' => 'Jane',
      'last_name' => 'Doe',
      'city' => 'Seattle',
      'state' => 'WA'
    )

    capability = Twilio::Util::Capability.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    capability.allow_client_outgoing Rails.application.secrets.twilio_twiml_app_sid
    @token = capability.generate()

  end

end