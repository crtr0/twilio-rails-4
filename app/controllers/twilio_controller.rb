require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header

  def sms
  	response = Twilio::TwiML::Response.new do |r|
  	  r.Say 'hello there', :voice => 'alice'
  	  r.Dial :callerId => '+14159992222' do |d|
  	    d.Client 'jenny'
  	  end
  	end

  	render_twiml response
  end
end