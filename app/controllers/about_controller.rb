class AboutController < ApplicationController
  def index
    @faqs = Faq.all
    @resources = Resource.all
  end
end
