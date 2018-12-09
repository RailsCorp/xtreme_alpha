module Api
  class MessageDecorator < Draper::Decorator
    delegate_all

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
