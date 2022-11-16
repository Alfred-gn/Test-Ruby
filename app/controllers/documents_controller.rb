class DocumentsController < ApplicationController
  require "csv"

  def new
    # Création d'une coquille vide pour le simple_form
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    # Scraping
    filepath = params["document"]["url"]
    table = CSV.parse(File.read(filepath), headers: true, col_sep: ";")
    # Calculer les indicateurs qui nous intéressent (directement ou en appelant des méthodes)
    @document.nbresa = table["Numero billet"].count
    nb_buyers
    buyersage_average
    resaprice_average
    @document.save
    redirect_to document_path(@document), status: :see_other
  end

  def show
    # trouver le document recherché avec la méthode find
    @document = Document.find(params[:id])
  end

  private

  def nb_buyers
    # scraping
    filepath = params["document"]["url"]
    table = CSV.parse(File.read(filepath), headers: true, col_sep: ";")
    # créer un array avec les emails uniques
    unqiue_email = []
    table["Email"].each do |email|
      unqiue_email << email if unqiue_email.exclude? email
    end
    # .count pour compter le nb d'email unique
    @document.nbbuyers = unqiue_email.count
  end

  def buyersage_average
    # scraping
    filepath = params["document"]["url"]
    table = CSV.parse(File.read(filepath), headers: true, col_sep: ";")
    # convertir la colonne age en integer et compter les valeurs non vides
    age_integer = []
    age_size = 0
    table["Age"].each do |age|
      age_size += 1 if !age.nil?
      age_integer << age.to_i
    end
    # calcul de la moyenne
    @document.buyersage = age_integer.sum / age_size
  end

  def resaprice_average
    # scraping
    filepath = params["document"]["url"]
    table = CSV.parse(File.read(filepath), headers: true, col_sep: ";")
    # convertir les prix en integer dans un nouvel array
    price_integer = []
    table["Prix"].each do |price|
      price_integer << price.to_i
    end
    # calcul de la moyenne
    @document.resaprice = (price_integer.sum.to_f / price_integer.size.to_f).round(2)
  end

  def document_params
    params.require(:document).permit(:url)
  end
end
