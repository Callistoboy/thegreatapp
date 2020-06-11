class WorksController < ApplicationController
  include WorkImage

  # GET /works
  # GET /works.json
  def index
    @images_count = Image.all.count
    @selected_theme = "Select theme to leave your answer"
    @selected_theme = t('themes.def_select_theme')
    @selected_image_name = 'Оценка современных интерьеров'
    @values_qty = Value.all.count
    @themes = Theme.all.pluck(:name)
    session[:selected_theme_id] = @selected_theme # to display nothing
  end

  # @note: use in views
  def choose_theme
    @themes = Theme.all.pluck(:name)
    respond_to do |format|
      format.html { render choose_theme_path }
      format.js
    end
  end

  # @note: first display_theme and show first image from image array
  def display_theme

    @image_data = {}
    # I18n.locale = session[:current_locale]

    theme = params[:theme]
    logger.info(theme.inspect)
    theme_id = Theme.find_theme_id(theme).id
    data = show_image(theme_id, 0)
    session[:selected_theme_id] = theme_id

    image_data(theme, data)
  end

  # @note: this method should show image without diag
  #   then - start to calculate diag
  def results_list
    @selected_theme_id = session[:selected_theme_id]
    res_composite_diag = Image.where(theme_id: @selected_theme_id).order("ave_value DESC")
    composite_results_size = res_composite_diag.size
    @composite_results = res_composite_diag.take(composite_results_size)
    @composite_results_paged = pages_of(@composite_results, 6)
  end

end