class DocumentsController < ApplicationController
  require "csv"

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    @document.save
    redirect_to document_path(@document), status: :see_other
  end

  def show
    @document = Document.find(params[:id])
    filepath = "/var/folders/11/zd366pys0hx8ndm2c2md8dtr0000gn/T/RackMultipart20221115-86792-7bejys.csv"
    CSV.read("/var/folders/11/zd366pys0hx8ndm2c2md8dtr0000gn/T/RackMultipart20221115-86792-7bejys.csv")
    table = CSV.parse(File.read("/var/folders/11/zd366pys0hx8ndm2c2md8dtr0000gn/T/RackMultipart20221115-86792-7bejys.csv"), headers: true, col_sep: ";")
    raise
  end

  private

  def document_params
    params.require(:document).permit(:url)
  end
end
