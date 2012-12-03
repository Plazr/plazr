require 'spec_helper'

describe Store do
     
  it "should create a new store given valid attributes" do
    FactoryGirl.create(:store).should be_valid
  end
  
  it "is invalid without a name" do
    store = FactoryGirl.build(:store, name: nil)
    store.should have(1).error_on(:name)
  end
  
  it "is invalid without a email" do
    store = FactoryGirl.build(:store, email: nil)
    store.should have(1).error_on(:email)
  end
  
  it "should have a valid phone number" do
    FactoryGirl.build(:store, phone: "911551").should_not be_valid
  end
  
  it "should should respond to store_categories" do
    store = FactoryGirl.create(:store)
    store.should has_many(:store_categories)
  end
  
  
  
end

