module Api
  class MessageDecorator < Draper::Decorator
    delegate_all

    # Define presentation-specific methods here. Helpers are accessed through
    # `helpers` (aka `h`). You can override attributes, for example:
    #
    #   def created_at
    #     helpers.content_tag :span, class: 'time' do
    #       object.created_at.strftime("%a %m/%d/%y")
    #     end
    #   end

    def text
      self.message_text.text
    end

    def image
      self.message_image.image
    end

    def file
      self.message_file.file
    end
  end
end
