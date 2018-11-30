class Api::TaskDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:

  def created_at
    helpers.content_tag :span, class: "time" do
      object.created_at.strftime("%a %m/%d/%y")
    end
  end

  def deadline
    object.deadline.strftime("%a %y/%m/%d")
  end
end