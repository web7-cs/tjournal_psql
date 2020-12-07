class LearningDictionaryController < ApplicationController
  # before_action :set_scope, only: :index

  def index
    @learning_dictionary = LearningDictionary.all
  end

  # def set_scope
  #   @learning_dictionary = LearningDictionary.all
  #   if params[:search]
  #     title = search_title
  #     content = search_content
  #     ld_ids = title | content
  #     @learning_dictionary = @learning_dictionary.find(learning_dictionary_ids)
  #   end
  # end

  # def search_title
  #   @learning_dictionary.where(
  #     "title ilike ? OR description ilike ?",
  #     "%#{params[:search]}%","%#{params[:search]}%"
  #   ).pluck(:id)
  # end

  # def search_content
  #   @learning_dictionary.joins(:action_text_rich_text)
  #     .where(
  #       "action_text_rich_texts.body ilike ?",
  #       "%#{params[:search]}%"
  #     ).pluck(:id)
  # end

  
end
