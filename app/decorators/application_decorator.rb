class ApplicationDecorator < Draper::Decorator
  delegate :id, :to_model

  def self.collection_decorator_class
    PaginatingDecorator
  end
end
