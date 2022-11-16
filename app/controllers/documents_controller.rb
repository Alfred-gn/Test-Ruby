class DocumentsController < ApplicationController
  require "csv"

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    @document.save
    filepath = params["document"]["url"]
    CSV.read(filepath)
    table = CSV.parse(File.read(filepath), headers: true, col_sep: ";")
    redirect_to document_path(@document), status: :see_other
  end

  def show

  end

  private

  def document_params
    params.require(:document).permit(:url)
  end
end
