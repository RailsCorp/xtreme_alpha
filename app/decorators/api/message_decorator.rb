module Api
  class MessageDecorator < Draper::Decorator
    delegate_all

    def text
      if self.message_text.present?
        self.message_text.text
      else
        nil
      end
    end

    def image
      if self.message_image.present?
        self.message_image.image
      else
        nil
      end
    end

    def file
      if self.message_file.present?
        self.message_file.file
      else
        nil
      end
    end
  end
end
