class DocumentsController < ApplicationController
  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    @document.save
    redirect_to document_path(@document), status: :see_other
  end

  private

  def document_params
    params.require(:document).permit(:url)
  end
end
