class NewslettersController < ApplicationController

  

  # GET /newsletters/new
  def new
    @newsletter = Newsletter.new
  end

  # POST /newsletters
  # POST /newsletters.json
  def create
    @newsletter = Newsletter.new(newsletter_params)

    respond_to do |format|
      if @newsletter.save
        format.html { redirect_to root_path, notice: 'Newsletter a été créée avec succès.' }
      end
    end
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsletter_params
      params.require(:newsletter).permit(:email)
    end
end
