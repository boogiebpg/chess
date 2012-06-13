class Admin::ExcelController < Admin::CommonController

  def new
    
  end

  def create

    Spreadsheet.client_encoding = 'UTF-8'
    
    begin
      book = Spreadsheet.open params[:file].path
    rescue Ole::Storage::FormatError
      flash[:alert] = t("alert.invalid_format")
      redirect_to new_admin_excel_path
      return 1
    rescue
      flash[:alert] = t("alert.excel_nofile")
      redirect_to new_admin_excel_path
      return 1
    end
    correct_lines = incorrect_lines = 0
    book.worksheets.each do |sheet|
      sheet.each do |row|
        e = Excel.new
        correct_lines += e.check_format_and_save row
      end
    end
    flash[:notice] = t("notice.added_lines", :count => correct_lines)
      
    redirect_to admin_prices_path

    

  end

end
