module TriviaModal

  def on_load
    # Close modal on tap or swipe
    view.on_tap do
      close
    end
    view.on_swipe :left do
      close
    end
    view.on_swipe :right do
      close
    end
  end

end