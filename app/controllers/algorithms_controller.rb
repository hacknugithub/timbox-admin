class AlgorithmsController < ApplicationController
  before_action :authenticate_user!

  def index
    @input_words = params[:words]
    @palindromes = []

    @error = nil

    if @input_words.present? 
      valid_words_count = @input_words.split(',').map(&:strip).reject(&:blank?).size
      if valid_words_count > 1
        begin
          @palindromes = PalindromeChecker.call(@input_words)
        rescue StandardError => e
          @error = "Ocurrió un error al procesar las palabras: #{e.message}"
        end
      else
        @error = "Por favor, ingresa al menos dos palabras separadas por comas."
      end
    end
  end
end