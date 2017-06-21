class ApplicationDecorator < Draper::Decorator
  delegate :id, :to_model, :each

  def self.collection_decorator_class
    PaginatingDecorator
  end
end
