class Admin::CommonController < ApplicationController
 
  http_basic_authenticate_with :name => (Auth.first.try(:name).nil? ? "admin" : Auth.first.try(:name)),
    :password => (Auth.first.try(:password).nil? ? "admin" : Auth.first.try(:password))


end
