module TriviaModal

  def on_load
    # Close modal on tap or swipe
    find(view).on(:tap) do
      close
    end
    find(view).on(:swipe_left) do
      close
    end
    find(view).on(:swipe_right) do
      close
    end
  end

end