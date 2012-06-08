class Admin::ExcelController < ApplicationController

  def new
    # @new_excel = Excel.create
  end

  def create

    Spreadsheet.client_encoding = 'UTF-8'
    
    book = Spreadsheet.open params[:file].path
    sheet1 = book.worksheet 0
    flash[:notice] = "Added #{sheet1.count} lines"
      
    redirect_to admin_prices_path

    rescue Ole::Storage::FormatError
      flash[:notice] = "Invalid file format!"
      redirect_to new_admin_excel_path

  end

end
