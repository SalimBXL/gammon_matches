# MATCHES Controller
class MatchesController < ApplicationController
  before_action :set_match, only: %i[show edit update destroy]
  before_action :create_new_match_object, only: %i[create]

  # GET /matches or /matches.json
  def index
    @matches = Match.last(8).reverse
  end

  # GET /matches/1 or /matches/1.json
  def show; end

  # GET /matches/new
  def new
    @match = Match.new
    @match.author = current_user
    @match.datetime = Time.current
    @match.status = :scheduled
  end

  # GET /matches/1/edit
  def edit; end

  # match /matches or /matches.json
  def create
    @match.author = current_user
    respond_to do |format|
      if @match.save
        format.html { redirect_to match_url(@match), notice: I18n.t('controllers.matches.create.success') }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1 or /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to match_url(@match), notice: I18n.t('controllers.matches.update.success') }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1 or /matches/1.json
  def destroy
    @match.destroy!
    respond_to do |format|
      format.html { redirect_to matches_url, notice: I18n.t('controllers.matches.destroy.success') }
      format.json { head :no_content }
    end
  end

  private

  def create_new_match_object
    @match = Match.new(match_params)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_match
    @match = Match.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  # Only allow a list of trusted parameters through.
  def match_params
    params.require(:match).permit(:title, :content, :author_id, :published_at)
  end
end
