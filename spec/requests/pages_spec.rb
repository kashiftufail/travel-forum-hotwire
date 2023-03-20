require 'rails_helper'
require 'spec_helper'


describe RSpec.describe "/pages" , type: :request  do 

describe 'GET /about' do
  it 'renders a successfull response on about page' do
    get '/about'
    expect(response).to be_successful 
  end     
end

describe 'GET /contact' do
  it 'renders a successfull response on about page' do
    get '/contact'
    expect(response.body).to include("<h1>Contact For Any Query</h1>")
    expect(response).to be_successful 
  end     
end


end    